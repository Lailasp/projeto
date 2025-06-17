import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';


class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});


  @override
  State<HomePage2> createState() => _HomePage2State();
}


class _HomePage2State extends State<HomePage2> {
  int selectedIndex = 3;


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
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Perfil",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
                margin: const EdgeInsets.only(top: 0, bottom: 20, left: 7, right: 7),
                padding: const EdgeInsets.all(5),
                child: ListView(
                  children: const [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://saae.lucasdorioverde.mt.gov.br/arquivos/setores/sem_imagem_avatar.png',
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Maria Laura da Silva',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'maria@email.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 24),
                    ListTile(
                      leading: Icon(Icons.person, color: Color(0xFF3D9ABA)),
                      title: Text('Dados pessoais'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                    Divider(indent: 72, endIndent: 16),
                    ListTile(
                      leading: Icon(Icons.badge, color: Color(0xFF3D9ABA)),
                      title: Text('Carteira nacional de saúde'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                    Divider(indent: 72, endIndent: 16),
                    ListTile(
                      leading: Icon(Icons.insert_drive_file, color: Color(0xFF3D9ABA)),
                      title: Text('Relatório médico'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                    Divider(indent: 72, endIndent: 16),
                    ListTile(
                      leading: Icon(Icons.bar_chart, color: Color(0xFF3D9ABA)),
                      title: Text('Gráficos'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                    Divider(indent: 72, endIndent: 16),
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
