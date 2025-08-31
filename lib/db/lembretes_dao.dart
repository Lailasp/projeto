import 'package:projeto/db/dbhelper.dart';
import 'package:projeto/domain/lembretes.dart';
import 'package:sqflite/sqflite.dart';

class LembretesDao {
  Future<List<Lembretes>> listarLembretes() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM LmebretesDiario;';
    var result = await db.rawQuery(sql);

    List<Lembretes> listaLembretes = [];

    await Future.delayed(Duration(seconds: 3));

    for (var json in result) {
      Lembretes Lembrete = Lembretes.fromJson(json);
      listaLembretes.add(Lembrete);
    }

    return listaLembretes;
  }
}
