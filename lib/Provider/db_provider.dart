import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  /// I used the id of each user as the database name
  /// To avoid showing duplicate messages for different users
  Future<Database> createDatabase(String table) async {
    final database =
        openDatabase(join(await getDatabasesPath(), 'flutter_chat$table.db'),
            onCreate: ((db, version) {
      return db
          .execute('CREATE TABLE message(id INTEGER PRIMARY KEY, text TEXT)');
    }), version: 1);

    return database;
  }

  Future<String> sendMessage(String message, String table) async {
    final db = await createDatabase(table);

    try {
      db.insert('message', {'text': message},
          conflictAlgorithm: ConflictAlgorithm.replace);
      return 'Chat Sent';
    } on DatabaseException catch (e) {
      // print(e);
      return e.result.toString();
    }
  }

  Future<List> getMessages(String table) async {
    final db = await createDatabase(table);

    try {
      final List data = await db.query('message');

      return data;
    } catch (_) {
      return [];
    }
  }
}
