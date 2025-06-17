import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class agenda extends StatefulWidget {
  const agenda({super.key});


  @override
  State<agenda> createState() => _agendaState();
}
//asdasd

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
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.white,
              ),
              child: ListView(
                children: [
                  Container(
                    width: 400,
                    height: 50,
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
                  height: 25,
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
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  Container(
                    width: double.infinity,
                    height: 275,
                    padding: EdgeInsets.only(left: 7),

                    child: Column(

                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("07:00", style: TextStyle(color: Colors.black)),
                                Container(
                                  height: 5,
                                  width: 340,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("08:00", style: TextStyle(color: Colors.black)),
                                Container(
                                  height: 5,
                                  width: 340,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("09:00", style: TextStyle(color: Colors.black)),
                                Container(
                                  height: 5,
                                  width: 340,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("10:00", style: TextStyle(color: Colors.black)),
                                Container(
                                  height: 5,
                                  width: 340,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("11:00", style: TextStyle(color: Colors.black)),
                                Container(
                                  height: 5,
                                  width: 340,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("12:00", style: TextStyle(color: Colors.black)),
                                Container(
                                  height: 5,
                                  width: 340,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("13:00", style: TextStyle(color: Colors.black)),
                                Container(
                                  height: 5,
                                  width: 340,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("14:00", style: TextStyle(color: Colors.black)),
                                Container(
                                  height: 5,
                                  width: 340,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("15:00", style: TextStyle(color: Colors.black)),
                                Container(
                                  padding: EdgeInsets.only(left: 3),
                                  height: 25,
                                  width: 340,
                                  color: Color(0xFF87a8f2),
                                  child:
                                  Text("Quimioterapia", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("16:00", style: TextStyle(color: Colors.black)),
                                Container(
                                  height: 5,
                                  width: 340,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("17:00", style: TextStyle(color: Colors.black)),
                                Container(
                                  padding: EdgeInsets.only(left: 3),
                                  height: 25,
                                  width: 340,
                                  color: Color(0xFFe9dd8b),
                                  child:
                                  Text("Paclitaxel", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("18:00", style: TextStyle(color: Colors.black)),
                                Container(
                                  height: 5,
                                  width: 340,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("19:00", style: TextStyle(color: Colors.black)),
                                Container(
                                  padding: EdgeInsets.only(left: 3),
                                  height: 25,
                                  width: 340,
                                  color: Color(0xFFbeffab),
                                  child:
                                  Text("Pneumologista", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                )
                              ],
                            ),
                          ],
                        ),

                      ],
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
                      Text("Agenda", style: TextStyle(color: Color(0xFF3d9aba),fontSize: 17, fontWeight: FontWeight.bold),),
                      Container(
                        width: 125,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 35, right: 35),
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
                                color: Color(0xFFbeffab),
                                borderRadius: BorderRadius.circular(40)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.stethoscope),
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
                                  color: Color(0xFF87a8f2),
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.hospitalUser),
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
                                  borderRadius: BorderRadius.circular(40)
                              ),
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
                                  borderRadius: BorderRadius.circular(40)
                              ),
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
                            Text("   Remédio", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),)
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


