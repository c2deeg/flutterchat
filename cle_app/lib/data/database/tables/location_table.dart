import 'package:drift/drift.dart';

class Locations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get locationName => text().nullable()();
  TextColumn get addressLineOne => text().nullable()();
  TextColumn get addressLineTwo => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get country => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get zipCode => text().nullable()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
}
