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
/*
  Dados tipo JSON:
  'urlImage': 'https://cdn-icons-png.flaticon.com/512/1998/1998221.png',
  'nomeDoExame': 'QUIMIOTERAPIA',
  'horario': '15:00'
 */
}
