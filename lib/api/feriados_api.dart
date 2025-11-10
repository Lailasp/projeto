import 'package:dio/dio.dart';
import 'package:projeto/domain/feriados.dart';

class FeriadosApi {
  final dio = Dio();
  String baseUrl = 'https://brasilapi.com.br/api';

  Future<List<Feriados>> getFeriadosDoAno(String ano) async {
    final response = await dio.get('$baseUrl/feriados/v1/$ano');


    List<Feriados> lista = [];

      for (var json in response.data) {
        Feriados feriado = Feriados.fromJson(json);
        lista.add(feriado);
      }

    return lista;
  }
}