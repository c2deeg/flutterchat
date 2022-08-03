import 'dart:io';

import 'package:cle_app/data/database/models/report_model.dart';
import 'package:cle_app/services/report_service.dart';
import 'package:flutter/cupertino.dart';

class ReportProvider extends ChangeNotifier {
  bool _isLoading = false;
  late Report _report;

  bool get isloading => _isLoading;
  Report get report => _report;

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  setReport(Report report) {
    _report = report;
  }

  saveForm(String location, String notes, File image) async {
    final reportToSend = Report(
        notes: notes,
        location: location,
        base64Image: base64String(await image.readAsBytes()));
    setReport(reportToSend);
  }

  sendReport(
      String location, String notes, File image, BuildContext context) async {
    setLoading(true);
    await saveForm(location, notes, image);
    await ReportService().sendReport(report);
    setLoading(false);
  }
}
