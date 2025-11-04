import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto/domain/dicas.dart';

class DicasApi {

  final String adviceUrl = "https://api.adviceslip.com/advice?search=health";
  final String translateBaseUrl = "https://api.mymemory.translated.net/get?langpair=en|pt-br&q=";

  Future<Dicas> getDicas() async {

    String textoEmIngles = "";
    try {
      final responseAdvice = await http.get(Uri.parse(adviceUrl));
      if (responseAdvice.statusCode == 200) {
        final Map<String, dynamic> jsonAdvice = json.decode(responseAdvice.body);

        if (jsonAdvice.containsKey('slip')) {
          //guarda texto em inglês
          textoEmIngles = jsonAdvice['slip']['advice'];
        } else {
          throw Exception('Nenhuma dica de conhecimento encontrada hoje.');
        }
      } else {
        throw Exception('Falha ao buscar dica (HTTP).');
      }
    } catch (e) {
      print("Erro ao buscar dica em inglês: $e");
      throw Exception('Falha ao carregar dica em inglês.');
    }

    //traduzindo pro portugues
    try {
      final String urlDeTraducao = translateBaseUrl + Uri.encodeComponent(textoEmIngles);
      final responseTranslate = await http.get(Uri.parse(urlDeTraducao));

      if (responseTranslate.statusCode == 200) {
        final Map<String, dynamic> jsonTranslate = json.decode(responseTranslate.body);
        final String textoTraduzido = jsonTranslate['responseData']['translatedText'];

        //rtorna a dica traduzida
        return Dicas(texto: textoTraduzido);

      } else {
        //se a tradução falhar, só retorna a dica em inglês mesmo
        print("Aviso: Falha ao traduzir. Retornando texto original.");
        return Dicas(texto: textoEmIngles);
      }
    } catch (e) {
      print("Erro ao traduzir: $e. Retornando texto original.");
      //se a API de tradução quebrar, melhor mostrar em inglês do que dar erro
      return Dicas(texto: textoEmIngles);
    }
  }
}