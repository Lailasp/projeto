import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'pulmovida.db';

    String dbPath = join(path, dbName);

    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    print(dbPath);
    return database;
  }

  Future<void> onCreate(Database db, int version) async {
    String sql = '''CREATE TABLE LembretesDiario (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeDoExame TEXT,
    horario TEXT,
    urlImage TEXT
    );''';
    await db.execute(sql);

    sql =
    "INSERT INTO LembretesDiario (nomeDoExame, horario, urlImage) VALUES ('Quimioterapia', '15:00', 'https://cdn-icons-png.flaticon.com/512/1998/1998221.png');";
    await db.execute(sql);

    sql =
    "INSERT INTO LembretesDiario (nomeDoExame, horario, urlImage) VALUES ('Paclitaxel', '19:00', 'https://cdn-icons-png.flaticon.com/512/1998/1998221.png');";
    await db.execute(sql);

    sql =
    "INSERT INTO LembretesDiario (nomeDoExame, horario, urlImage) VALUES ('Consulta com pneumologista', '19:30', 'https://cdn-icons-png.flaticon.com/512/1998/1998221.png');";
    await db.execute(sql);
  }
}
