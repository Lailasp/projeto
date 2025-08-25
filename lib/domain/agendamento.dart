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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['data'] = this.data;
    data['detalhes'] = this.detalhes;
    return data;
  }
}