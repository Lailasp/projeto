import 'package:projeto/domain/propriedade.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPropriedade extends StatefulWidget {
  Propriedade propriedade;

  CardPropriedade({
    required this.propriedade,
    super.key,
  });

  @override
  State<CardPropriedade> createState() => _CardPropriedadeState();
}

class _CardPropriedadeState extends State<CardPropriedade> {
  // String get urlImage => widget.urlImage;
  Propriedade get propriedade => widget.propriedade;

  // String getUrlImage {
  //   return widget.urlImage;
  // }


  //Scaffold
  //backgroundColor: Color(0xFF3D9ABA),
    // body: Column(
    // children: [
    // Text(
    // "Mensagens",
    // style: TextStyle(
    // fontSize: 30,
    // color: Colors.white,
    // fontWeight: FontWeight.w600,
    // ),
    // ),

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20, left: 7, right: 7),
      padding: EdgeInsets.all(5),
      child: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(
                'https://static.vecteezy.com/ti/vetor-gratis/p1/1886209-doctor-medical-cartoon-design-vetor.jpg',
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(propriedade.urlImage),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              buildText(
                text: propriedade.local,
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              Icon(Icons.star, size: 16),
              buildText(
                text: '4.76',
                fontSize: 16.0,
                color: Colors.black,
              ),
            ],
          ),
          buildText(text: widget.propriedade.tipoHost),
          buildText(text: widget.propriedade.datas),
          buildText(
            text: '\$${widget.propriedade.valor} total',
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
