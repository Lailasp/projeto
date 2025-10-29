import 'package:flutter/material.dart';
import 'package:projeto/Widgets/card_propriedades.dart';
import 'package:projeto/Domain/propriedades.dart';
import 'package:projeto/Api/propriedades_api.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late Future<List<Propriedades>> futurelistaPropriedades;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    futurelistaPropriedades = PropriedadesApi().findAll();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),

      child: FutureBuilder<List<Propriedades>>(
        future: futurelistaPropriedades,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Propriedades> lista = snapshot.requireData;
            return buildListView(lista);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  buildListView(List<Propriedades> listaPropriedades) {
    return ListView.builder(
      itemCount: listaPropriedades.length,
      itemBuilder: (context, i) {
        return CardPropriedades(propriedades: listaPropriedades[i]);
      },
    );
  }
}
