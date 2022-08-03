import 'package:cle_app/data/database/models/role.dart';
import 'package:cle_app/data/database/tables/direct_message_table.dart';
import 'package:cle_app/data/database/tables/drivers_table.dart';
import 'package:cle_app/data/database/tables/expence_document.dart';
import 'package:cle_app/data/database/tables/expense_table.dart';
import 'package:cle_app/data/database/tables/notification_table.dart';
import 'package:cle_app/data/database/tables/payroll_item_table.dart';
import 'package:cle_app/data/database/tables/payroll_load.dart';
import 'package:cle_app/data/database/tables/payroll_table.dart';
import 'package:cle_app/data/database/tables/shipment_table.dart';
import 'package:cle_app/data/database/tables/tables.dart';
import 'package:cle_app/data/database/tables/vehicles_table.dart';
import 'package:drift/drift.dart';
export 'database_constructors/shared.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  ChatUsers,
  DirectMessages,
  Drivers,
  Expences,
  Loads,
  Locations,
  Notfications,
  Payrolls,
  Shipments,
  Users,
  Vehicles,
  PayrollItems,
  PayrollLoads,
  ExpenceDocuments
], daos: [])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
          //   onUpgrade: (migrator, from, to) async {
          //   if (from == 1) {
          //     await migrator.createTable(appFiles);
          //     await migrator.createAll();
          //   }
          // },
          beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      }, onCreate: (migrator) async {
        await migrator.createAll();
      });
}
