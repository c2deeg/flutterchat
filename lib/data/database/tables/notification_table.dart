import 'package:drift/drift.dart';

class Notfications extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get notes => text()();
  TextColumn get updatedOn => text()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
}
