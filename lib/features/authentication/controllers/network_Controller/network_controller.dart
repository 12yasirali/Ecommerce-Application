import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utils/popups/loader.dart';

class NetworkHelper extends GetxController {
  static NetworkHelper get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result.isNotEmpty) {
        _updateConnectionStatus(result.first);
      } else {
        _updateConnectionStatus(ConnectivityResult.none);
      }
    });
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      YLoaders.warningSnackBar(title: "No Internet Connection");
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result.first != ConnectivityResult.none;
    } on PlatformException catch (_) {
      rethrow;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
    _connectionStatus.close();
  }
}
