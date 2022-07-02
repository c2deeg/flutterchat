import 'package:drift/drift.dart';

class Expences extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get amount => real()();
  TextColumn get transaction => text()();
  TextColumn get paymentType => text()();
  RealColumn get amountGive => real()();
  RealColumn get change => real()();
  TextColumn get currency => text()();
  TextColumn get banque => text().nullable()();
  IntColumn get checkNumber => integer().nullable()();
  IntColumn get cardNumber => integer().nullable()();
  RealColumn get bankCardNumber => real().nullable()();
}
