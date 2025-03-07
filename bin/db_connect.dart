import 'dart:ffi';
import 'package:sqlite3/open.dart';
import 'package:sqlite3/sqlite3.dart';

void dbConnectMethod() {
  open.overrideForAll(() => DynamicLibrary.open('sqlite3.dll'));

  final db = sqlite3.openInMemory();
  db.execute("CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT);");
  db.dispose();
}
