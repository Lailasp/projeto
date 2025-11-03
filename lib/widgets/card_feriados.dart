import 'package:flutter/material.dart';
import '../domain/feriados.dart';

class CardFeriados extends StatelessWidget {
  Feriados feriados;

  CardFeriados({
    required this.feriados,
    super.key,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(feriados.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black,),
          ),
          SizedBox(height: 4),
          Text(feriados.date, style: TextStyle(fontSize: 14, color: Color(0xFF474343),),
          ),
        ],
      ),
    );
  }
}