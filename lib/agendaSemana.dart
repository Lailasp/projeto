import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import 'package:projeto/domain/agendamento.dart';
import 'package:projeto/db/agendamentos_dao.dart';
import 'package:projeto/widgets/card_agendamento.dart';

class AgendaSemana extends StatefulWidget {
  const AgendaSemana({super.key});

  @override
  State<AgendaSemana> createState() => _AgendaSemanaState();
}

class _AgendaSemanaState extends State<AgendaSemana> {
  int selectedIndex = 1;


  List<Agendamento> agendamentosDoDia = [];

  @override
  void initState() {
    super.initState();
    _loadAgendamentos();
  }

  _loadAgendamentos() async {

    String dataSelecionada = "2025-04-14";
    agendamentosDoDia = await AgendamentosDao().getAgendamentosPorData(dataSelecionada);

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF3D9ABA),
          body: buildBody(),
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

  buildBody() {
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
                        TextButton(onPressed: () {}, child: Text("Semana", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 20.0),)),
                        TextButton(onPressed: () {}, child: Text("Mês", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 20.0),))
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
                        Text("14",style: TextStyle(color: Color(0xFF3d9aba),),),
                        Text("ABRIL",style: TextStyle(color: Color(0xFF3d9aba),fontSize: 20.0,fontWeight: FontWeight.bold)),
                        Text("2025", style: TextStyle(color: Color(0xFF3d9aba),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Column(
                        children: [
                          Text("DOM", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold,),),
                          SizedBox(height: 8),
                          Text("13", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,),),
                        ],
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF3D9ABA),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Text("SEG", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold,),),
                            SizedBox(height: 8),
                            Text("14", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold,),),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text("TER", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold,),),
                          SizedBox(height: 8),
                          Text("15", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,),),
                        ],
                      ),
                      Column(
                        children: [
                          Text("QUA", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold,),),
                          SizedBox(height: 8),
                          Text("16", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,),),
                        ],
                      ),
                      Column(
                        children: [
                          Text("QUI", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold,),),
                          SizedBox(height: 8),
                          Text("17", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,),),
                        ],
                      ),
                      Column(
                        children: [
                          Text("SEX", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold,),),
                          SizedBox(height: 8),
                          Text("18", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,),),
                        ],
                      ),
                      Column(
                        children: [
                          Text("SAB", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold,),),
                          SizedBox(height: 8),
                          Text("19", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,),),
                        ],
                      ),
                    ],
                  ),
                ),

                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 125,
                        height: 1,
                        color: Colors.grey,
                      ),
                      Text(
                        "Hoje 14",
                        style: TextStyle(
                            color: Color(0xFF3d9aba),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 125,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),

                  //BANCO DE DADOS
                  Container(
                    width: double.infinity,
                    height: 275,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: agendamentosDoDia.length,
                      itemBuilder: (context, i) {
                        return CardAgendamento(agendamento: agendamentosDoDia[i]);
                      },
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 125,
                        height: 1,
                        color: Colors.grey,
                      ),
                      Text("Agenda", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 17, fontWeight: FontWeight.bold),),
                      Container(
                        width: 125,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Container(
                    padding:
                    const EdgeInsets.only(top: 10, left: 35, right: 35),
                    width: double.infinity,
                    height: 250,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFbeffab),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    icon: const FaIcon(
                                        FontAwesomeIcons.stethoscope),
                                    color: Colors.black,
                                    iconSize: 35,
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF87a8f2),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    icon: const FaIcon(
                                        FontAwesomeIcons.hospitalUser),
                                    color: Colors.black,
                                    iconSize: 35,
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("    Consulta", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
                            Text("    Quimioterapia", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Color(0xFFdeaac9),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.userDoctor),
                                    color: Colors.black,
                                    iconSize: 50,
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Color(0xFFe9dd8b),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.pills),
                                    color: Colors.black,
                                    iconSize: 40,
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("   Exame", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
                            Text("   Remédio", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
                            )
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


}