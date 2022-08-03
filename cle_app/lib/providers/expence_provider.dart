import 'package:cle_app/data/api/api.dart';
import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/services/services.dart';
import 'package:flutter/cupertino.dart';

class ExpenceProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<Expence> _expencesList = [];

  bool get isloading => _isLoading;
  List<Expence> get expencesList => _expencesList;

  ExpenceProvider() {
    init();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setExpenseList(List<Expence> expences) async {
    _expencesList = expences;
  }

  loadExpenseList() async {
    final tokenAuth = await AuthenticationService().getToken();
    final id = LocalData().user.id;
    final result = await ApiClient.create().getAllExpences(tokenAuth, id);
    final data = ApiUtil.interceptResponce(result,
        responceType: ResponceType.expenceList);
    if (data == null) {
      setExpenseList([]);
    } else {
      setExpenseList((data as List<Expence>).reversed.toList());
    }
  }

  init() async {
    setLoading(true);
    await loadExpenseList();
    setLoading(false);
  }
}
