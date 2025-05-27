import 'package:flutter/material.dart';


class agenda extends StatefulWidget {
  const agenda({super.key});


  @override
  State<agenda> createState() => _agendaState();
}


class _agendaState extends State<agenda> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                margin: EdgeInsets.only(top: 5, bottom: 32, left: 5, right: 5),
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
                        'Dr. Maria Lúcia',
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
                        'Dr. Beatriz',
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
                        'Dr. Mariana',
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


