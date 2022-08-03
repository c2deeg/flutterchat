import 'package:cle_app/providers/dashboard_provider.dart';
import 'package:cle_app/util/util.dart';
import 'package:cle_app/widgets/adaptive/adaptive_refresh_indicator.dart';
import 'package:cle_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PaystubsPage extends StatelessWidget {
  const PaystubsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paystub = context.watch<DashboardProvider>();
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: AnimatedScale(
              scale: paystub.checkBoxSelected.contains(true) ? 1 : 0,
              duration: const Duration(milliseconds: 100),
              child: FloatingActionButton(
                  backgroundColor: Palette.red,
                  shape: const CircleBorder(),
                  tooltip: 'Download',
                  onPressed: () async {
                    await paystub.viewPaystub(paystub.currentPaystubPDF);
                  },
                  child: const Icon(
                    Icons.download,
                    color: Colors.white,
                  )),
            ),
          ),
          AnimatedScale(
            scale: paystub.checkBoxSelected.contains(true) ? 1 : 0,
            duration: const Duration(milliseconds: 100),
            child: FloatingActionButton(
                backgroundColor: Palette.red,
                shape: const CircleBorder(),
                tooltip: 'Send to Email',
                onPressed: () async {
                  await paystub.sendPaystubEmail();
                },
                child: const Icon(
                  Icons.attach_email_rounded,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: AdaptiveRefreshIndicator(
        onRefresh: () async {
          await paystub.refreshPaystubs();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (paystub.isloading) const LoadingSpinner(),
            if (!(paystub.isloading))
              Expanded(
                child: paystub.pastPaystubs.isEmpty
                    ? ListView(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3.5,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  FontAwesomeIcons.piggyBank,
                                  color: Colors.grey,
                                  size: 70,
                                ),
                                Text(
                                  "No Paystub History, yet...",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 30),
                                )
                              ]),
                        ],
                      )
                    : ListView.builder(
                        itemCount: paystub.pastPaystubs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final taxformValue = paystub.checkBoxSelected[index];
                          return CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'Paystub',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                      Text(DateFormat.yMd().format(paystub
                                          .currentPaystub.payroll.periodStart)),
                                    ],
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        await paystub.viewPaystub(
                                            paystub.pastPaystubPDFs[index]);
                                      },
                                      child: const Text(
                                        'View Preview',
                                        style: TextStyle(fontSize: 16),
                                      )),
                                ],
                              ),
                              value: taxformValue,
                              selected: taxformValue,
                              onChanged: (value) =>
                                  paystub.toggleCheckboxValue(index));
                        },
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
