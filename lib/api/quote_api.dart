import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:projeto/domain/quote.dart';

class QuoteApi {
  final Dio dio = Dio();
  final String baseUrl = 'http://api.forismatic.com/api/1.0/';

  Future<Quote?> getRandomQuote({String lang = 'en'}) async {
    try {
      final response = await dio.get(
        baseUrl,
        queryParameters: { //indica que quer uma citação com esse modelo
          'method': 'getQuote',
          'format': 'json',
          'lang': lang,
        },
        options: Options(responseType: ResponseType.plain),
        //define como o Flutter (via Dio) deve interpretar a resposta do servidor.
      );

      // Limpa caracteres problemáticos
      String cleaned = response.data.toString();
      cleaned = cleaned.replaceAll(r"\'", "'");
      cleaned = cleaned.replaceAll(r'\"', '"');

      final Map<String, dynamic> json = jsonDecode(cleaned);
      //cria um objeto Quote a partir dos dados
      return Quote.fromJson(json);
    } catch (e) {
      print('Error fetching quote: $e');
      return null;
    }
  }
}
