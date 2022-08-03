import 'package:cle_app/data/data.dart';
import 'package:cle_app/data/database/models/joined/payroll_with_item.dart';
import 'package:cle_app/services/services.dart';
import 'package:cle_app/widgets/errors.dart';
import 'package:flutter/foundation.dart';

class PayrollService {
  Future<List<PayrollWithItems>> getAllPaystubs() async {
    if (await NetworkService().isConnected()) {
      final token = await AuthenticationService().getToken();
      final payrollData = await ApiClient.create().getAllPaystubsByUser(token);
      final payroll = ApiUtil.interceptResponce(payrollData,
          responceType: ResponceType.payrollList);

      if (payroll != null) {
        if (kDebugMode) {
          print(payroll);
        }
        return payroll;
      }
    } else {
      noInternetToast();
      return [];
    }
    return [];
  }
}
