import 'package:dio/dio.dart';
import 'package:projeto/Domain/Address.dart';

class AddressApi {
  final dio = Dio();

  final String baseUrl = 'https://api.fda.gov/drug/label.json';

  Future<Address> buscarMedicamento(String ingrediente) async {
    final String ingredienteAtivo = ingrediente.trim().toLowerCase();
    try {
      final response = await dio.get(
        baseUrl,
        queryParameters: {
          'search': 'active_ingredient:"$ingredienteAtivo"',
          'limit': 1,
        },
      );

      if (response.statusCode == 200) {
        return Address.fromJson(response.data);
      } else {
        throw Exception('Falha ao carregar dados da API (Código: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception('Erro de conexão ou API: ${e.message}');
    } catch (e) {
      throw Exception('Erro desconhecido: $e');
    }
  }
}
