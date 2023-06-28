import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Future<void> permissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.camera,
      Permission.photos,
      Permission.videos,
      Permission.audio,
      Permission.storage,
      Permission.notification,
    ].request();

    statuses.forEach((
      Permission permission,
      PermissionStatus permissionStatus,
    ) {
      switch (permissionStatus) {
        case PermissionStatus.denied:
          permission.request();
          break;
        case PermissionStatus.permanentlyDenied:
          log('permissionStatus : $permissionStatus', name: 'PERMISSION');
          // openAppSettings();
          break;
        default:
      }
    });
  }
}
