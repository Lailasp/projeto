class Feriados {
  late String date;
  late String name;
  late String type;

  Feriados({
    required this.date,
    required this.name,
    required this.type,
  });
  Feriados.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    name = json['name'];
    type = json['type'];
  }
}