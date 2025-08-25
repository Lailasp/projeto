import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'agenda_medica.db';
    String dbPath = join(path, dbName);

    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );
    return database;
  }

  Future<void> onCreate(Database db, int version) async {

    String sql = '''
      CREATE TABLE AGENDAMENTO (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT NOT NULL,
        detalhes TEXT NOT NULL,
        data TEXT NOT NULL
      );
    ''';
    await db.execute(sql);


    sql = "INSERT INTO AGENDAMENTO (titulo, detalhes, data) VALUES ('Quimioterapia', 'Consultório Inexistente, Rua Bela Vista n°00, Arapiraca-AL | 15:00PM - 17:00PM', '2025-04-14');";
    await db.execute(sql);

    sql = "INSERT INTO AGENDAMENTO (titulo, detalhes, data) VALUES ('Paclitaxel', '19:00PM', '2025-04-14');";
    await db.execute(sql);

    sql = "INSERT INTO AGENDAMENTO (titulo, detalhes, data) VALUES ('Pneumologista', 'Consultório Inexistente, Rua Bela Vista n°00, Arapiraca-AL | 19:30PM', '2025-04-14');";
    await db.execute(sql);
  }
}