import 'package:drift/drift.dart';

class Vehicles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get vin => text()();
  IntColumn get number => integer()();
  TextColumn get make => text()();
  TextColumn get model => text()();
  IntColumn get maxTow => integer()();
  IntColumn get curbWeight => integer().nullable()();
  TextColumn get type => text()();
  BoolColumn get isEmpty => boolean().withDefault(const Constant(true))();
}
