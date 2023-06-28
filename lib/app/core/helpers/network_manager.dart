import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  final connectionStatus = 0.obs;

  final Connectivity connectivity = Connectivity();
  late StreamSubscription streamSubscription;

  @override
  onInit() {
    super.onInit();
    _getConnectionType();

    streamSubscription =
        connectivity.onConnectivityChanged.listen(_updateState);
  }

  @override
  void onClose() {
    streamSubscription.cancel();
  }

  Future<void> _getConnectionType() async {
    ConnectivityResult? connectivityResult;

    try {
      connectivityResult = await (connectivity.checkConnectivity());
    } on PlatformException catch (error) {
      log('error : $error', error: 'Logging : _getConnectionType');
    }

    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult? result) {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        connectionStatus(1);
        update();
        break;
      case ConnectivityResult.none:
        connectionStatus(0);
        update();
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get network status');
        break;
    }
  }
}
