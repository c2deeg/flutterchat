import 'package:cle_app/data/data.dart';
import 'package:cle_app/data/database/models/report_model.dart';
import 'package:cle_app/services/services.dart';
import 'package:cle_app/widgets/errors.dart';

class ReportService {
  Future<void> sendReport(Report report) async {
    if (await NetworkService().isConnected()) {
      try {
        final token = await AuthenticationService().getToken();
        final reportData = report.toMap();
        await ApiClient.create().reportIncident(token, reportData);
      } catch (e) {
        errorToast();
      }
    } else {
      noInternetToast();
    }
  }
}
