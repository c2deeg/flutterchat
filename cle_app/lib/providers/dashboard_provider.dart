import 'dart:io';

import 'package:cle_app/data/database/local_database/database.dart';
import 'package:cle_app/data/database/models/joined/payroll_with_item.dart';
import 'package:cle_app/data/settings/local_data.dart';
import 'package:cle_app/screens/dashboard/utils.dart';
import 'package:cle_app/services/payroll_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class DashboardProvider extends ChangeNotifier {
  bool _isLoading = false;
  late PayrollWithItems _currentPaystub;
  List<PayrollWithItems> _pastPaystubs = [];
  late File _currentPaystubPDF;
  List<File> _pastPaystubPDFs = [];
  List<bool> _checkBoxSelected = [];

  bool get isloading => _isLoading;
  List<bool> get checkBoxSelected => _checkBoxSelected;
  PayrollWithItems get currentPaystub => _currentPaystub;
  File get currentPaystubPDF => _currentPaystubPDF;
  List<PayrollWithItems> get pastPaystubs => _pastPaystubs;
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

  setPastPaystubsList(List<PayrollWithItems> pastPaystubs) {
    _pastPaystubs = pastPaystubs;
  }

  setPastPaystubsPDFList(List<File> pastPaystubPDFs) {
    _pastPaystubPDFs = pastPaystubPDFs;
  }

  setCurrentPaystub(PayrollWithItems currentPaystub) {
    _currentPaystub = currentPaystub;
  }

  setCurrentPaystubPDF(File currentPaystubPDF) {
    _currentPaystubPDF = currentPaystubPDF;
  }

  init() async {
    setLoading(true);
    await getPaystubs();
    List<bool> chechboxValues = [];
    // ignore: unused_local_variable
    for (var stub in pastPaystubs) {
      chechboxValues.add(false);
    }
    setCheckBoxSelected(chechboxValues);
    generateCurrentPdf();
    generatePastPdfs();
    setLoading(false);
  }

  getPaystubs() async {
    final paystubs = await PayrollService().getAllPaystubs();
    // setPastPaystubsList(paystubs.where((stub) => stub.payroll.status == '').toList());
    final defaultPaystub = PayrollWithItems(
        payroll: Payroll(
            id: 0,
            userId: LocalData().user.id,
            netRevenue: 0,
            grossIncome: 0,
            status: 'ERROR',
            notes: '',
            tenantId: 0,
            isdeleted: false,
            periodStart: DateTime.now(),
            periodEnd: DateTime.now(),
            percent: 0,
            revenueAfterPercent: 0,
            totalAdvance: 0,
            credit: 0,
            currency: 'USD',
            reimbursment: 0,
            totalLoads: 0,
            totalLoadsAfterPercent: 0,
            totalDeductionAdvance: 0,
            subtotal: 0),
        loads: const [],
        credits: const [],
        advances: const [],
        deductions: const [],
        reimbursments: const []);

    if (paystubs.isNotEmpty) {
      setPastPaystubsList(paystubs);
      final currentPaystub = paystubs.firstWhere(
        (stub) => stub.payroll.status == 'pending',
        orElse: () => defaultPaystub,
      );

      setCurrentPaystub(currentPaystub);
    } else {
      setCurrentPaystub(defaultPaystub);
    }
  }

  generateCurrentPdf() async {
    final pdf = await generatePaystubPdf(currentPaystub);
    setCurrentPaystubPDF(pdf);
  }

  generatePastPdfs() async {
    List<File> pdfsList = [];
    for (var stub in pastPaystubs) {
      final pdfstub = await generatePaystubPdf(stub);
      pdfsList.add(pdfstub);
    }
    setPastPaystubsPDFList(pdfsList);
  }

  refreshPaystubs() async {
    await Future.delayed(const Duration(milliseconds: 800));
    await getPaystubs();
    notifyListeners();
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

  Future<File> generatePaystubPdf(PayrollWithItems payroll) async {
    return await PaystubApi.generate(payroll, LocalData().user);
  }
}
