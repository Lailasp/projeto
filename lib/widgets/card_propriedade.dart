import 'package:flutter/material.dart';
import 'package:projeto/domain/propriedade.dart';
import 'package:google_fonts/google_fonts.dart';




class CardPropriedade extends StatefulWidget {
  Propriedade propriedade;


  CardPropriedade({
    //obrigatório
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nome dr. e avatar
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 23,
              backgroundImage: NetworkImage(propriedade.urlImage),
            ),
            title: Text(
              propriedade.nomeDR,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3D9ABA),
              ),
            ),
            subtitle: Text(
              'Profissional da Saúde',
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Color(0xFFCACCCC),
              ),
            ),
          ),
          const SizedBox(height: 0),
          // Mensagem
          Text(
            propriedade.mensagem,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Color(0xFFCACCCC),
            ),
          ),
          Divider(indent: 5, endIndent: 5),
        ],
      ),
    );
  }
}
