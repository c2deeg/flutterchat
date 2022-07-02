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
}
