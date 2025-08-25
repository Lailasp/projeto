import 'package:projeto/db_helper.dart';
import 'package:projeto/propriedades.dart';
import 'package:sqflite/sqflite.dart';


class PropriedadesDao {
  Future<List<Propriedades>> listarPropriedades() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM PROPRIEDADES;';
    var result = await db.rawQuery(sql);


    List<Propriedades> listaPropriedades = [];


    await Future.delayed(Duration(seconds: 3));


    // ForEach
    for (var json in result) {
      Propriedades propriedades = Propriedades.fromJson(json);
      listaPropriedades.add(propriedades);
    }


    return listaPropriedades;
  }
}
