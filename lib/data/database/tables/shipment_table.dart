import 'package:drift/drift.dart';

class Shipments extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get pickUpTime => dateTime()();
  DateTimeColumn get dropOffTime => dateTime()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updateddAt => dateTime().nullable()();
  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false)).nullable()();
  TextColumn get dispatcher => text()();
  TextColumn get broker => text()();
  TextColumn get status => text()();
  TextColumn get expeditor => text()();
  // IntColumn get drivers => integer().references(Users, #id)();
  // IntColumn get loads => integer().references(Users, #id)();
  TextColumn get docs => text().nullable()();
}
