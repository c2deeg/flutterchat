import 'package:drift/drift.dart';

class Drivers extends Table {
  IntColumn get userId => integer()();
  TextColumn get shipmentId => text()();
}
