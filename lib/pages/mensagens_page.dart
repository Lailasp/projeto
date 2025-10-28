import 'package:flutter/material.dart';
import 'package:projeto/widgets/card_propriedade.dart';
import 'package:projeto/pages/mensagens2_page.dart';
import 'package:projeto/api/propriedades_api.dart';
import 'package:projeto/domain/quote.dart';
import 'package:projeto/api/quote_api.dart';

class MensagensPage extends StatefulWidget {
  const MensagensPage({super.key});

  @override
  State<MensagensPage> createState() => _MensagensPageState();
}

class _MensagensPageState extends State<MensagensPage> {
  List listaPropriedades = [];
  List<Quote> listaQuotes = [];
  bool loadingQuotes = true;

  @override
  void initState() {
    super.initState();
    loadData();
    loadQuotesSequential();
  }

  loadData() async {
    listaPropriedades = await PropriedadesApi().findAll();
    setState(() {});
  }

  //Carrega citações da API Forismatic em inglês, uma de cada vez
  Future<void> loadQuotesSequential() async {
    setState(() => loadingQuotes = true);
    listaQuotes.clear();

    for (int i = 0; i < 5; i++) {
      final quote = await QuoteApi().getRandomQuote(lang: 'en');
      if (quote != null) {
        listaQuotes.add(quote);
        setState(() {}); // Atualiza cada citação carregada
      }
      await Future.delayed(const Duration(milliseconds: 300)); // evita repetição
    }
    setState(() => loadingQuotes = false);
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    margin:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    padding: const EdgeInsets.all(1),
                    child: ListView.builder(
                      shrinkWrap: true, //tamanho da lista para caber apenas nos itens exibidos
                      physics: const NeverScrollableScrollPhysics(), //desativa o listview dessa parte
                      itemCount: listaPropriedades.length,
                      itemBuilder: (context, i) {
                        final propriedade = listaPropriedades[i];
                        return InkWell( //permine clicar no card
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Mensagens2Page(),
                              ),
                            );
                          },
                          child: CardPropriedade(propriedade: propriedade),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Citações',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        loadingQuotes && listaQuotes.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : Column(
                          children: listaQuotes.map((quote) {
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5),
                              child: ListTile(
                                title: Text(
                                  '"${quote.quoteText}"',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic),
                                ),
                                subtitle: Text('- ${quote.quoteAuthor}'),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
