import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/data/database/models/joined/shipment_with_loads.dart';
import 'package:cle_app/providers/shipment_provider.dart';
import 'package:cle_app/widgets/cards/shipment_card.dart';
import 'package:cle_app/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActiveShipmentCard extends StatelessWidget {
  const ActiveShipmentCard({
    Key? key,
    required this.shipmentProvider,
    this.initialCardSize = 0.1,
  }) : super(key: key);

  final ShipmentProvider shipmentProvider;
  final double initialCardSize;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        maxChildSize: .9,
        minChildSize: .1,
        initialChildSize: initialCardSize,
        snapSizes: const [0.1, .9],
        snap: true,
        builder: ((context, scrollController) {
          List<ShipmentWithLoads> shipmentList = [];
          TextStyle sheetTextStyle =
              const TextStyle(color: Colors.grey, fontSize: 14);
          if (shipmentProvider.currentShipments.isNotEmpty &&
              !shipmentProvider.isLoading) {
            shipmentList = shipmentProvider.currentShipments;
          }
          return Container(
            color: Colors.white,
            child: ListView(
              controller: scrollController,
              // shrinkWrap: true,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: 50,
                        child: Divider(
                          thickness: 5,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        const Text(
                          'Active Shipments',
                          style: TextStyle(fontSize: 24),
                        ),
                        IconButton(
                          onPressed: () async {
                            await shipmentProvider.refreshShipments();
                          },
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ],
                ),
                if (shipmentProvider.isLoading)
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: LoadingSpinner(),
                  ),
                if (!shipmentProvider.isLoading && shipmentList.isEmpty)
                  const Center(
                    child: Text(
                      'No Active Jobs',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                if (!shipmentProvider.isLoading && shipmentList.isNotEmpty)
                  for (ShipmentWithLoads shipment in shipmentList)
                    ShipmentDetails(
                      shipment: shipment,
                      sheetTextStyle: sheetTextStyle,
                    ),
              ],
            ),
          );
        }));
  }
}

class ShipmentDetails extends StatelessWidget {
  const ShipmentDetails({
    Key? key,
    required this.shipment,
    required this.sheetTextStyle,
  }) : super(key: key);

  final ShipmentWithLoads shipment;
  final TextStyle sheetTextStyle;

  @override
  Widget build(BuildContext context) {
    int miles = 0;
    shipment.loads?.forEach((load) {
      miles += load.totalMileage;
    });
    return Padding(
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
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
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
        ],
      ),
    );
  }
}

class LoadDetails extends StatelessWidget {
  const LoadDetails({Key? key, required this.load, required this.shipment})
      : super(key: key);

  final Load load;
  final Shipment shipment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Load #${load.id}',
            style: TextStyle(
                color: Colors.grey[800], fontSize: 16, letterSpacing: .6),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.flag,
            color: Colors.red[900],
          ),
          title: Text(
            load.dropoffLocation != '' ? load.dropoffLocation : "N/A",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: .6),
          ),
          subtitle: Text(
            DateFormat('EEEE, MMMM d, y - hh:mma').format(shipment.dropOffTime),
            style: TextStyle(
                color: Colors.grey[600], fontSize: 16, letterSpacing: .6),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 16,
          runSpacing: 8,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cargo Type',
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 16, letterSpacing: .6),
                ),
                Text(
                  load.name != '' ? load.name : 'N/A',
                  style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: .6,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Weight',
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 16, letterSpacing: .6),
                ),
                Text(
                  '${load.weight} ${load.unitWeight}',
                  style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: .6,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Laddel Temperature',
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 16, letterSpacing: .6),
                ),
                Text(
                  '${load.temperature}° ${load.unitTemperature}',
                  style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: .6,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notes:',
                style: TextStyle(
                    color: Colors.grey[600], fontSize: 16, letterSpacing: .6),
              ),
              Text(
                load.notes != '' ? "${load.notes}" : "",
              ),
            ],
          ),
        )
      ],
    );
  }
}
