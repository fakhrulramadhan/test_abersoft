// ignore_for_file: constant_identifier_names

import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  Future<bool> saveRefreshToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.REFRESH_TOKEN.toString(), token);
    return true;
  }

  String? getRefreshToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.REFRESH_TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
    await box.remove(CacheManagerKey.REFRESH_TOKEN.toString());
  }

  bool get authed {
    return getToken() != null ? true : false;
  }
}

enum CacheManagerKey { TOKEN, REFRESH_TOKEN }
