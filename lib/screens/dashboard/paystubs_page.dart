import 'package:cle_app/providers/dashboard_provider.dart';
import 'package:cle_app/screens/dashboard/utils.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaystubsPage extends StatelessWidget {
  const PaystubsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = context.watch<DashboardProvider>();
    return Scaffold(
      floatingActionButton: AnimatedScale(
        scale: dashboardProvider.checkBoxSelected.contains(true) ? 1 : 0,
        duration: const Duration(milliseconds: 100),
        child: FloatingActionButton(
            backgroundColor: Colors.red.shade900,
            shape: const CircleBorder(),
            tooltip: 'Send to Email',
            onPressed: () async {
              await dashboardProvider.sendPaystubEmail();
            },
            child: const Icon(
              Icons.attach_email_rounded,
              color: Colors.white,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (dashboardProvider.isloading) LoadingSpinner(),
          if (!(dashboardProvider.isloading))
            Expanded(
              child: ListView.builder(
                itemCount: dashboardProvider.pastPaystubs.length,
                itemBuilder: (BuildContext context, int index) {
                  DateTime currentYear = DateTime.now();
                  final weekDateTime =
                      dashboardProvider.pastPaystubs[index].periodStart;
                  final weekString = dateToWeek(weekDateTime);
                  final taxformValue =
                      dashboardProvider.checkBoxSelected[index];
                  return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Paystub',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, letterSpacing: 1),
                          ),
                          Text(weekString),
                        ],
                      ),
                      value: taxformValue,
                      selected: taxformValue,
                      onChanged: (value) =>
                          dashboardProvider.toggleCheckboxValue(index));
                },
              ),
            ),
        ],
      ),
    );
  }
}
