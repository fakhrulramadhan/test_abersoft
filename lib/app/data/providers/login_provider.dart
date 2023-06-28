import 'package:test_abersoft/app/core/error_handling/exceptions.dart';
import 'package:test_abersoft/app/data/models/login/login.dart';
import './http_provider.dart';

class LoginProvider extends HttpProvider {
  LoginProvider() {
    super.onInit();
  }

  /// Method : POST
  /// Login
  Future<Login> login(Map<String, dynamic> body) async {
    try {
      final resData = await post('/login', body,
          headers: {"token": "123123123123123123123"});

      switch (resData.statusCode) {
        case 200:
          return Login.fromJson(resData.body['data']);
        case 401:
          var message = resData.body['error']['message'];
          String responseResult = message['username'] ?? message['password'];
          return Future.error(UnauthorisedException(responseResult));
        default:
          return Future.error(handleResponse(resData));
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  // Future<ForgotPasswordModel> forgotPasswordApi({required String email}) async {
  //   try {
  //     final response = await post('/forgot-password', {"email": email});

  //     if (response.hasError) {
  //       return Future.error(handleResponse(response));
  //     } else {
  //       return ForgotPasswordModel.fromJson(response.body);
  //     }
  //   } catch (e) {
  //     return Future.error(e);
  //   }
  // }
}


// Future<Login> login(Map<String, dynamic> body) async {
//   try {
//     final resData = await post('/login', body);

//     switch (resData.statusCode) {
//       case 200:
//         return Login.fromJson(resData.body['data']);
//       case 401:
//         var message = resData.body['error']['message'];
//         String responseResult = message['username'] ?? message['password'];
//         return Future.error(UnauthorisedException(responseResult));
//       default:
//         return Future.error(handleResponse(resData));
//     }
//   } catch (e) {
//     return Future.error(e);
//   }
// }
