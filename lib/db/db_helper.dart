import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'perfil.db';


    // C:/aqrquivos/jkdahsdja/airbnb.db
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
    String sql = '''CREATE TABLE Propriedades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT NOT NULL,
    nomeUsuario TEXT,
    urlImagem TEXT
    );''';


    await db.execute(sql);


    sql =
    "INSERT INTO Propriedades (email, nomeUsuario, urlImagem) VALUES ('lbsd1@aluno.ifal.edu.br', 'Lauany Delmiro', 'https://img.freepik.com/vetores-premium/um-desenho-animado-de-uma-mulher-com-longos-cabelos-castanhos-e-um-top-amarelo_835197-5428.jpg');";
    await db.execute(sql);
  }
}
