import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:projeto/domain/quote.dart';

class QuoteApi {
  final Dio dio = Dio();
  final String baseUrl = 'http://api.forismatic.com/api/1.0/';

  /// Retorna uma citação aleatória em inglês
  Future<Quote?> getRandomQuote({String lang = 'en'}) async {
    try {
      final response = await dio.get(
        baseUrl,
        queryParameters: {
          'method': 'getQuote',
          'format': 'json',
          'lang': lang,
        },
        options: Options(responseType: ResponseType.plain),
      );

      // Limpa caracteres problemáticos
      String cleaned = response.data.toString();
      cleaned = cleaned.replaceAll(r"\'", "'");
      cleaned = cleaned.replaceAll(r'\"', '"');

      final Map<String, dynamic> json = jsonDecode(cleaned);
      return Quote.fromJson(json);
    } catch (e) {
      print('Error fetching quote: $e');
      return null;
    }
  }
}
