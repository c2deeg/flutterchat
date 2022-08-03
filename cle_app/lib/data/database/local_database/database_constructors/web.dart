import 'package:cle_app/data/database/local_database/database.dart';
import 'package:drift/web.dart';

LocalDatabase constructDb({bool logStatements = true}) {
  return LocalDatabase(
      WebDatabase('localDatabase95', logStatements: logStatements));
}
