import 'dart:io';

import 'package:cle_app/data/database/local_database/database.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:intl/intl.dart';

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

// 'Fri, 12 Oct 2022 6:35pm EST'
String dateToLongFormate(DateTime dateTime) {
  return DateFormat('EEE, d MMM yyyy jm EST').format(dateTime);
}

//   '12/23/2022'
String dateToWeek(DateTime dateTime) {
  return DateFormat('MM/dd/yyyy').format(dateTime);
}

class PaystubApi {
  PaystubApi._();

  static final testCredit = [
    {'Date': '', 'Description': 'Fuel Reimbursment', 'Total': '\$50.00'},
    {'Date': '', 'Description': 'Scale Reimbursment', 'Total': '\$12.50'},
  ];

  static final testTrips = [
    {
      'Date': '7/17 - 7/19',
      'Dispatcher': 'Christina',
      'Description': 'Batavia NY -> Greensboro NC',
      'Freight Amount': '\$2200.00',
      '%': '25%',
      'Total': '\$550.00'
    },
    {
      'Date': '7/19 - 7/20',
      'Dispatcher': 'Christina',
      'Description': 'Mount airy NC -> Philadephia PA',
      'Freight Amount': '\$2500.00',
      '%': '25%',
      'Total': '\$625.00'
    },
    {
      'Date': '7/22 - 7/23',
      'Dispatcher': 'Christina',
      'Description': 'Newfield, NJ -> CARLISLE, PA',
      'Freight Amount': '\$4800.00',
      '%': '25%',
      'Total': '\$1,200.00'
    },
  ];

  static Future<File> generate(Payroll payinfo, User user) async {
    final pdf = Document();
    final fileName = genFileName(payinfo, user);
    // final font = await rootBundle.load("assets/open-sans.ttf");
    // final ttf = Font.ttf(font);

    pdf.addPage(MultiPage(
        // pageTheme: _buildTheme(
        //   await PdfGoogleFonts.robotoRegular(),
        //   await PdfGoogleFonts.robotoBold(),
        //   await PdfGoogleFonts.robotoItalic(),
        // ),
        build: ((context) => [
              buildHeader(user),
              buildTitle(payinfo),
              buildTripsTable(payinfo),
              buildDeductionsTable(payinfo),
              buildCreditsTable(payinfo),
              buildSubTotal(payinfo),
              buildReimbursmentTable(payinfo),
              buildTotal(payinfo),
            ])));
    return savePdf(fileName: fileName, pdf: pdf);
  }

  static Future<File> savePdf(
      {required String fileName, required Document pdf}) async {
    final byteData = await pdf.save();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');

    return await file.writeAsBytes(byteData);
  }

  static Future openFile(File file) async {
    final filePath = file.path;
    print(filePath);

    await OpenFile.open(filePath);
  }

  static String genFileName(Payroll payinfo, User user) {
    String month;
    String day;
    if (payinfo.periodStart.month < 10) {
      month = '0${payinfo.periodStart.month}';
    } else {
      month = payinfo.periodStart.month.toString();
    }
    if (payinfo.periodStart.day < 10) {
      day = '0${payinfo.periodStart.month}';
    } else {
      day = payinfo.periodStart.month.toString();
    }

    return 'paysheet_${user.firstname.toLowerCase()}_${payinfo.status}_week_of_${payinfo.periodStart.year}-$month-$day.pdf';
  }

  static PageTheme _buildTheme(Font base, Font bold, Font italic) {
    return PageTheme(
      // pageFormat: pageFormat,
      theme: ThemeData.withFont(
        base: base,
        bold: bold,
        italic: italic,
      ),
      // buildBackground: (context) => FullPage(
      //   ignoreMargins: true,
      //   child: SvgImage(svg: _bgShape!),
      // ),
    );
  }

