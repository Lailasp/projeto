import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//teste

class agenda extends StatefulWidget {
  const agenda({super.key});


  @override
  State<agenda> createState() => _agendaState();
}


class _agendaState extends State<agenda> {
  int selectedIndex = 0;
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
          onButtonPressed: (index) {},
          iconSize: 25,
          //activeColor: Color(0xFFC3EBF8),
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
      )
    );
  }

  buildBody(){
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Agenda", style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold )
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 720,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    width: 400,
                    height: 70,
                    padding: EdgeInsets.only(right: 14, left: 14, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(onPressed: () {}, child: Text("Dia", style: TextStyle(color: Color(0xFF3d9aba), fontSize: 20.0),)),
                        TextButton(onPressed: () {}, child: Text("Semana", style: TextStyle(color: Color(0xFF3d9aba),fontSize: 20.0),)),
                        TextButton(onPressed: () {}, child: Text("Mês", style: TextStyle(color: Color(0xFF3d9aba),fontSize: 20.0),))
                      ],
                    ),
                  ),
                  Divider(),

                  Container(
                  width: 400,
                  height: 50,
                  padding: EdgeInsets.only(right: 9, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("14", style: TextStyle(color: Color(0xFF3d9aba),)),
                      Text("ABRIL", style:TextStyle(color: Color(0xFF3d9aba),fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Text("2025", style: TextStyle(color: Color(0xFF3d9aba),)),
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


