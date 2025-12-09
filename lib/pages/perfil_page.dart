import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projeto/providers/humor_providers.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {

  @override
  Widget build(BuildContext context) {
    final humorAtual = context.watch<HumorProvider>().humorDoDia;

    Color corHumor;
    IconData iconeHumor;

    if (humorAtual.contains("Feliz")) {
      corHumor = Colors.green;
      iconeHumor = FontAwesomeIcons.faceSmile;
    } else if (humorAtual.contains("Triste")) {
      corHumor = Colors.orange;
      iconeHumor = FontAwesomeIcons.faceSadTear;
    } else {
      corHumor = Color(0xFF008DC0);
      iconeHumor = FontAwesomeIcons.faceMeh;
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFFc3ebf8),
                  child: Icon(Icons.person, size: 60, color: Color(0xFF3d9aba)),
                ),
                SizedBox(height: 15),
                Text(
                  "Paciente Modelo",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF3d9aba)),
                ),
                Text(
                  "paciente@email.com",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: corHumor.withOpacity(0.5), width: 2),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: corHumor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: FaIcon(iconeHumor, color: corHumor, size: 30),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Status Atual",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      Text(
                        humorAtual, // ------------------------------------------------------------------------------------------------
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: corHumor
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Minha Conta",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3d9aba)),
                ),
                SizedBox(height: 10),
                _buildProfileOption(Icons.person_outline, "Dados Pessoais"),
                _buildProfileOption(Icons.history, "Histórico Médico"),
                _buildProfileOption(Icons.notifications_none, "Notificações"),

                SizedBox(height: 20),

                Text(
                  "Aplicativo",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3d9aba)),
                ),
                SizedBox(height: 10),
                _buildProfileOption(Icons.settings_outlined, "Configurações"),
                _buildProfileOption(Icons.help_outline, "Ajuda e Suporte"),
                _buildProfileOption(Icons.logout, "Sair", isRed: true),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {bool isRed = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: isRed ? Colors.red : Color(0xFF3d9aba)),
        title: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isRed ? Colors.red : Colors.black87
            )
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}