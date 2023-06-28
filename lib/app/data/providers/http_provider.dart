import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get/get_connect/connect.dart';
import 'package:test_abersoft/app/core/error_handling/exceptions.dart';
import 'package:test_abersoft/app/core/helpers/feedback_helpers.dart';
import 'package:test_abersoft/app/core/utils/environment_util.dart';
import 'package:test_abersoft/app/data/models/refresh_token/refresh_token.dart';
import 'package:test_abersoft/app/mixin/cache_manager.dart';
import 'package:test_abersoft/app/routes/app_pages.dart';

class HttpProvider extends GetConnect with CacheManager {
  //CacheMyAttendancesOffline? _cacheMyAttendancesOffline;

  @override
  void onInit() {
    final String apiUrl = EnvironmentUtil.apiUrl();

    httpClient.baseUrl = apiUrl;
    httpClient.defaultContentType = "application/json";

    log('${httpClient.baseUrl}', name: 'Logging : END POINT');

    httpClient.addRequestModifier<dynamic>((request) {
      log(request.url.path, name: 'Logging : Add Request Modifier');

      if (request.url.toString() == '$apiUrl/login') return request;
      if (request.url.toString() == '$apiUrl/refresh') return request;
      if (request.url.toString() == '$apiUrl/forgot-password') return request;

      String? token = getToken();

      if (token?.isNotEmpty == true) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      return request;
    });

    httpClient.addResponseModifier((request, response) async {
      if (request.url.toString() == '$apiUrl/login') return response;
      if (request.url.toString() == '$apiUrl/refresh') return response;
      if (request.url.toString() == '$apiUrl/forgot-password') return response;

      if (response.statusCode == HttpStatus.unauthorized) {
        try {
          final resData = await _refreshTokenApi();
          saveToken(resData.token);
          request.headers['Authorization'] = 'Bearer ${resData.token}';
          print(resData.token);

          log(request.url.path,
              name: 'Logging : Success Add Response Modifier');
        } catch (e) {
          FeedbackHelper.alertDialog(
              title: 'Peringatan',
              onPressed: () async {
                removeToken();

                Get.offAllNamed(Routes.LOGIN);
              },
              textBtn: 'Ok');

          log('$e',
              name: 'Logging : Add Response Modifier Error',
              error: 'Logging : $e');
        }
      }

      return response;
    });

    httpClient.addAuthenticator<dynamic>((request) async {
      log(request.url.path, name: 'Logging : Add Authenticator');
      return request;
    });

    // httpClient.maxAuthRetries = 3;
  }

  Future<RefreshToken> _refreshTokenApi() async {
    try {
      final refreshToken = getRefreshToken();

      final response = await post('/refresh', {}, headers: {
        'Authorization': 'Bearer $refreshToken',
      });

      if (response.status.hasError) {
        return Future.error(handleResponse(response));
      }

      return RefreshToken.fromJson(response.body['data']);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  dynamic handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
        throw BadRequestException(response.body['error']['message']);
      case 401:
      case 403:
        throw UnauthorisedException(response.body['error']['message']);
      case 404:
        throw NotFoundException(response.body['error']['message']);
      case 413:
        throw RequestEntityException(response.body['error']['message']);
      case 500:
        String? message;
        try {
          message = response.body['error']['message'];
        } catch (e) {
          message = 'Server Maintenance';
        }
        throw FetchDataException(message);
      default:
        throw NoInternetException();
    }
  }
}
