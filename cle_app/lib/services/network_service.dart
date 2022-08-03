import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class NetworkService {
  Future<bool> isConnected() async {
    final Connectivity _connectivity = Connectivity();
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return false;
    }

    switch (result) {
      case ConnectivityResult.ethernet:
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.bluetooth:
        return true;
      case ConnectivityResult.none:
        return false;
    }
  }
}
