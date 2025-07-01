import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class Inicial extends StatefulWidget {
  const Inicial({super.key});

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF3d9aba),
        appBar: buildAppBar(),
        body: buildBody(),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: SlidingClippedNavBar(
            backgroundColor: Colors.white,
            onButtonPressed: (index) {},
            iconSize: 25,
            activeColor: Color(0xFF3D9ABA),
            selectedIndex: selectedIndex,
            barItems: [
              BarItem(icon: FontAwesomeIcons.house, title: 'Diário'),
              BarItem(
                icon: FontAwesomeIcons.solidCalendarDays,
                title: 'Agenda',
              ),
              BarItem(icon: FontAwesomeIcons.solidMessage, title: 'Mensagens'),
              BarItem(icon: FontAwesomeIcons.solidCircleUser, title: 'Perfil'),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF3d9aba),
      title: Text(
        "PulmoVida",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              "Check-in diário",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Como você está se sentindo hoje?",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
            // Emojis
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.faceSadCry, size: 35,),
                ),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.faceSadTear, size: 35,),
                ),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.faceMeh, size: 35,),
                ),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.faceSmile, size: 35,),
                ),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.faceLaugh, size: 35,),
                ),
              ],
            ),

            Divider(height: 25,),
            Text(
              "Registre seus sintomas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            //Lista de sintomas
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS46PwIKiRHW3YgkaIy5UxP76pneop6EuL1kQ&s",
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    Text("Tosse"),
                    Text("persistente"),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS46PwIKiRHW3YgkaIy5UxP76pneop6EuL1kQ&s",
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    Text("Dor no"),
                    Text("peito"),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS46PwIKiRHW3YgkaIy5UxP76pneop6EuL1kQ&s",
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    Text("Falta de ar"),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Icon(FontAwesomeIcons.add, size: 20,
                        ),
                      ),
                    ),
                    Text("Outros..."),
                  ],
                ),
              ],
            ),
            Divider(height: 25,),
            //Lembretes diários container
            Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              height: 307,

              decoration: BoxDecoration(
                color: Color(0xFFc3ebf8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Lembretes diários",
                    style: TextStyle(
                      color: Color(0xFF3d9aba),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.only(right: 16, left: 16, top: 2, bottom: 2),
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/1998/1998221.png", height: 40,
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Quimioterapia", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                Text("15:00", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.bell, color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(right: 16, left: 16, top: 2, bottom: 2),
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/1998/1998221.png", height: 40,
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Paclitaxel", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                Text("19:00", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.bell, color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(right: 16, left: 16, top: 2, bottom: 2),
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/1998/1998221.png", height: 40,
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Consulta com pneumologista", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                Text("19:30", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.bell, color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
