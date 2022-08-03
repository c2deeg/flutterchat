import 'package:cle_app/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import 'expenses/expenses_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                  text: 'Earnings',
                ),
                Tab(
                  text: 'History',
                ),
                Tab(
                  text: 'Expenses',
                )
              ]),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  EarningsPage(),
                  PaystubsPage(),
                  ExpensesPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
