class Lembretes {
  late String urlImage;
  late String nomeDoExame;
  late String horario;


  Lembretes({
    required this.urlImage,
    required this.nomeDoExame,
    required this.horario,
  });

  Lembretes.fromJson(Map<String, dynamic> json) {
    urlImage = json['urlImage'];
    nomeDoExame = json['nomeDoExame'];
    horario = json['horario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['urlImage'] = this.urlImage;
    data['nomeDoExame'] = this.nomeDoExame;
    data['horario'] = this.horario;
    return data;
  }
}
