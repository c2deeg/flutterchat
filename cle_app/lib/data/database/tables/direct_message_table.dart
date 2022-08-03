import 'package:drift/drift.dart';

class DirectMessages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get message => text()();
  IntColumn get senderId => integer()();
  IntColumn get recieverId => integer()();
  IntColumn get tenantid => integer().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  BoolColumn get isUpdated => boolean().withDefault(const Constant(false))();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdOn => dateTime()();
}
