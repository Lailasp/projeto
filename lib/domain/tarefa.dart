class Tarefa {
  final int id;
  final String titulo;
  final String horario;
  final String iconeUrl;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.horario,
    required this.iconeUrl,
  });

  Tarefa.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        titulo = json['titulo'],
        horario = json['horario'],
        iconeUrl = json['icone_url'];
}