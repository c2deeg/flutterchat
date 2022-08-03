import 'package:cle_app/data/database/models/joined/shipment_with_loads.dart';
import 'package:cle_app/providers/shipment_provider.dart';
import 'package:cle_app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ShipmentCard extends StatelessWidget {
  final ShipmentWithLoads shipment;
  const ShipmentCard({
    Key? key,
    required this.shipment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShipmentProvider shipmentProvider = context.watch<ShipmentProvider>();
    int miles = 0;
    shipment.loads?.forEach((load) {
      miles += load.totalMileage;
    });
    return GestureDetector(
      onTap: () {
        shipmentProvider.setDetailsShipment(shipment);
        Navigator.pushNamed(
          context,
          Routes.shipmentDetailsPage,
        );
      },
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$miles miles",
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  buildJobStatus(shipment.shipment.status),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.room,
                      color: Colors.blueGrey,
                    ),
                    Flexible(
                      child: Text(
                        shipment.shipment.pickuplocation != ''
                            ? shipment.shipment.pickuplocation
                            : "N/A",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: .6),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                          DateFormat('EEEE, MMMM d, y - hh:mma')
                              .format(shipment.shipment.pickUpTime),
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                              letterSpacing: .6)),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.flag,
              //         color: Colors.red[900],
              //       ),
              //       Flexible(
              //         child: Text(
              //           shipment.loads?.first.dropoffLocation != ''
              //               ? "${shipment.loads?.last.dropoffLocation}"
              //               : 'N/A',
              //           style: const TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               letterSpacing: .6),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 32),
              //   child: Row(
              //     children: [
              //       Text(
              //           DateFormat('EEEE, MMMM d, y - hh:mma')
              //               .format(shipment.shipment.dropOffTime),
              //           style: TextStyle(
              //               color: Colors.grey[600],
              //               fontSize: 16,
              //               letterSpacing: .6)),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildJobStatus(String jobStatus) {
  switch (jobStatus) {
    case 'AC':
      return Container(
        decoration: BoxDecoration(
            color: Colors.purple, borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            'UPCOMING',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      );
    case 'PD':
      return Container(
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            'AVAILABLE',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      );
    case 'IT':
      return Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            'IN TRANSIT',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      );
    case 'WP':
      return Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            'ENROUTE TO PICKUP',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      );
    case 'AS':
      return Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            'LOADING',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
      );
    case 'LL':
      return Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            'UNLOADING',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
      );
    case 'DE':
      return Container(
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            'DELIVERED',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      );
    case 'AT':
      return Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            'DELIVERY ATTEMPT',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      );

    default:
      return Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            'UNKNOWN',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      );
  }
}
