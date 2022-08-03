import 'package:drift/drift.dart';

class PayrollLoads extends Table {
  IntColumn get payrollId => integer().autoIncrement()();
  TextColumn get type => text()();
  TextColumn get dispatch => text()();
  TextColumn get expeditor => text()();
  TextColumn get consignee => text()();
  TextColumn get consigneeAddress => text()();
  TextColumn get expeditorAddress => text()();
  RealColumn get percent => real()();
  RealColumn get loadpriceAfterPercent => real()();
  RealColumn get loadprice => real()();
  TextColumn get currency => text()();
  DateTimeColumn get pickupTime => dateTime()();
  DateTimeColumn get dropoffTime => dateTime()();
}
