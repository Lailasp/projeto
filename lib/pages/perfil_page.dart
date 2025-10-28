import 'package:flutter/material.dart';
import '../api/propriedades1_api.dart';
import '../domain/propriedade1.dart';
import 'package:projeto/api/propriedades1_api.dart';
import 'package:projeto/widgets/card_propriedade1.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  late Future<List<Propriedades1>> futurelistaPropriedades1;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    futurelistaPropriedades1 = PropriedadesApi1().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: FutureBuilder<List<Propriedades1>>(
        future: futurelistaPropriedades1,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Propriedades1> lista = snapshot.requireData;
            return buildListView(lista);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  buildListView(List<Propriedades1> listaPropriedades1) {
    return ListView.builder(
      itemCount: listaPropriedades1.length,
      itemBuilder: (context, i) {
        return CardPropriedades1(propriedades1: listaPropriedades1[i]);
      },
    );
  }
}
