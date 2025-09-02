import 'package:projeto/db/dbhelper.dart';
import 'package:projeto/domain/lembretes.dart';
import 'package:sqflite/sqflite.dart';

class LembretesDao {
  Future<List<Lembretes>> listarLembretes() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM LembretesDiario;';
    var result = await db.rawQuery(sql);
    /*
    [
    { 'id': 1, 'nomeDoExame': 'QUIMIOTERAPIA', 'horario': '15:00', 'urlImage': 'https://...' },
    { 'id': 2, 'nomeDoExame': 'PACLITAXEL', 'horario': '19:00', 'urlImage': 'https://...' },
    { 'id': 3, 'nomeDoExame': 'PNEUMOLOGISTA', 'horario': '19:30', 'urlImage': 'https://...' }
    ]
     */

    List<Lembretes> listaLembretes = [];

    for (var json in result) {
      Lembretes lembrete = Lembretes.fromJson(json);
      listaLembretes.add(lembrete);
    }

    return listaLembretes;
  }
}
