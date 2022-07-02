import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cle_app/util/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../data/settings/local_data.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin<MapScreen> {
  @override
  bool get wantKeepAlive => true;
  final Completer<GoogleMapController> _mapController = Completer();

  // final GoogleMapController _mapController = Completer();
  BitmapDescriptor? originIcon;
  BitmapDescriptor? destinationIcon;
  BitmapDescriptor? farUserIcon;
  BitmapDescriptor? closeUserIcon;
  final Set<Marker> _markers = <Marker>{};

  late LatLng currentLocation;
  late LatLng destinationLocation;
  late LatLng originLocation;

  Set<Polyline> loadRoute = <Polyline>{};
  List<LatLng> loadRouteData = [];
  late PolylinePoints polylinePoints;

  static const initialCameraPosition =
      CameraPosition(target: LatLng(28.1576, -81.4849), zoom: 14);
  late IO.Socket socket;
  String username = LocalData().user.username;

  @override
  initState() {
    polylinePoints = PolylinePoints();
    setInitialLocation();
    setCustomMarkerIcons();
    connect();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setInitialLocation() {
    double originLat = 0, destinationLat = 0, originLng = 0, destinationLng = 0;

    currentLocation = const LatLng(28.157773, -81.484557);
    originLocation = LatLng(originLat, originLng);
    destinationLocation = LatLng(destinationLat, destinationLng);
  }

  void connect() {
    socket = IO.io("http://http://im2.tainosystems.com:7200", <String, dynamic>{
      "transports": ["websocket"],
      "autoconnect": false,
    });
    socket.connect();
    socket.onConnect((data) => print("connected hogi"));
    print(socket.connected);
    log('data: $socket.connected');
    socket.emit('set-user-data', username);
    socket.on('onlineStack', (data) {
      print('onlinecheck---' + data.toString());
      print('usernamecheck---' + username);
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void setCustomMarkerIcons() async {
    final Uint8List originMarkerData =
        await getBytesFromAsset(Assests.mapPickUpRed, 200);
    final Uint8List destinationMarkerData =
        await getBytesFromAsset(Assests.mapFlag, 200);
    final Uint8List userCloseMarkerData =
        await getBytesFromAsset(Assests.mapTruckRed, 200);
    final Uint8List userFarMarkerData =
        await getBytesFromAsset(Assests.mapTruckRed, 200);
    originIcon = BitmapDescriptor.fromBytes(originMarkerData);
    destinationIcon = BitmapDescriptor.fromBytes(destinationMarkerData);
    closeUserIcon = BitmapDescriptor.fromBytes(userCloseMarkerData);

    // _markers.add(
    //   Marker(
    //     markerId: const MarkerId('destination-marker2'),
    //     position: currentLocation,
    //     icon: closeUserIcon!,
    //   ),
    // );
    // if (hasJob) {
    //   _markers.add(
    //     Marker(
    //       markerId: const MarkerId('origin-marker'),
    //       position: originLocation,
    //       icon: originIcon!,
    //     ),
    //   );
    //   _markers.add(
    //     Marker(
    //       markerId: const MarkerId('destination-marker'),
    //       position: destinationLocation,
    //       icon: destinationIcon!,
    //     ),
    //   );
    // }

    farUserIcon = BitmapDescriptor.fromBytes(userFarMarkerData);

    // closeUserIcon = await BitmapDescriptor.fromAssetImage(
    //     const ImageConfiguration(size: kIsWeb ? Size(80, 80) : Size(20, 20)),
    //     'assets/map/truck_marker_red.png');

    showPinsOnMap();
    setPolylinesOnMap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        body: Stack(
      children: [
        Positioned.fill(
          child: GoogleMap(
            trafficEnabled: false,
            indoorViewEnabled: false,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            compassEnabled: true,
            tiltGesturesEnabled: false,
            polylines: loadRoute,
            markers: _markers,
            initialCameraPosition: initialCameraPosition,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
            },
          ),
        ),
      ],
    ));
  }

  void showPinsOnMap() {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('origin-marker'),
          position: originLocation,
          icon: originIcon!,
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId('destination-marker'),
          position: destinationLocation,
          icon: destinationIcon!,
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId('destination-marker2'),
          position: currentLocation,
          icon: closeUserIcon!,
        ),
      );
    });
  }

  Future<void> setPolylinesOnMap() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Constants.googleMapsApiKey,
      PointLatLng(originLocation.latitude, originLocation.longitude),
      PointLatLng(destinationLocation.latitude, destinationLocation.longitude),
    );

    if (result.status == 'OK') {
      for (var point in result.points) {
        loadRouteData.add(LatLng(point.latitude, point.longitude));
      }

      setState(() {
        loadRoute.add(
          Polyline(
              polylineId: const PolylineId('load-route'),
              color: Palette.red,
              width: 5,
              points: loadRouteData),
        );
      });
    }
  }
}
