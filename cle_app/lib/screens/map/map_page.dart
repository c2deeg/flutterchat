import 'package:cle_app/providers/location_provider.dart';
import 'package:cle_app/providers/map_provider.dart';
import 'package:cle_app/providers/notification_provider.dart';
import 'package:cle_app/providers/shipment_provider.dart';
import 'package:cle_app/screens/map/widgets/active_shipment_card.dart';
import 'package:cle_app/screens/map/widgets/map_screen.dart';
import 'package:cle_app/screens/map/widgets/shipment_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>
    with AutomaticKeepAliveClientMixin<MapPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MapProvider map = context.watch<MapProvider>();
    LocationProvider gps = context.watch<LocationProvider>();
    ShipmentProvider jobs = context.watch<ShipmentProvider>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Stack(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
                height: constraints.maxHeight,
                child: Visibility(
                  visible: true,
                  child: GoogleMap(
                      trafficEnabled: false,
                      indoorViewEnabled: false,
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,
                      compassEnabled: true,
                      tiltGesturesEnabled: false,
                      polylines: Set.from(map.polylines),
                      markers: Set.from(map.markers),
                      initialCameraPosition: gps.lastKnownLocation != null
                          ? CameraPosition(
                              target: LatLng(gps.lastKnownLocation!.latitude,
                                  gps.lastKnownLocation!.longitude),
                              zoom: 14)
                          : const CameraPosition(
                              target: LatLng(28.1576, -81.4849), zoom: 14),
                      mapType: MapType.normal,
                      onMapCreated: (GoogleMapController controller) async {
                        if (!map.mapController.isCompleted) {
                          map.mapController.complete(controller);
                        }
                        final loco = await gps.pingLocation();
                        if (loco != null) {
                          map.animateCamera(CameraPosition(
                              target: LatLng(loco.latitude, loco.longitude),
                              zoom: 14));
                        }
                      }),
                ));
          }),
          ActiveShipmentCard(
            shipmentProvider: jobs,
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: DriverStatusMenuButton(),
            ),
          ),
        ],
      ),
    );
  }
}
