import 'package:teste1/db/database.dart' show Database;
import 'package:teste1/widgets/card_propriedade.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          const Text(
            'Mensagens',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: Database.propriedades.length,
              itemBuilder: (context, i) {
                return CardPropriedade(
                  propriedade: Database.propriedades[i],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
