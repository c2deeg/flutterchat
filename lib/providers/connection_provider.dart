// import 'dart:async';

// import 'package:cle_app/widgets/widgets.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';

// class ConnectionProvider extends ChangeNotifier {
//   ConnectivityResult _connectionStatus = ConnectivityResult.none;
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;

//   // bool subscribeToConnection() {
//   //   late ConnectivityResult result;
//   //   _connectivitySubscription =
//   //       Connectivity().onConnectivityChanged.listen((event) {
//   //     result = event;
//   //   });
//   // }

//   Future<void> initConnectivity() async {
//     late ConnectivityResult result;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       result = await _connectivity.checkConnectivity();
//     } on PlatformException catch (e) {
//       final dialog = AdaptiveDialog(
//         context: context,
//         title: "Something happened...",
//         content: '${e.message}',
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       );

//       await dialog.showAdaptiveDialog(context);
//       return;
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) {
//       return Future.value(null);
//     }

//     return _updateConnectionStatus(result);
//   }

//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     _connectionStatus = result;
//     notifyListeners();
//   }

//   bool streamResult(ConnectivityResult result) {
//     switch (result) {
//       case ConnectivityResult.ethernet:
//       case ConnectivityResult.wifi:
//       case ConnectivityResult.mobile:
//       case ConnectivityResult.bluetooth:
//         return true;
//       case ConnectivityResult.none:
//         return false;
//     }
//   }

//   void cancelConnectionSubscription() {
//     _connectivitySubscription.cancel();
//   }
// }
