import 'package:flutter/material.dart';
import 'package:projeto/propriedades.dart';

class CardPropriedades extends StatefulWidget {
  final Propriedades propriedades;

  CardPropriedades({required this.propriedades, super.key});

  @override
  State<CardPropriedades> createState() => _CardPropriedadesState();
}

class _CardPropriedadesState extends State<CardPropriedades> {
  Propriedades get propriedades => widget.propriedades;
  late String urlImage = widget.propriedades.urlImagem;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
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
          // 1. The Expanded widget was removed from here
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            margin: const EdgeInsets.only(
              top: 0,
              bottom: 20,
              left: 7,
              right: 7,
            ),
            padding: const EdgeInsets.all(5),
            // 2. This was changed from ListView to Column
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    urlImage
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.propriedades.nomeUsuario,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.propriedades.email,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                const ListTile(
                  leading: Icon(Icons.person, color: Color(0xFF3D9ABA)),
                  title: Text('Dados pessoais'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                const Divider(indent: 72, endIndent: 16),
                const ListTile(
                  leading: Icon(Icons.badge, color: Color(0xFF3D9ABA)),
                  title: Text('Carteira nacional de saúde'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                const Divider(indent: 72, endIndent: 16),
                const ListTile(
                  leading: Icon(
                    Icons.insert_drive_file,
                    color: Color(0xFF3D9ABA),
                  ),
                  title: Text('Relatório médico'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                const Divider(indent: 72, endIndent: 16),
                const ListTile(
                  leading: Icon(Icons.bar_chart, color: Color(0xFF3D9ABA)),
                  title: Text('Gráficos'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                const Divider(indent: 72, endIndent: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
