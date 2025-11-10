import 'package:projeto/domain/agendamento.dart';
import 'package:dio/dio.dart';

class AgendamentoApi {

  final dio = Dio();
  String baseUrl = 'http://my-json-server.typicode.com/Ledro11/fake-api-Leandro';

  Future<List<Agendamento>> findAll() async {

    List<Agendamento> listaAgendamento = [];

    final response = await dio.get('$baseUrl/scheduling');

    if (response.statusCode == 200) {
      var result = response.data;

      for (var json in result) {
        Agendamento agendamento = Agendamento.fromJson(json);
        listaAgendamento.add(agendamento);
      }
    }
    return listaAgendamento;

  }
}