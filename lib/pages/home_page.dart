import 'package:projeto/db/db_helper.dart';
import 'package:projeto/pages/explore_page.dart' show ExplorePage;
import 'package:projeto/pages/mensagens_page.dart' show MensagensPage;
import 'package:projeto/pages/login_page.dart' show LoginPage;
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int selectedIndex = 2;

  var pages = [
    ExplorePage(),
    Center(child: Text('Pagina 2', style: TextStyle(fontSize: 32))),
    MensagensPage(),
    Center(child: Text('Pagina 4', style: TextStyle(fontSize: 32))),
  ];

  @override
  Widget build(BuildContext context) {
    // Remover
    //DBHelper().initDB();

    return SafeArea(
      child: Scaffold(
        body: pages[selectedIndex],
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
            iconSize: 30,
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

  /*
  buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      backgroundColor: Colors.white,
      unselectedItemColor: Color(0xFF6C6C6C),
      selectedItemColor: Color(0xFFE41D56),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Explorer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.airbnb),
          label: 'Trips',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.message),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.circleUser),
          label: 'Profile',
        ),
      ],
    );
  }*/
}


