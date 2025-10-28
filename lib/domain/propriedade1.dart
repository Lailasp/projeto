class Propriedades1 {
  late String urlImagem;
  late String email;
  late String nomeUsuario;

  Propriedades1({
    required this.urlImagem,
    required this.email,
    required this.nomeUsuario,
  });

  Propriedades1.fromJson(Map<String, dynamic> json){
    email = json['email'];
    nomeUsuario = json['nomeUsuario'];
    urlImagem = json['urlImagem'];
  }
}
