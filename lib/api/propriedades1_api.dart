import '../domain/propriedade1.dart';
import 'package:dio/dio.dart';

class PropriedadesApi1 {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/LauanyB08/api.fake';

  Future<List<Propriedades1>> findAll() async {
    List<Propriedades1> listaPropriedades1 = [];

    final response = await dio.get('$baseUrl/perfil');
    print(response);


    if (response.statusCode == 200) {
      var result = response.data;

      for (var json in result) {
        Propriedades1 propriedades1 = Propriedades1.fromJson(json);
        listaPropriedades1.add(propriedades1);
      }
    }
    return listaPropriedades1;
  }
}