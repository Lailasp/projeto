import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projeto/pages/explore_page.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int selectedIndex = 0;

  var pages = [
    ExplorePage(),
    Center(child: Text('Pagina 1', style: TextStyle(fontSize: 32))),
    Center(child: Text('Pagina 2', style: TextStyle(fontSize: 32))),
    Center(child: Text('Pagina 3', style: TextStyle(fontSize: 32))),
    Center(child: Text('Pagina 4', style: TextStyle(fontSize: 32))),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF3D9ABA),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: SlidingClippedNavBar(
            backgroundColor: Colors.white,
            onButtonPressed: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            iconSize: 25,
            activeColor: const Color(0xFF3D9ABA),
            selectedIndex: selectedIndex,
            barItems: [
              BarItem(icon: FontAwesomeIcons.house, title: 'Diário'),
              BarItem(icon: FontAwesomeIcons.solidCalendarDays, title: 'Agenda'),
              BarItem(icon: FontAwesomeIcons.solidMessage, title: 'Mensagens'),
              BarItem(icon: FontAwesomeIcons.solidCircleUser, title: 'Perfil'),
            ],
          ),
        ),

      ),
    );
  }
}


