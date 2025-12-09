import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projeto/api/agendamento_api.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:provider/provider.dart';

import 'package:projeto/domain/agendamento.dart';
import 'package:projeto/widgets/card_agendamento.dart';
import 'package:projeto/provider/agenda_provider.dart';

class AgendaSemana extends StatefulWidget {
  const AgendaSemana({super.key});

  @override
  State<AgendaSemana> createState() => _AgendaSemanaState();
}

class _AgendaSemanaState extends State<AgendaSemana> {
  int selectedIndex = 1;
  late Future<List<Agendamento>> futurelistaAgendamento;

  @override
  void initState() {
    super.initState();

    futurelistaAgendamento = AgendamentoApi().findAll();
  }

  String getNomeMes(int mes) {
    List<String> meses = [
      "JANEIRO", "FEVEREIRO", "MARÇO", "ABRIL", "MAIO", "JUNHO",
      "JULHO", "AGOSTO", "SETEMBRO", "OUTUBRO", "NOVEMBRO", "DEZEMBRO"
    ];
    return meses[mes - 1];
  }

  @override
  Widget build(BuildContext context) {

    final agendaProvider = context.watch<AgendaProvider>();

    DateTime dataAtual = agendaProvider.dataSelecionada;

    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF3D9ABA),
          body: buildBody(dataAtual),
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

  buildBody(DateTime dataAtual) {
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Agenda", style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
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
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(onPressed: () {}, child: Text("Dia", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 20.0),)),
                        TextButton(onPressed: () {}, child: Text("Semana", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 20.0, fontWeight: FontWeight.bold),)), // Negrito pois estamos na semana
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("Mês", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 20.0),))
                      ],
                    ),
                  ),
                  Divider(),

                  Container(
                    width: 400,
                    height: 25,
                    padding: EdgeInsets.only(right: 9, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(dataAtual.day.toString(), style: TextStyle(color: Color(0xFF3d9aba),),),
                        Text(getNomeMes(dataAtual.month), style: TextStyle(color: Color(0xFF3d9aba),fontSize: 20.0,fontWeight: FontWeight.bold)),
                        Text(dataAtual.year.toString(), style: TextStyle(color: Color(0xFF3d9aba),),),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildDiaSemana("DOM", "13", false),
                        _buildDiaSemana("SEG", "14", true),
                        _buildDiaSemana("TER", "15", false),
                        _buildDiaSemana("QUA", "16", false),
                        _buildDiaSemana("QUI", "17", false),
                        _buildDiaSemana("SEX", "18", false),
                        _buildDiaSemana("SAB", "19", false),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 125, height: 1, color: Colors.grey),
                      Text(
                        "Hoje ${dataAtual.day}",
                        style: TextStyle(color: Color(0xFF3d9aba), fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Container(width: 125, height: 1, color: Colors.grey),
                    ],
                  ),
                  SizedBox(height: 15),


                  //PROVIDER AQUI
                  Container(
                    width: double.infinity,
                    height: 275,
                    child: FutureBuilder<List<Agendamento>>(
                      future: futurelistaAgendamento,
                      builder: (context, snapshot) {
                        if (snapshot.hasData){
                          List<Agendamento> listaCompleta = snapshot.requireData;

                          String dataFormatadaProvider = "${dataAtual.year}-${dataAtual.month.toString().padLeft(2, '0')}-${dataAtual.day.toString().padLeft(2, '0')}";

                          List<Agendamento> listaFiltrada = listaCompleta.where((agendamento) {
                            return agendamento.data == dataFormatadaProvider;
                          }).toList();

                          if(listaFiltrada.isEmpty) {
                            return Center(child: Text("Nenhum agendamento para este dia."));
                          }

                          return ListView.builder(
                            itemCount: listaFiltrada.length,
                            itemBuilder: (context, i) {
                              return CardAgendamento(agendamento: listaFiltrada[i]);
                            },
                          );
                        }
                        return Center(child: CircularProgressIndicator(),);
                      },
                    ),
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 125, height: 1, color: Colors.grey),
                      Text("Agenda", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 17, fontWeight: FontWeight.bold),),
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
                            _botaoAcao(FontAwesomeIcons.stethoscope, Color(0xFFbeffab), "Consulta"),
                            _botaoAcao(FontAwesomeIcons.hospitalUser, Color(0xFF87a8f2), "Quimioterapia"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _botaoAcao(FontAwesomeIcons.userDoctor, Color(0xFFdeaac9), "Exame", size: 50),
                            _botaoAcao(FontAwesomeIcons.pills, Color(0xFFe9dd8b), "Remédio", size: 40),
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

  // Widget auxiliar para os dias da semana (limpa o código principal)
  Widget _buildDiaSemana(String dia, String numero, bool isSelected) {
    if (isSelected) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: Color(0xFF3D9ABA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(dia, style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold,),),
            SizedBox(height: 8),
            Text(numero, style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold,),),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Text(dia, style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold,),),
          SizedBox(height: 8),
          Text(numero, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,),),
        ],
      );
    }
  }

  // Widget auxiliar para os botões de ação
  Widget _botaoAcao(IconData icon, Color color, String label, {double size = 35}) {
    return Column(
      children: [
        Container(
          width: 90, height: 90,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
          child: Center(
            child: IconButton(
              icon: FaIcon(icon), color: Colors.black, iconSize: size, onPressed: () {},
            ),
          ),
        ),
        Text("    $label", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),)
      ],
    );
  }
}