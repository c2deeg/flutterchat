import 'dart:async';

import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/providers/location_provider.dart';
import 'package:cle_app/providers/map_provider.dart';
import 'package:cle_app/providers/shipment_provider.dart';
import 'package:cle_app/screens/map/widgets/active_shipment_card.dart';
import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/widgets/cards/shipment_card.dart';
import 'package:cle_app/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';

class ShipmentDetails extends StatefulWidget {
  const ShipmentDetails({Key? key}) : super(key: key);

  @override
  State<ShipmentDetails> createState() => _ShipmentDetailsState();
}

class _ShipmentDetailsState extends State<ShipmentDetails>
    with AutomaticKeepAliveClientMixin<ShipmentDetails> {
  @override
  bool get wantKeepAlive => true;
  final Completer<GoogleMapController> _mapController = Completer();
  // late CameraPosition initialCameraPosition;
  // // static const initialCameraPosition =
  // //     CameraPosition(target: LatLng(28.1576, -81.4849), zoom: 14);

  @override
  void initState() {
    super.initState();
  }

  // initmap() async {
  //   final pos = await LocationService().getLastKnownPosition();
  //   initialCameraPosition =
  //       CameraPosition(target: LatLng(pos!.latitude, pos.longitude));
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ShipmentProvider shipmentProvider = context.watch<ShipmentProvider>();
    LocationProvider gps = context.watch<LocationProvider>();
    MapProvider map = context.watch<MapProvider>();
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            LayoutBuilder(
              builder: ((context, constraints) {
                return SizedBox(
                  height: constraints.maxHeight * 0.9,
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
                    onMapCreated: (GoogleMapController controller) {
                      _mapController.complete(controller);
                    },
                  ),
                );
              }),
            ),
            ShipmentDetailsCard(shipmentProvider: shipmentProvider),
          ],
        ));
  }
}

class ShipmentDetailsCard extends StatelessWidget {
  const ShipmentDetailsCard({
    Key? key,
    required this.shipmentProvider,
    this.initialCardSize = 0.52,
  }) : super(key: key);

  final ShipmentProvider shipmentProvider;
  final double initialCardSize;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        maxChildSize: 1,
        minChildSize: .1,
        initialChildSize: initialCardSize,
        snapSizes: [0.1, initialCardSize, 1],
        snap: true,
        builder: ((context, scrollController) {
          final shipment = shipmentProvider.detailsShipment;
          TextStyle sheetTextStyle =
              const TextStyle(color: Colors.grey, fontSize: 14);
          int miles = 0;
          shipment.loads?.forEach((load) {
            miles += load.totalMileage;
          });
          return Container(
            color: Colors.white,
            child: ListView(
              controller: scrollController,
              // shrinkWrap: true,
              children: [
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: 50,
                        child: Divider(
                          thickness: 5,
                        ),
                      ),
                    ),
                    Text(
                      'Shipment Details',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Shipment #${shipment.shipment.id}',
                        style: sheetTextStyle,
                        softWrap: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${miles}mi',
                            style: sheetTextStyle,
                          ),
                          buildJobStatus(shipment.shipment.status),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  leading: const Icon(
                                    Icons.room,
                                    color: Colors.blueGrey,
                                  ),
                                  title: Text(
                                    shipment.shipment.pickuplocation != ''
                                        ? shipment.shipment.pickuplocation
                                        : "N/A",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        letterSpacing: .6),
                                  ),
                                  // subtitle: Text('Fri, 12 Oct 2022 6:35pm EST',
                                  subtitle: Text(
                                      DateFormat('EEEE, MMMM d, y - hh:mma')
                                          .format(shipment.shipment.pickUpTime),
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 16,
                                          letterSpacing: .6)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      for (Load load in shipment.loads!)
                        LoadDetails(
                          load: load,
                          shipment: shipment.shipment,
                        ),
                      if (shipment.shipment.status == 'PD')
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: SlideAction(
                            onSubmit: () {
                              shipmentProvider.acceptShipment(context);
                            },
                            submittedIcon: shipmentProvider.isLoading
                                ? const LoadingSpinner(
                                    color: Palette.white,
                                    size: 18,
                                    lineWidth: 3,
                                  )
                                : shipmentProvider.shipmentError
                                    ? const Icon(
                                        Icons.close,
                                        color: Palette.white,
                                      )
                                    : null,
                            outerColor: Palette.red,
                            height: 48,
                            sliderButtonIconSize: 32,
                            sliderButtonIconPadding: 4,
                            elevation: 0,
                            text: 'SWIPE TO ACCEPT',
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
