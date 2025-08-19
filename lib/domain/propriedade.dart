class Propriedade {
  String urlImage;
  String nomeDR;
  String mensagem;

  Propriedade({
    required this.urlImage,
    required this.nomeDR,
    required this.mensagem,
  });

  factory Propriedade.fromJson(Map<String, dynamic> json) {
    return Propriedade(
      urlImage: json['urlImage'],
      nomeDR: json['nomeDR'],
      mensagem: json['mensagem'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'urlImage': urlImage,
      'nomeDR': nomeDR,
      'mensagem': mensagem,
    };
  }
}
