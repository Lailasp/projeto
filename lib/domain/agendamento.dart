class Agendamento {
  late int id;
  late String titulo;
  late String data;
  late String detalhes;

  Agendamento({
    required this.id,
    required this.titulo,
    required this.data,
    required this.detalhes,
  });

  Agendamento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    data = json['data'];
    detalhes = json['detalhes'];
  }
}