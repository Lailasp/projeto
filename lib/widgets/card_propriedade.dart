import 'package:flutter/material.dart';
import 'package:projeto/domain/propriedade.dart';
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
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nome do profissional e avatar
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(propriedade.urlImage),
            ),
            title: Text(
              propriedade.nomeDR,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'Profissional da Saúde',
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Mensagem
          Text(
            propriedade.mensagem,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
