import 'package:flutter/material.dart';
import '../domain/agendamento.dart';

class CardAgendamento extends StatelessWidget {
  final Agendamento agendamento;

  const CardAgendamento({
    required this.agendamento,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(agendamento.titulo, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87,),
          ),
          SizedBox(height: 4),
          Text(agendamento.detalhes, style: TextStyle(fontSize: 14, color: Colors.grey[700],),
          ),
        ],
      ),
    );
  }
}