import 'package:drift/drift.dart';

class Expences extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get amount => integer()();
  TextColumn get transaction => text()();
  TextColumn get paymentType => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get amountGive => integer()();
  IntColumn get change => integer()();
  TextColumn get currency => text()();
  TextColumn get note => text().nullable()();
  TextColumn get banque => text().nullable()();
  TextColumn get checkNumber => text().nullable()();
  TextColumn get cardNumber => text().nullable()();
  TextColumn get bankCardNumber => text().nullable()();
}
