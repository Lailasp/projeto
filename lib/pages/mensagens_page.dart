import 'package:projeto/widgets/card_propriedade.dart';
import 'package:projeto/db/propriedades_dao.dart';
import 'package:flutter/material.dart';

class MensagensPage extends StatefulWidget {
  const MensagensPage({super.key});

  @override
  State<MensagensPage> createState() => _MensagensPageState();
}

class _MensagensPageState extends State<MensagensPage> {
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
