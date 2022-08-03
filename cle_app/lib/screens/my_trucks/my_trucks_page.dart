import 'package:cle_app/providers/truck_provider.dart';
import 'package:cle_app/screens/my_trucks/my_trucks.dart';
import 'package:cle_app/widgets/adaptive/adaptive_refresh_indicator.dart';
import 'package:cle_app/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyTrucksPage extends StatefulWidget {
  const MyTrucksPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyTrucksPage> createState() => _MyTrucksPageState();
}

class _MyTrucksPageState extends State<MyTrucksPage> {
  @override
  Widget build(BuildContext context) {
    TruckProvider truckProvider = context.watch<TruckProvider>();
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
                                  "Trucks",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Trailers",
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
                      await truckProvider.refreshTruckList();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (truckProvider.isloading) const LoadingSpinner(),
                        if (!truckProvider.isloading)
                          VehicleList(
                            vehicles: truckProvider.trucksList,
                            type: 'Trucks',
                          ),
                      ],
                    ),
                  ),
                  AdaptiveRefreshIndicator(
                    onRefresh: () async {
                      await truckProvider.refreshTrailersList();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (truckProvider.isloading)
                          const Center(child: LoadingSpinner()),
                        if (!truckProvider.isloading)
                          VehicleList(
                            vehicles: truckProvider.trailersList,
                            type: 'Trailers',
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
