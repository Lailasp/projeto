import 'package:projeto/Domain/propriedades.dart';
import 'package:dio/dio.dart';

class PropriedadesApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/LauanyB08/api.fake';

  Future<List<Propriedades>> findAll() async {
    List<Propriedades> listaPropriedades = [];

    final response = await dio.get('$baseUrl/perfil');
    print(response);


    if (response.statusCode == 200) {
      var result = response.data;

      for (var json in result) {
        Propriedades propriedades = Propriedades.fromJson(json);
        listaPropriedades.add(propriedades);
      }
    }
    return listaPropriedades;
  }
}
