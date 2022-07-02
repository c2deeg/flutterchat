import 'package:drift/drift.dart';

class Loads extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get weight => integer()();
  TextColumn get unitWeight => text().nullable()();
  IntColumn get temperature => integer()();
  TextColumn get unitTemperature => text().nullable()();
  IntColumn get loadPrice => integer()();
  IntColumn get totalMileage => integer()();
  BoolColumn get isempty => boolean().withDefault(const Constant(false))();
  TextColumn get consignee => text().nullable()();
  TextColumn get currency => text()();
  TextColumn get status => text()();
  TextColumn get notes => text().nullable()();
  IntColumn get shipmentId => integer()();
}
