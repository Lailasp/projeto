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

    print('DB criado em: $dbPath');
    return database;
  }

  Future<void> onCreate(Database db, int version) async {
    // Cria a tabela com os campos da nova estrutura
    String sql = '''CREATE TABLE Propriedade (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      urlImage TEXT NOT NULL,
      nomeDR TEXT NOT NULL,
      mensagem TEXT NOT NULL
    );''';

    await db.execute(sql);

    // Inserindo os dados dos médicos com imagens e mensagens
    await db.execute('''
      INSERT INTO Propriedade (urlImage, nomeDR, mensagem)
      VALUES (
        'https://static.vecteezy.com/ti/vetor-gratis/p1/1886209-doctor-medical-cartoon-design-vetor.jpg',
        'Dr. Carlos João',
        'Vamos saber o motivo de seu cansaço essa semana'
      );
    ''');

    await db.execute('''
      INSERT INTO Propriedade (urlImage, nomeDR, mensagem)
      VALUES (
        'https://img.lovepik.com/png/20231112/obgyn-clipart-female-naturopathic-doctor-in-lab-coat-with-cells_572098_wh860.png',
        'Dra. Maria Lúcia',
        'Vamos marcar sua próxima avaliação para essa semana.'
      );
    ''');

    await db.execute('''
      INSERT INTO Propriedade (urlImage, nomeDR, mensagem)
      VALUES (
        'https://img.pikbest.com/png-images/qiantu/cartoon-female-doctor-original-elements_2537037.png!w700wp',
        'Dra. Maria Beatriz',
        'Analisei seus gráficos e estão ótimos!'
      );
    ''');

    await db.execute('''
      INSERT INTO Propriedade (urlImage, nomeDR, mensagem)
      VALUES (
        'https://images.vexels.com/content/144170/preview/character-doctor-woman-d6ee7a.png',
        'Dra. Mariana Lira',
        'Estou feliz com seu progresso!'
      );
    ''');
  }
}
