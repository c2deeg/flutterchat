import 'package:cle_app/screens/dashboard/dashboard.dart';
import 'package:cle_app/widgets/adaptive/adaptive_refresh_indicator.dart';
import 'package:cle_app/widgets/cards/quick_info_card.dart';
import 'package:cle_app/widgets/cards/quick_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<QuickInfoTileState> expansionTile = new GlobalKey();
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  final expandIndex0 = GlobalKey<QuickInfoTileState>();
  final expandIndex1 = GlobalKey<QuickInfoTileState>();
  final expandIndex2 = GlobalKey<QuickInfoTileState>();
  final expandIndex3 = GlobalKey<QuickInfoTileState>();
  final expandIndex4 = GlobalKey<QuickInfoTileState>();
  bool areinfoCardsOpen = false;
  bool isRefreshing = true;
  List<int> data = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future loadData() async {
    setState(() {
      isRefreshing = true;
    });
    await Future.delayed(const Duration(milliseconds: 3000));
    if (mounted) {
      setState(() {
        isRefreshing = false;
      });
    }
  }

  void ToggleAllInfoCards() {
    if (areinfoCardsOpen) {
      setState(() {
        areinfoCardsOpen = !areinfoCardsOpen;
        expandIndex0.currentState?.collapse();
        expandIndex1.currentState?.collapse();
        expandIndex2.currentState?.collapse();
        expandIndex3.currentState?.collapse();
        expandIndex4.currentState?.collapse();
      });
    } else {
      setState(() {
        areinfoCardsOpen = !areinfoCardsOpen;
        expandIndex0.currentState?.expand();
        expandIndex1.currentState?.expand();
        expandIndex2.currentState?.expand();
        expandIndex3.currentState?.expand();
        expandIndex4.currentState?.expand();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.red.shade900,
              child: const TabBar(indicatorColor: Colors.white, tabs: [
                Tab(
                  text: 'Dashboard',
                ),
                Tab(
                  text: 'Earnings',
                ),
                Tab(
                  text: 'History',
                )
              ]),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AdaptiveRefreshIndicator(
                    onRefresh: loadData,
                    child: ListView(
                      // shrinkWrap: true,
                      children: [
                        SizedBox(
                            height: 300,
                            child: SimpleTimeSeriesChart.withSampleData()),
                        Container(
                            color: Colors.red,
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 32),
                              child: TextButton(
                                child: Text(
                                  areinfoCardsOpen
                                      ? 'Collapes All'
                                      : 'Expand All',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                onPressed: () {
                                  ToggleAllInfoCards();
                                },
                              ),
                            )),
                        Transform.translate(
                          offset: const Offset(0.0, -40.0),
                          child: Column(
                            children: [
                              QuickInfoCard(
                                tileKey: expandIndex0,
                                title: 'Assigned Trucks',
                                trailNum: '3',
                              ),
                              QuickInfoCard(
                                tileKey: expandIndex1,
                                title: 'Upcoming Jobs',
                                trailNum: '4',
                              ),
                              QuickInfoCard(
                                tileKey: expandIndex2,
                                title: 'Assigned Trucks',
                                trailNum: '3',
                              ),
                              QuickInfoCard(
                                tileKey: expandIndex3,
                                title: 'Assigned Trucks',
                                trailNum: '3',
                              ),
                              QuickInfoCard(
                                tileKey: expandIndex4,
                                title: 'Assigned Trucks',
                                trailNum: '3',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ExpencesPage(),
                  const PaystubsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
