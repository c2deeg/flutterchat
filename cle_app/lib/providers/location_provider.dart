import 'dart:io';

import 'package:cle_app/services/location_service.dart';
import 'package:cle_app/util/navigator/navigator.dart';
import 'package:cle_app/widgets/adaptive/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _hasPermission = false;
  bool _locationOn = false;
  Position? _currentLocation;
  Position? _lastKnownLocation;

  bool get isLoading => _isLoading;
  bool get hasPermission => _hasPermission;
  bool get locationOn => _locationOn;
  Position? get currentLocation => _currentLocation;
  Position? get lastKnownLocation => _lastKnownLocation;

  LocationProvider() {
    init();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setPermission(bool perm) async {
    _hasPermission = perm;
    notifyListeners();
  }

  setEnabled(bool isenabled) async {
    _locationOn = isenabled;
    notifyListeners();
  }

  setLastKnownLocation(Position? position) async {
    _lastKnownLocation = position ??
        Position(
            longitude: 28.1576,
            latitude: -81.4849,
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 0);
  }

  setCurrentLocation(Position position) async {
    _lastKnownLocation = position;
  }

  pingLocation() async {
    return await LocationService().getCurrentPosition();
  }

  permissionPopup(BuildContext context) {
    AdaptiveDialog(
            dismissable: false,
            title: "Location Permission Needed",
            content:
                'Your device location required. Please allow DriveCLE to use your location in settings.',
            actions: [
              TextButton(
                  onPressed: () async {
                    await setPermission(await LocationService().hasPermission);
                    if (hasPermission) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Done')),
              TextButton(
                  onPressed: () async {
                    await LocationService().openAppSettings();
                    await setPermission(await LocationService().hasPermission);
                    if (hasPermission) {
                      setLoading(false);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('App Settings')),
            ],
            context: context)
        .showAdaptiveDialog(context);
  }

  locationRequired(BuildContext context) {
    AdaptiveDialog(
            dismissable: false,
            title: "Location Required",
            content: 'For a better experience. Please turn on your location.',
            actions: Platform.isAndroid
                ? [
                    TextButton(
                        onPressed: () async {
                          await LocationService().openLocationSettings();
                        },
                        child: const Text('Location Settings')),
                  ]
                : [
                    CupertinoDialogAction(
                      child: const Text('Location Settings'),
                      onPressed: () async {
                        await LocationService().openLocationSettings();
                      },
                    ),
                  ],
            context: context)
        .showAdaptiveDialog(context);
  }

  watchService() async {
    if (hasPermission && locationOn) {
      setLastKnownLocation(await LocationService().getLastKnownPosition());
      setCurrentLocation(await pingLocation());
      setLoading(false);
    }
    Geolocator.getServiceStatusStream().listen(
      (event) async {
        setLoading(false);
        final enabled = event == ServiceStatus.enabled;
        if (enabled) {
          Navigator.pop(AppRouter.rootNavigator.currentContext!);
          LocationService().onServiceEnabled;
          setLastKnownLocation(await LocationService().getLastKnownPosition());
          setCurrentLocation(await pingLocation());
        } else {
          locationRequired(AppRouter.rootNavigator.currentContext!);
        }
      },
    );
  }

  init() async {
    setLoading(true);
    await setPermission(await LocationService().hasPermission);
    await setEnabled(await LocationService().isLocationServiceEnabled);
    if (!hasPermission) {
      await LocationService().requestPermission();
      await setPermission(await LocationService().hasPermission);
      if (!await LocationService().hasPermission) {
        await permissionPopup(AppRouter.rootNavigator.currentContext!);
      }
    }
    watchService();
    setLoading(false);
  }
}
