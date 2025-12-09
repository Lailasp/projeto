import 'package:flutter/material.dart';

class HumorProvider with ChangeNotifier {
  //variável que guarda o estado  (feliz/triste/medio)
  String _humorDoDia = "Não registado";

  //getter para fazer a leitura do valor
  String get humorDoDia => _humorDoDia;

  //método que vai atualizar o valor na tela
  void definirHumor(String novoHumor) {
    _humorDoDia = novoHumor;
    //falar pra perfilpage se atualizar
    notifyListeners();
  }
}