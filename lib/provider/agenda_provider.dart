import 'package:flutter/material.dart';

class AgendaProvider extends ChangeNotifier {

  DateTime _dataSelecionada = DateTime(2025, 4, 14);

  DateTime get dataSelecionada => _dataSelecionada;

  setDataSelecionada(DateTime novaData) {
    _dataSelecionada = novaData;
    notifyListeners();
  }
}

/* import 'package:flutter/cupertino.dart';
import 'package:projeto/domain/agendamento.dart';

class AgendaProvider extends ChangeNotifier {

  late Agendamento _agendamento;

  Agendamento get agendamento => _agendamento;

  setAgendamento (Agendamento agendamento ) {
    _agendamento = agendamento;
    notifyListeners();
  }

}*/