  static Widget buildHeader(User user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CLE LOGISTICS LLC',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('KISSIMMEE FL 34758',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text('Phone: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('786-463-2161'),
              ],
            ),
            Row(
              children: [
                Text('Email: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Clelogisticsllc@gmail.com'),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${user.firstname} ${user.lastname}'),
            if (user.address != null) Text('Address: ${user.address}'),
            if (user.address != null)
              Text('${user.city} ${user.state} ${user.zipCode}'),
            Text('Email: ${user.email}'),
          ],
        )
      ],
    );
  }

  static Widget buildTitle(Payroll payroll) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: .8 * PdfPageFormat.cm),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Pay Period',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                    '${payroll.periodStart.month}/${payroll.periodStart.day}/${payroll.periodStart.year} - ${payroll.periodEnd.month}/${payroll.periodEnd.day}/${payroll.periodEnd.year}'),
              ],
            ),
          ],
        ),
        Text(
          'Paystub Statment',
          style: const TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: .2 * PdfPageFormat.cm),
      ],
    );
  }

  static Widget buildTripsTable(Payroll payroll) {
    final headers = [
      'Date',
      'Dispatcher',
      'Description',
      'Freight Amount',
      '%',
      'Total'
    ];
    //TODO remove test items
    final data = testTrips.map((trip) {
      return [
        trip['Date'],
        trip['Dispatcher'],
        trip['Description'],
        trip['Freight Amount'],
        trip['%'],
        trip['Total'],
      ];
    }).toList();
    if (data.length < 2) {
      data.add([
        ' ',
        ' ',
        ' ',
        ' ',
        ' ',
        ' ',
      ]);
    }
    final total = [
      'Trip Totals',
      '\$9,500.00',
      '25%',
      '\$2,375.00',
    ];

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Trips',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: .1 * PdfPageFormat.cm),
        Table.fromTextArray(
          data: data,
          headers: headers,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.centerLeft,
            3: Alignment.centerRight,
            4: Alignment.centerRight,
            5: Alignment.centerRight,
          },
          headerStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          headerDecoration: const BoxDecoration(
            color: PdfColors.grey500,
          ),
          cellAlignment: Alignment.centerLeft,
          cellHeight: 0,
          cellStyle: const TextStyle(
            fontSize: 8,
          ),
          // columnWidths: {0: TableColumnWidth()}
        ),
        Table.fromTextArray(
            headers: total,
            data: [[]],
            cellAlignments: {
              0: Alignment.center,
              1: Alignment.centerRight,
              2: Alignment.centerRight,
              3: Alignment.centerRight,
            },
            headerStyle: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
            headerDecoration: const BoxDecoration(
              color: PdfColors.grey500,
            ),
            cellHeight: 0,
            columnWidths: {
              0: const FixedColumnWidth(5.48),
              1: const FixedColumnWidth(1.95),
              2: const FixedColumnWidth(.6),
              3: const FixedColumnWidth(1.05),
            }),
        SizedBox(height: .3 * PdfPageFormat.cm),
      ],
    );
  }

  static Widget buildDeductionsTable(Payroll payroll) {
    final headers = ['Date', 'Description', 'Total'];
    //TODO remove test items
    final data = testTrips.map((trip) {
      return [
        '',
        '',
        '',
      ];
    }).toList();
    if (data.length < 2) {
      data.add([
        ' ',
        ' ',
        ' ',
      ]);
    }
    final total = [
      'Total Deductions',
      '\$0.00',
    ];

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Advances & Deductions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: .1 * PdfPageFormat.cm),
        Table.fromTextArray(
          data: data,
          headers: headers,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.centerRight,
          },
          headerStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          headerDecoration: const BoxDecoration(
            color: PdfColors.grey500,
          ),
          cellAlignment: Alignment.centerLeft,
          cellHeight: 0,
          cellStyle: const TextStyle(
            fontSize: 8,
          ),
          // columnWidths: {0: TableColumnWidth()}
        ),
        Table.fromTextArray(
            headers: total,
            data: [[]],
            cellAlignments: {
              0: Alignment.center,
              1: Alignment.centerRight,
            },
            headerStyle: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
            headerDecoration: const BoxDecoration(
              color: PdfColors.grey500,
            ),
            cellHeight: 0,
            columnWidths: {
              0: const FixedColumnWidth(5.41),
              1: const FixedColumnWidth(1.9),
            }),
        SizedBox(height: .5 * PdfPageFormat.cm),
      ],
    );
  }

  static Widget buildCreditsTable(Payroll payroll) {
    final headers = ['Date', 'Description', 'Total'];
    //TODO remove test items
    final data = testCredit.map((credit) {
      return [
        credit['Date'],
        credit['Description'],
        credit['Total'],
      ];
    }).toList();
    if (data.length < 2) {
      data.add([
        ' ',
        ' ',
        ' ',
      ]);
    }
    final total = [
      'Total Credits',
      '\$62.50',
    ];

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Credits',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: .1 * PdfPageFormat.cm),
        Table.fromTextArray(
          data: data,
          headers: headers,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.centerRight,
          },
          headerStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          headerDecoration: const BoxDecoration(
            color: PdfColors.grey500,
          ),
          cellAlignment: Alignment.centerLeft,
          cellHeight: 0,
          cellStyle: const TextStyle(
            fontSize: 8,
          ),
          // columnWidths: {0: TableColumnWidth()}
        ),
        Table.fromTextArray(
            headers: total,
            data: [[]],
            cellAlignments: {
              0: Alignment.center,
              1: Alignment.centerRight,
            },
            headerStyle: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
            headerDecoration: const BoxDecoration(
              color: PdfColors.grey500,
            ),
            cellHeight: 0,
            columnWidths: {
              0: const FixedColumnWidth(5.41),
              1: const FixedColumnWidth(1.9),
            }),
        SizedBox(height: .3 * PdfPageFormat.cm),
      ],
    );
  }

  static Widget buildReimbursmentTable(Payroll payroll) {
    final headers = ['Date', 'Description', 'Total'];
    //TODO remove test items
    final data = testCredit.map((credit) {
      return [
        '',
        '',
        '',
      ];
    }).toList();
    if (data.length < 2) {
      data.add([
        ' ',
        ' ',
        ' ',
      ]);
    }
    final total = [
      'Total Reimbursment',
      '\$0.00',
    ];

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Reimbursment',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: .1 * PdfPageFormat.cm),
        Table.fromTextArray(
          data: data,
          headers: headers,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.centerRight,
          },
          headerStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          headerDecoration: const BoxDecoration(
            color: PdfColors.grey500,
          ),
          cellAlignment: Alignment.centerLeft,
          cellHeight: 0,
          cellStyle: const TextStyle(
            fontSize: 8,
          ),
          // columnWidths: {0: TableColumnWidth()}
        ),
        Table.fromTextArray(
            headers: total,
            data: [[]],
            cellAlignments: {
              0: Alignment.center,
              1: Alignment.centerRight,
            },
            headerStyle: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
            headerDecoration: const BoxDecoration(
              color: PdfColors.grey500,
            ),
            cellHeight: 0,
            columnWidths: {
              0: const FixedColumnWidth(5.41),
              1: const FixedColumnWidth(1.9),
            }),
        SizedBox(height: .3 * PdfPageFormat.cm),
      ],
    );
  }

  static buildSubTotal(Payroll payroll) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Text(
        'SUBTOTAL AMOUNT',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(width: 2 * PdfPageFormat.cm),
      Text(
        '\$${payroll.grossIncome.toStringAsFixed(2)}',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }

  static buildTotal(Payroll payroll) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Text(
        'TOTAL CHECK AMOUNT',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(width: 2 * PdfPageFormat.cm),
      Text(
        '\$${payroll.netRevenue.toStringAsFixed(2)}',
        style: TextStyle(
          color: PdfColors.red800,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}
