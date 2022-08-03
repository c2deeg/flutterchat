import 'package:cle_app/providers/shipment_provider.dart';
import 'package:cle_app/widgets/adaptive/adaptive_refresh_indicator.dart';
import 'package:cle_app/widgets/cards/shipment_card.dart';
import 'package:cle_app/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShipmentsPage extends StatefulWidget {
  const ShipmentsPage({Key? key}) : super(key: key);

  @override
  State<ShipmentsPage> createState() => _ShipmentsPageState();
}

class _ShipmentsPageState extends State<ShipmentsPage> {
  @override
  Widget build(BuildContext context) {
    ShipmentProvider shipmentProvider = context.watch<ShipmentProvider>();
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: TabBar(
                        onTap: (i) {
                          setState(() {});
                        },
                        unselectedLabelColor: Colors.red[900],
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red[900]),
                        tabs: [
                          Tab(
                            child: Container(
                              constraints: const BoxConstraints(minWidth: 300),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Current",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              // constraints: const BoxConstraints(maxWidth: 300),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "History",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  AdaptiveRefreshIndicator(
                    onRefresh: () async {
                      await shipmentProvider.refreshShipments();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (shipmentProvider.isLoading) const LoadingSpinner(),
                        if (!shipmentProvider.isLoading)
                          shipmentProvider.currentShipments.isEmpty &&
                                  shipmentProvider.availableShipments.isEmpty
                              ? Expanded(
                                  child: ListView(
                                    children: const [
                                      Center(
                                        child: Text(
                                          'No Upcoming Jobs',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: shipmentProvider
                                                  .currentShipments.length +
                                              shipmentProvider
                                                  .availableShipments.length,
                                          itemBuilder: (_, index) {
                                            final shipmentWload = index <
                                                    shipmentProvider
                                                        .currentShipments.length
                                                ? shipmentProvider
                                                    .currentShipments[index]
                                                : shipmentProvider
                                                        .availableShipments[
                                                    index -
                                                        shipmentProvider
                                                            .currentShipments
                                                            .length];
                                            return Column(
                                              children: [
                                                ShipmentCard(
                                                    shipment: shipmentWload),
                                              ],
                                            );
                                          })),
                                ),
                      ],
                    ),
                  ),
                  AdaptiveRefreshIndicator(
                    onRefresh: () async {
                      await shipmentProvider.refreshShipments();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (shipmentProvider.isLoading) const LoadingSpinner(),
                        if (!shipmentProvider.isLoading)
                          shipmentProvider.pastShipments.isEmpty
                              ? Expanded(
                                  child: ListView(
                                    children: const [
                                      Center(
                                        child: Text(
                                          'No Completed Jobs',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: ListView.builder(
                                        itemCount: shipmentProvider
                                            .pastShipments.length,
                                        itemBuilder: (_, index) {
                                          final shipmentWload = shipmentProvider
                                              .pastShipments[index];
                                          return ShipmentCard(
                                              shipment: shipmentWload);
                                        }),
                                  ),
                                ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
