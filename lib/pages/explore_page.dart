//import 'package:teste1/db/database.dart' show Database;
import 'package:teste1/widgets/card_propriedade.dart';
import 'package:teste1/db/propriedades_dao.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          const Text(
            'Mensagens',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 1),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
              ),
              margin: EdgeInsets.only(top: 5, bottom: 10, left: 2, right: 2),
              padding: EdgeInsets.all(1),
              child: ListView.builder(
                itemCount: listaPropriedades.length,
                itemBuilder: (context, i) {
                  return CardPropriedade(
                    propriedade: listaPropriedades[i],
                  );
                },
              ),
            )
          ),
        ],
      ),
    );
  }
}
