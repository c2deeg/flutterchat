import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cle_app/util/config/assests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {
  bool _isLoading = false;
  BitmapDescriptor? destinationMarker,
      truckMarker,
      blueWarehouseMarker,
      greenWarehouseMarker,
      yellowWarehouseMarker,
      orangeWarehouseMarker,
      redWarehouseMarker;

  Iterable markers = [];
  Iterable<Polyline> polylines = [];

  bool get isloading => _isLoading;
  Completer<GoogleMapController> mapController = Completer();
  // late GoogleMapController googleMapController;

  MapProvider() {
    init();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  animateCamera(CameraPosition cam) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cam));
  }

  loadCustomMarker() async {
    final Uint8List destinationMarkerData =
        await getBytesFromAsset(Assests.mapFlag, 200);
    destinationMarker = BitmapDescriptor.fromBytes(destinationMarkerData);
    final Uint8List truckMarkerData =
        await getBytesFromAsset(Assests.mapFlag, 200);
    truckMarker = BitmapDescriptor.fromBytes(truckMarkerData);
    final Uint8List blueWarehouseMarkerData =
        await getBytesFromAsset(Assests.mapFlag, 200);
    blueWarehouseMarker = BitmapDescriptor.fromBytes(blueWarehouseMarkerData);
    final Uint8List greenWarehouseMarkerData =
        await getBytesFromAsset(Assests.mapFlag, 200);
    greenWarehouseMarker = BitmapDescriptor.fromBytes(greenWarehouseMarkerData);
    final Uint8List yellowWarehouseMarkerData =
        await getBytesFromAsset(Assests.mapFlag, 200);
    yellowWarehouseMarker =
        BitmapDescriptor.fromBytes(yellowWarehouseMarkerData);
    final Uint8List orangeWarehouseMarkerData =
        await getBytesFromAsset(Assests.mapFlag, 200);
    orangeWarehouseMarker =
        BitmapDescriptor.fromBytes(orangeWarehouseMarkerData);
    final Uint8List redWarehouseMarkerData =
        await getBytesFromAsset(Assests.mapFlag, 200);
    redWarehouseMarker = BitmapDescriptor.fromBytes(redWarehouseMarkerData);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
        northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }

  init() async {
    await loadCustomMarker();
  }
}
