import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/providers/dashboard_provider.dart';
import 'package:cle_app/screens/dashboard/dashboard.dart';
import 'package:cle_app/widgets/adaptive/adaptive_refresh_indicator.dart';
import 'package:cle_app/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class EarningsPage extends StatefulWidget {
  const EarningsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<EarningsPage> createState() => _EarningsPageState();
}

class _EarningsPageState extends State<EarningsPage> {
  @override
  Widget build(BuildContext context) {
    DashboardProvider earnings = context.watch<DashboardProvider>();
    return AdaptiveRefreshIndicator(
      onRefresh: () async {
        if (mounted) {
          await earnings.getPaystubs();
        }
        if (mounted) {
          await earnings.generateCurrentPdf();
        }
        earnings.setLoading(false);
      },
      child: ListView(children: [
        if (earnings.isloading) const LoadingSpinner(),
        if (!earnings.isloading)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        NetGrossPayInfo(
                          payroll: earnings.currentPaystub.payroll,
                        ),
                        DonutPieChart(
                          [
                            charts.Series<LinearSales, int>(
                              id: 'Payroll',
                              // colorFn: (_,__){return Palette.red;},
                              domainFn: (LinearSales sales, _) => sales.year,
                              measureFn: (LinearSales sales, _) => sales.sales,
                              data: [
                                LinearSales(
                                  0,
                                  earnings.currentPaystub.payroll.grossIncome
                                      .toInt(),
                                ),
                                LinearSales(
                                  1,
                                  earnings.currentPaystub.payroll
                                      .totalDeductionAdvance
                                      .toInt(),
                                ),
                                LinearSales(
                                  2,
                                  earnings.currentPaystub.payroll.credit
                                      .toInt(),
                                ),
                                LinearSales(
                                  3,
                                  earnings.currentPaystub.payroll.reimbursment
                                      .toInt(),
                                ),
                              ],
                            )
                          ],
                          animate: true,
                        ),
                      ],
                    )),
              ),
              PayrollHeader(
                title: 'Earnings',
                payroll: earnings.currentPaystub.payroll,
              ),
              EarningsData(
                loads: earnings.currentPaystub.loads,
              ),
              PayrollHeader(
                title: 'Deductions',
                isGain: false,
                payroll: earnings.currentPaystub.payroll,
              ),
              EarningsData(
                item: earnings.currentPaystub.deductions,
              ),
              PayrollHeader(
                title: 'Credits',
                payroll: earnings.currentPaystub.payroll,
              ),
              EarningsData(
                item: earnings.currentPaystub.credits,
              ),
              PayrollHeader(
                title: 'Advances',
                isGain: false,
                payroll: earnings.currentPaystub.payroll,
              ),
              EarningsData(
                item: earnings.currentPaystub.advances,
              ),
              PayrollHeader(
                title: 'Reiumbursment',
                payroll: earnings.currentPaystub.payroll,
              ),
              EarningsData(
                item: earnings.currentPaystub.reimbursments,
              ),
            ],
          ),
      ]),
    );
  }
}

class EarningsData extends StatelessWidget {
  final List<PayrollItem> item;
  final List<PayrollLoad> loads;
  final bool useLoads;

  const EarningsData({
    Key? key,
    this.item = const [],
    this.loads = const [],
    this.useLoads = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: DataTable(
          horizontalMargin: 1,
          columns: const [
            DataColumn(
              label: Text(
                'Description',
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: .8,
                    fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              numeric: true,
              label: Text('Amount',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: .8,
                      fontWeight: FontWeight.bold)),
            ),
          ],
          rows: item.isEmpty && loads.isEmpty
              ? [
                  const DataRow(
                    cells: [
                      DataCell(
                        Text('N/A',
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ),
                      DataCell(
                        Text('\$0.00',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: .8,
                            )),
                      ),
                    ],
                  )
                ]
              : useLoads
                  ? loadDataList
                  : itemDataList),
    );
  }

  List<DataRow> get loadDataList {
    List<DataRow> ll = [];
    for (final load in loads) {
      ll.add(DataRow(
        cells: [
          DataCell(
            Text('${load.expeditorAddress} -> ${load.consigneeAddress}',
                style: const TextStyle(
                  fontSize: 16,
                )),
          ),
          DataCell(
            Text(NumberFormat.currency().format(load.loadpriceAfterPercent),
                style: const TextStyle(
                  fontSize: 16,
                  letterSpacing: .8,
                )),
          ),
        ],
      ));
    }

    return ll;
  }

  List<DataRow> get itemDataList {
    List<DataRow> ll = [];
    for (final data in item) {
      ll.add(DataRow(
        cells: [
          DataCell(
            Text(data.note,
                style: const TextStyle(
                  fontSize: 16,
                )),
          ),
          DataCell(
            Text(NumberFormat.currency(symbol: '\$').format(data.amount),
                style: const TextStyle(
                  fontSize: 16,
                  letterSpacing: .8,
                )),
          ),
        ],
      ));
    }

    return ll;
  }
}

class PayrollHeader extends StatelessWidget {
  const PayrollHeader({
    Key? key,
    required this.title,
    required this.payroll,
    this.isGain = true,
  }) : super(key: key);

  final String title;
  final Payroll payroll;
  final bool isGain;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title for ${DateFormat.MMMEd().format(payroll.periodStart)} - ${DateFormat.MMMEd().format(payroll.periodEnd)}',
            // Text(
            //   'Eanings for 2/13 - 2/19 ${DateFormat.yM(earnings.currentPaystub.payroll.periodStart.toString())}',
            style: TextStyle(
                color: isGain ? Colors.green.shade700 : Colors.red.shade600,
                fontSize: 18,
                letterSpacing: .8),
          ),
          Divider(
            color: isGain ? Colors.green.shade700 : Colors.red.shade600,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

class NetGrossPayInfo extends StatelessWidget {
  final Payroll payroll;
  const NetGrossPayInfo({
    Key? key,
    required this.payroll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Net',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          NumberFormat.currency(symbol: '\$').format(payroll.netRevenue),
          style: const TextStyle(fontSize: 18),
        ),
        const Text(
          'Gross Pay',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          NumberFormat.currency(symbol: '\$').format(payroll.grossIncome),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
