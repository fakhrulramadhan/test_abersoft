// ignore_for_file: constant_identifier_names

import 'package:get_storage/get_storage.dart';

mixin CacheFcm {
  Future<bool> saveFcmToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheFcmKey.FCM_TOKEN.toString(), token);
    return true;
  }

  String? getFcmToken() {
    final box = GetStorage();
    return box.read(CacheFcmKey.FCM_TOKEN.toString());
  }

  Future<void> removeFcmToken() async {
    final box = GetStorage();
    await box.remove(CacheFcmKey.FCM_TOKEN.toString());
  }
}

enum CacheFcmKey { FCM_TOKEN }
