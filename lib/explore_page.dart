import 'package:flutter/material.dart';
import 'package:projeto/card_propriedades.dart';
import 'package:projeto/propriedades_dao.dart';


class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});


  @override
  State<ExplorePage> createState() => _ExplorePageState();
}


class _ExplorePageState extends State<ExplorePage> {
  List listaPropriedades = [];


  @override
  void initState() {
    super.initState();
    loadData();
  }


  loadData() async {
    listaPropriedades = await PropriedadesDao().listarPropriedades();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: listaPropriedades.length,
        itemBuilder: (context, i) {
          return CardPropriedades(
            propriedades: listaPropriedades[i],
          );
        },
      ),
    );
  }
}
