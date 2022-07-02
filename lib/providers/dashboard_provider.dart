import 'dart:io';

import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/screens/dashboard/utils.dart';
import 'package:cle_app/services/payroll_service.dart';
import 'package:cle_app/services/vehical_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class DashboardProvider extends ChangeNotifier {
  bool _isLoading = false;
  late Payroll _currentPaystub;
  List<Payroll> _pastPaystubs = [];
  late File _currentPaystubPDF;
  List<File> _pastPaystubPDFs = [];
  List<bool> _checkBoxSelected = [];

  bool get isloading => _isLoading;
  List<bool> get checkBoxSelected => _checkBoxSelected;
  Payroll get currentPaystub => _currentPaystub;
  File get currentPaystubPDF => _currentPaystubPDF;
  List<Payroll> get pastPaystubs => _pastPaystubs;
  List<File> get pastPaystubPDFs => _pastPaystubPDFs;

  DashboardProvider() {
    init();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setCheckBoxSelected(List<bool> checkBoxSelected) async {
    _checkBoxSelected = checkBoxSelected;
    notifyListeners();
  }

  setPastPaystubsList(List<Payroll> pastPaystubs) {
    _pastPaystubs = pastPaystubs;
  }

  setPastPaystubsPDFList(List<File> pastPaystubPDFs) {
    _pastPaystubPDFs = pastPaystubPDFs;
  }

  setCurrentPaystub(Payroll currentPaystub) {
    _currentPaystub = currentPaystub;
  }

  setCurrentPaystubPDF(File currentPaystubPDF) {
    _currentPaystubPDF = currentPaystubPDF;
  }

  init() async {
    setLoading(true);
    await getPaystubs();
    final pdf = await generatePaystubPdf(currentPaystub);
    setCurrentPaystubPDF(pdf);
    List<File> pdfsList = [];
    List<bool> chechboxValues = [];
    for (var stub in pastPaystubs) {
      final pdfstub = await generatePaystubPdf(stub);
      pdfsList.add(pdfstub);
      chechboxValues.add(false);
    }
    setPastPaystubsPDFList(pdfsList);
    setCheckBoxSelected(chechboxValues);
    print(pastPaystubPDFs);
    setLoading(false);
  }

  getPaystubs() async {
    final payroll = await PayrollService().getPayroll();
    if (payroll != null) {
      setPastPaystubsList(
          [payroll, payroll, payroll, payroll, payroll, payroll]);
      setCurrentPaystub(payroll);
    }
  }

  toggleCheckboxValue(int index) {
    final temp = checkBoxSelected;
    temp[index] = !temp[index];
    setCheckBoxSelected(temp);
  }

  sendPaystubEmail() async {
    List<int> indexes = [];
    Map<int, bool> selectedPayStubs = checkBoxSelected.asMap();
    selectedPayStubs.forEach((key, value) {
      if (value == true) {
        indexes.add(key);
      }
    });

    List<String> attachemts = [];
    for (var i in indexes) {
      attachemts.add(_pastPaystubPDFs[i].path);
    }

    final Email email = Email(
      subject: 'DriveCLE Paystub',
      body: 'see attachments...',
      attachmentPaths: attachemts,
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  viewPaystub(File pdfFile) async {
    await PaystubApi.openFile(pdfFile);
  }

  Future<File> generatePaystubPdf(Payroll payroll) async {
    return await PaystubApi.generate(payroll, LocalData().user);
  }

  // refreshTruckList() async {
  //   final trucks = await VehicleService().getAllTrucks();
  //   //TODO: Demo Only
  //   trucks.shuffle();
  //   setTruckList(trucks);
  //   setLoading(false);
  // }

  // refreshTrailersList() async {
  //   final trailers = await VehicleService().getAllTrailers();
  //   //TODO: Demo Only
  //   trailers.shuffle();
  //   setTrailerList(trailers);
  //   setLoading(false);
  // }
}
