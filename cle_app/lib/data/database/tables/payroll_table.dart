import 'package:drift/drift.dart';

class Payrolls extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  RealColumn get netRevenue => real()();
  RealColumn get grossIncome => real()();
  TextColumn get status => text()();
  TextColumn get notes => text()();
  IntColumn get tenantId => integer()();
  BoolColumn get isdeleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get periodStart => dateTime()();
  DateTimeColumn get periodEnd => dateTime()();
  RealColumn get percent => real()();
  RealColumn get revenueAfterPercent => real()();
  RealColumn get totalAdvance => real()();
  RealColumn get credit => real()();
  TextColumn get currency => text()();
  RealColumn get reimbursment => real()();
  RealColumn get totalLoads => real()();
  RealColumn get totalLoadsAfterPercent => real()();
  RealColumn get totalDeductionAdvance => real()();
  RealColumn get subtotal => real()();
}


      // "percent": 0,
      // "revenueafterpercent": 591,
      // "totaladvance": 0,
      // "credit": 0,
      // "reimbursment": 0,
      // "currency": "USD",
      // {
      // "listDeliberyLoads": null,
      // "listcredit": null,
      // "listadvance": null,
      // "listdeduction": null,
      // "listreimbursment": null,
      // }
      // "TotalDeliberyLoadsPrice": 0,
      // "TotalLoadsPriceAfterPercent": 0,
      // "deductionadvance": 0,
      // "subtotal": 0