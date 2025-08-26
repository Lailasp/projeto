import 'package:sqflite/sqflite.dart';
import '../domain/agendamento.dart'; //
import 'agenda_db_helper.dart';

class AgendamentosDao {

  Future<List<Agendamento>> getAgendamentosPorData(String data) async {
    Database db = await DBHelper().initDB();

    String sql = 'SELECT * FROM AGENDAMENTO WHERE data = ?;';
    var result = await db.rawQuery(sql, [data]);
    print(result);
    List<Agendamento> lista = [];
    for (var json in result) {
      Agendamento agendamento = Agendamento.fromJson(json);
      lista.add(agendamento);
    }

    return lista;
  }
}