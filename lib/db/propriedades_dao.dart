
import 'package:projeto/db/db_helper.dart';
import 'package:projeto/domain/propriedade.dart';
import 'package:sqflite/sqflite.dart';

class PropriedadesDao {
  Future<List<Propriedade>> listarPropriedades() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM PROPRIEDADE;';
    var result = await db.rawQuery(sql);

    List<Propriedade> listaPropriedades = [];

    await Future.delayed(Duration(seconds: 3));

    // ForEach
    for (var json in result) {
      Propriedade propriedade = Propriedade.fromJson(json);
      listaPropriedades.add(propriedade);
    }

    return listaPropriedades;
  }
}
