import 'package:drift/drift.dart';

class ExpenceDocuments extends Table {
  IntColumn get expenceId => integer().autoIncrement()();
  BlobColumn get doc => blob()();
}
