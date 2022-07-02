import 'package:cle_app/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class ExpencesPage extends StatelessWidget {
  const ExpencesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
                height: 200,
                width: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Net',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          '\$8000.00',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Gross Pay',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          '\$6448.25',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    DonutPieChart.withSampleData(),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Eanings for 2/13 - 2/19',
                  style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 18,
                      letterSpacing: .8),
                ),
                Divider(
                  color: Colors.green.shade700,
                  thickness: 2,
                ),
              ],
            ),
          ),
          Center(
            child: DataTable(columns: const [
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
                label: Text('Hours',
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: .8,
                        fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('Amount',
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: .8,
                        fontWeight: FontWeight.bold)),
              ),
            ], rows: const [
              DataRow(
                cells: [
                  DataCell(
                    Text('Regular Rate',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('50',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('\$6250.75',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text('Overtime',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('5',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('\$197.5',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text('Total',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('55',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('\$6448.25',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                ],
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Direct Deposit',
                  style: TextStyle(color: Colors.green.shade700),
                ),
                Divider(
                  color: Colors.green.shade700,
                  thickness: 2,
                ),
              ],
            ),
          ),
          Center(
            child: DataTable(columns: const [
              DataColumn(
                label: Text(
                  'Bank',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: .8,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text('<Account>',
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: .8,
                        fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('Amount',
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: .8,
                        fontWeight: FontWeight.bold)),
              ),
            ], rows: const [
              DataRow(
                cells: [
                  DataCell(
                    Text('Chase',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('...5862',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('\$6448.25',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                ],
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Taxes for 2/13 - 2/19',
                  style: TextStyle(color: Colors.red.shade600),
                ),
                Divider(
                  color: Colors.red.shade600,
                  thickness: 2,
                ),
              ],
            ),
          ),
          Center(
            child: DataTable(columns: const [
              DataColumn(
                label: Text(
                  'Type',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: .8,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Code',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: .8,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text('Amount',
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: .8,
                        fontWeight: FontWeight.bold)),
              ),
            ], rows: const [
              DataRow(
                cells: [
                  DataCell(
                    Text('Federal',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('FIT',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('\$1231.05',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text('Federal',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('LT',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('\$130.00',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text('State',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('TSL',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('\$155.18',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text('County',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('SLT',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('\$15.51',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                ],
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deductions for 2/13 - 2/19',
                  style: TextStyle(color: Colors.red.shade600),
                ),
                Divider(
                  color: Colors.red.shade600,
                  thickness: 2,
                ),
              ],
            ),
          ),
          Center(
            child: DataTable(columns: const [
              DataColumn(
                label: Text(
                  'Withhold',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: .8,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Code',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: .8,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text('Amount',
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: .8,
                        fontWeight: FontWeight.bold)),
              ),
            ], rows: const [
              DataRow(
                cells: [
                  DataCell(
                    Text('W9 Held',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('FGL',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('\$300.00',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text('Total',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('W9',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('\$300.00',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                ],
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Benifits for 2/13 - 2/19',
                  style: TextStyle(color: Colors.green.shade700),
                ),
                Divider(
                  color: Colors.green.shade700,
                  thickness: 2,
                ),
              ],
            ),
          ),
          Center(
            child: DataTable(columns: const [
              DataColumn(
                label: Text(
                  'Source',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: .8,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Period',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: .8,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text('Amount',
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: .8,
                        fontWeight: FontWeight.bold)),
              ),
            ], rows: const [
              DataRow(
                cells: [
                  DataCell(
                    Text('Dental',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('Yearly',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('\$10000',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text('Medical',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('Yearly',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                  DataCell(
                    Text('\$32000',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .8,
                        )),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
