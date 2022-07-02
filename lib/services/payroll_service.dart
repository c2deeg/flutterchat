import 'package:cle_app/data/data.dart';
import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/services/services.dart';
import 'package:cle_app/widgets/errors.dart';

class PayrollService {
  Future<Payroll?> getPayroll() async {
    if (await NetworkService().isConnected()) {
      final token = await AuthenticationService().getToken();
      final payrollData = await ApiClient.create().getPaystubById(44, token);
      final payroll = ApiUtil.interceptResponce(payrollData,
          responceType: ResponceType.payroll);

      if (payroll != null) {
        print(payroll);
        return payroll;
      }
      errorToast();
    }
    return null;
  }

  generatePaystub() {}

  sendEmail(List<Payroll> payrolls) {}
}
