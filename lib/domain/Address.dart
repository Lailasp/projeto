class Address {
  late String nomeDR;
  late String mensagem;
  late String urlImage;

  Address({
    required this.nomeDR,
    required this.mensagem,
    required this.urlImage,
  });

  String get completeAddress => '$nomeDR, $mensagem';

  Address.fromJson(Map<String, dynamic> json) {
    // json['nomeDR'] ?? ''
    // OU
    // if(json['nomeDR'] != null){
    //   cep = json['nomeDR'];
    // } else {
    //   nomeDR = '';
    // }

    nomeDR = json['nomeDR'] ?? '';
    mensagem = json['mensagem'] ?? '';
    urlImage = json['urlImage"'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomeDR'] = this.nomeDR;
    data['mensagem'] = this.mensagem;
    data['urlImage"'] = this.urlImage;

    return data;
  }
}