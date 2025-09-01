import 'package:flutter/material.dart';
import '../domain/agendamento.dart';

class CardAgendamento extends StatelessWidget {
  Agendamento agendamento;

  CardAgendamento({
    required this.agendamento,
    super.key,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(agendamento.titulo, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black,),
          ),
          SizedBox(height: 4),
          Text(agendamento.detalhes, style: TextStyle(fontSize: 14, color: Color(0xFF474343),),
          ),
        ],
      ),
    );
  }
}