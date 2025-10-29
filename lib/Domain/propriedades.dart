class Propriedades {
  late String urlImagem;
  late String email;
  late String nomeUsuario;




  Propriedades({
    required this.urlImagem,
    required this.email,
    required this.nomeUsuario,
  });




  Propriedades.fromJson(Map<String, dynamic> json){

    email = json['email'];
    nomeUsuario = json['nomeUsuario'];
    urlImagem = json['urlImagem'];
  }




  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['urlImagem'] = this.urlImagem;
    data['email'] = this.email;
    data['nomeUsuario'] = this.nomeUsuario;
    return data;
  }
}




