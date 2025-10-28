class Address {
  late String proposta;
  late String marcaName;
  late String activeIngredient;

  Address({
    required this.proposta,
    required this.marcaName,
    required this.activeIngredient,
  });


  Address.fromJson(Map<String, dynamic> json) {
    try {
      if (json['results'] != null && (json['results'] as List).isNotEmpty) {
        final firstResult = json['results'][0];

        if (firstResult['purpose'] != null &&
            (firstResult['purpose'] as List).isNotEmpty) {
          proposta = firstResult['purpose'][0];

        } else {
          proposta = 'Propósito não informado';
        }

        if (firstResult['active_ingredient'] != null &&
            (firstResult['active_ingredient'] as List).isNotEmpty) {
          activeIngredient = firstResult['active_ingredient'][0];
        } else {
          activeIngredient = 'Ingrediente não informado';
        }

        if (firstResult['openfda'] != null &&
            firstResult['openfda']['brand_name'] != null &&
            (firstResult['openfda']['brand_name'] as List).isNotEmpty) {
          marcaName = firstResult['openfda']['brand_name'][0];
        } else {
          marcaName = 'Marca não informada';
        }
      } else {
        proposta = 'Medicamento não encontrado.';
        marcaName = '-';
        activeIngredient = '-';
      }
    } catch (e) {
      proposta = 'Erro ao processar os dados da API.';
      marcaName = 'Erro';
      activeIngredient = 'Erro';
    }
  }

}