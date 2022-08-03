import 'package:drift/drift.dart';

class PayrollItems extends Table {
  IntColumn get payrollId => integer().autoIncrement()();
  TextColumn get type => text()();
  TextColumn get note => text()();
  RealColumn get amount => real()();
  TextColumn get currency => text()();
  DateTimeColumn get createdAt => dateTime()();
}
