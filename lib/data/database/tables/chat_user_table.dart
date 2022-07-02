import 'package:drift/drift.dart';

class ChatUsers extends Table {
  IntColumn get userId => integer()();
  TextColumn get chatUsername => text()();
  TextColumn get chatPassword => text()();
}
