import 'package:cle_app/providers/expence_provider.dart';
import 'package:cle_app/util/config/config.dart';
import 'package:cle_app/widgets/adaptive/adaptive_refresh_indicator.dart';
import 'package:cle_app/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'add_expense_modal.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExpenceProvider expenceManager = context.watch<ExpenceProvider>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.red,
        shape: const CircleBorder(),
        tooltip: 'Add Expense',
        onPressed: () async {
          await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const AddExpenseModal();
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: AdaptiveRefreshIndicator(
        onRefresh: () async {
          await expenceManager.loadExpenseList();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (expenceManager.isloading) const LoadingSpinner(),
            if (!expenceManager.isloading)
              Expanded(
                child: expenceManager.expencesList.isEmpty
                    ? ListView(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3.5,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  FontAwesomeIcons.commentDollar,
                                  color: Colors.grey,
                                  size: 70,
                                ),
                                Text(
                                  "No Expenses",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 30),
                                )
                              ]),
                        ],
                      )
                    : ListView.builder(
                        itemCount: expenceManager.expencesList.length,
                        itemBuilder: (context, index) {
                          final item = expenceManager.expencesList[index];
                          return ListTile(
                            title: Text(NumberFormat.currency(symbol: '\$')
                                .format(item.amount)),
                            subtitle: Text(item.note!),
                            trailing:
                                Text(DateFormat.yMd().format(item.createdAt)),
                          );
                        }),
              ),
          ],
        ),
      ),
    );
  }
}
