import 'package:sqlite3/sqlite3.dart';

class DatabaseHelper {
  late Database _db;

  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<void> initDatabase() async {
    _db = sqlite3.open("persons.db");
    _db.execute('''
    CREATE TABLE IF NOT EXISTS peoples(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER NOT NULL
    );
    ''');
    print('Database initialized');
  }

  Database get database => _db;

  void closeDatabase() {
    _db.dispose();
    print('Database closed');
  }
}
