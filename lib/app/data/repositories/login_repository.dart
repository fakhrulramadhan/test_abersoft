import 'dart:developer';

import 'package:test_abersoft/app/data/models/login/login.dart';
import 'package:test_abersoft/app/data/providers/login_provider.dart';
import '../../../mixin/cache_fcm.dart';
import '../../../mixin/cache_manager.dart';

class LoginRepository with CacheManager, CacheFcm {
  final LoginProvider _loginProvider;
  LoginRepository(this._loginProvider);

  Future<Login> login({
    required String username,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> loginBody = {
        'username': username,
        'password': password,
      };
      final resLoginData = await _loginProvider.login(loginBody);
      // saveToken(resLoginData.token);
      // saveRefreshToken(resLoginData.refreshToken);

      // await setupFcmToken();

      return Future.value(resLoginData);
    } catch (error) {
      log('$error', name: 'Logging : Login Error', error: error);
      return Future.error(error);
    }
  }

  // Future<dynamic> logout() async {
  //   try {
  //     final resData = await _notificationProvider.sendFcmToken('-');
  //     await FirebaseMessaging.instance.deleteToken();

  //     removeToken();
  //     removeAllMyAttendancesOffline();
  //     removeFcmToken();

  //     return Future.value(resData['result']);
  //   } catch (error) {
  //     log('$error', name: 'Logging : Logout Error', error: error);

  //     return Future.error(error);
  //   }
  // }
}
