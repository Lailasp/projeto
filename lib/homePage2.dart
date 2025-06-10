import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         bottomNavigationBar: ClipRRect(
           borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
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

        /*
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          child: BottomNavigationBar(
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
          ),
        ),*/


        backgroundColor: Color(0xFF3D9ABA),
        body: Column(
          children: [
            Text(
              "Mensagens",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
                margin: EdgeInsets.only(top: 5, bottom: 20, left: 5, right: 5),
                padding: EdgeInsets.all(5),

                child: ListView(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                          'https://static.vecteezy.com/ti/vetor-gratis/p1/1886209-doctor-medical-cartoon-design-vetor.jpg',
                        ),
                      ),
                      title: Text(
                        'Dr. Carlos João',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF3D9ABA),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        'Vamos saber o motivo de seu cansaço essa semana',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFCACCCC),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Divider(indent: 80, endIndent: 24),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                          'https://img.lovepik.com/png/20231112/obgyn-clipart-female-naturopathic-doctor-in-lab-coat-with-cells_572098_wh860.png',
                        ),
                      ),
                      title: Text(
                        'Dra. Maria Lúcia',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF3D9ABA),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        'Vamos marcar sua próxima avaliação para essa semana.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFCACCCC),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Divider(indent: 80, endIndent: 24),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                          'https://img.pikbest.com/png-images/qiantu/cartoon-female-doctor-original-elements_2537037.png!w700wp',
                        ),
                      ),
                      title: Text(
                        'Dra. Beatriz',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF3D9ABA),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        'Analisei seus gráficos e estão ótimos!',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFCACCCC),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Divider(indent: 80, endIndent: 24),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                          'https://images.vexels.com/content/144170/preview/character-doctor-woman-d6ee7a.png',
                        ),
                      ),
                      title: Text(
                        'Dra. Mariana',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF3D9ABA),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        'Estou feliz com seu progresso!',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFCACCCC),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Divider(indent: 80, endIndent: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
