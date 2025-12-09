import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projeto/pages/agendaSemana.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:provider/provider.dart';

import 'package:projeto/api/agendamento_api.dart';
import 'package:projeto/domain/agendamento.dart';
import 'package:projeto/widgets/card_agendamento.dart';
import 'package:projeto/provider/agenda_provider.dart';

class AgendaMes extends StatefulWidget {
  const AgendaMes({super.key});

  @override
  State<AgendaMes> createState() => _AgendaMesState();
}

class _AgendaMesState extends State<AgendaMes> {
  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _loadAgendamentos();
  }

  late Future<List<Agendamento>> futurelistaAgendamento;

  _loadAgendamentos() async {
    futurelistaAgendamento = AgendamentoApi().findAll();
    setState(() {});
  }

  final List<String> diasCalendario = [
    "", "", "1", "2", "3", "4", "5",
    "6", "7", "8", "9", "10", "11", "12",
    "13", "14", "15", "16", "17", "18", "19",
    "20", "21", "22", "23", "24", "25", "26",
    "27", "28", "29", "30", "", "", ""
  ];

  @override
  Widget build(BuildContext context) {
    final agendaProvider = Provider.of<AgendaProvider>(context);

    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF3D9ABA),
          body: buildBody(context, agendaProvider),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            child: SlidingClippedNavBar(
              backgroundColor: Colors.white,
              onButtonPressed: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              iconSize: 25,
              activeColor: Color(0xFF3D9ABA),
              selectedIndex: selectedIndex,
              barItems: [
                BarItem(icon: FontAwesomeIcons.house, title: 'Diário'),
                BarItem(icon: FontAwesomeIcons.solidCalendarDays, title: 'Agenda'),
                BarItem(icon: FontAwesomeIcons.solidMessage, title: 'Mensagens'),
                BarItem(icon: FontAwesomeIcons.solidCircleUser, title: 'Perfil'),
              ],
            ),
          ),
        ));
  }

  buildBody(BuildContext context, AgendaProvider provider) {
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Agenda", style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.white,
              ),
              child: ListView(
                children: [

                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.only(right: 50, left: 14, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {},
                          child: Text("Dia", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 20.0)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AgendaSemana()));
                          },
                          child: Text("Semana", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 20.0)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Mês", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 20.0, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  Divider(),

                  Container(
                    width: 400,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text("ABRIL", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 22.0, fontWeight: FontWeight.bold)),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text("2025", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 14)),
                          ),
                        )
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: ["DOM", "SEG", "TER", "QUA", "QUI", "SEX", "SAB"]
                              .map((dia) => Text(dia, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)))
                              .toList(),
                        ),
                        SizedBox(height: 10),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 7,
                          childAspectRatio: 1.2,
                          children: diasCalendario.map((diaString) {

                            if (diaString.isEmpty) return Container();

                            int diaNumero = int.parse(diaString);
                            bool isSelected = (diaNumero == provider.dataSelecionada.day);

                            return GestureDetector(
                              onTap: () {
                                DateTime novaData = DateTime(2025, 4, diaNumero);
                                provider.setDataSelecionada(novaData);
                              },
                              child: Center(
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: isSelected ? Color(0xFF3D9ABA) : Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    diaString,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                      color: isSelected ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 125, height: 1, color: Colors.grey),
                      Text("Dia ${provider.dataSelecionada.day}", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 17, fontWeight: FontWeight.bold)),
                      Container(width: 125, height: 1, color: Colors.grey),
                    ],
                  ),
                  SizedBox(height: 15),

                  Container(
                    width: double.infinity,
                    height: 275,
                    child: FutureBuilder<List<Agendamento>>(
                      future: futurelistaAgendamento,
                      builder: (context, snapshot) {
                        if (snapshot.hasData){
                          List<Agendamento> lista = snapshot.requireData;

                          String dataFormatada = "2025-04-${provider.dataSelecionada.day.toString().padLeft(2, '0')}";

                          var listaFiltrada = lista.where((element) => element.data == dataFormatada).toList();

                          if (listaFiltrada.isEmpty) return Center(child: Text("Sem agendamentos"));

                          return ListView.builder(
                            itemCount: listaFiltrada.length,
                            itemBuilder: (context, i) {
                              return CardAgendamento(agendamento: listaFiltrada[i]);
                            },
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),

                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 125, height: 1, color: Colors.grey),
                      Text("AGENDAR", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 17, fontWeight: FontWeight.bold)),
                      Container(width: 125, height: 1, color: Colors.grey),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                    width: double.infinity,
                    height: 250,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildActionButton(FontAwesomeIcons.stethoscope, Color(0xFFbeffab), "Consulta"),
                            _buildActionButton(FontAwesomeIcons.hospitalUser, Color(0xFF87a8f2), "Quimioterapia"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildActionButton(FontAwesomeIcons.userDoctor, Color(0xFFdeaac9), "Exame", size: 50),
                            _buildActionButton(FontAwesomeIcons.pills, Color(0xFFe9dd8b), "Remédio", size: 40),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color color, String label, {double size = 35}) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
          child: IconButton(
            icon: FaIcon(icon),
            color: Colors.black,
            iconSize: size,
            onPressed: () {},
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17)),
      ],
    );
  }
}