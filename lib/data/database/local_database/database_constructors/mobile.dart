import 'dart:io';

import 'package:cle_app/data/database/local_database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart' as paths;
import 'package:path/path.dart' as p;

LocalDatabase constructDb({bool logStatements = true}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'localDatabase.sqlite'));
      return NativeDatabase(dbFile, logStatements: logStatements);
    });
    return LocalDatabase(executor);
  }
  if (Platform.isMacOS || Platform.isLinux) {
    final file = File('localDatabase.sqlite');
    return LocalDatabase(NativeDatabase(file, logStatements: logStatements));
  }
  if (Platform.isWindows) {
    final file = File('db.sqlite');
    return LocalDatabase(NativeDatabase(file, logStatements: logStatements));
  }
  return LocalDatabase(NativeDatabase.memory(logStatements: logStatements));
}
