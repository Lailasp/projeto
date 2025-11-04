import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto/domain/tarefa.dart';

class TarefaApi {

  final String url = "https://my-json-server.typicode.com/1gor022/fake-api/tarefas";

  Future<List<Tarefa>> getTarefas() async {

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      //sintaxe mais moderna do dart, estrutura diferente do for each, mas faz a mesma coisa
      return jsonList.map((json) => Tarefa.fromJson(json)).toList();

    } else {
      throw Exception('Falha ao carregar tarefas');
    }
  }
}