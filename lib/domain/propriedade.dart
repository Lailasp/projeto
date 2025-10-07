class Propriedade {
  late String urlImage;
  late String nomeDR;
  late String mensagem;

  Propriedade({
    required this.urlImage,
    required this.nomeDR,
    required this.mensagem,
  });

  //fromJson = do banco
  Propriedade.fromJson(Map<String, dynamic> json) {
      urlImage = json['urlImage'];
      nomeDR = json['nomeDR'];
      mensagem = json['mensagem'];
  }



  //não está em uso ainda
  Map<String, dynamic> toJson() {
    return {
      'urlImage': urlImage,
      'nomeDR': nomeDR,
      'mensagem': mensagem,
    };
  }
}
