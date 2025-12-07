import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto/api/propriedades_api.dart';
import 'package:projeto/pages/google_maps_page.dart';


class Mensagens2Page extends StatefulWidget {
  const Mensagens2Page({super.key});

  @override
  State<Mensagens2Page> createState() => _Mensagens2PageState();
}

class _Mensagens2PageState extends State<Mensagens2Page> {
  final TextEditingController _mensagemController = TextEditingController();


  final List<_Mensagem> _mensagens = [
    _Mensagem(texto: 'Vamos saber o motivo do seu cansaço essa semana!', enviado: false),
    _Mensagem(texto: 'Oi! Tudo bem.', enviado: true),
  ];

  @override
  void dispose() {
    _mensagemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: Column(
          children: [
            Expanded(child: _buildMensagensList()),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    // Coordenadas fixas para a navegação
    const latitude = -9.922842720540832;
    const longitude = -36.472142390214614;
    final position = LatLng(latitude, longitude);

    return AppBar(
      backgroundColor: const Color(0xFF3D9ABA),
      titleSpacing: 0,
      leadingWidth: 45,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: const [
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              'https://static.vecteezy.com/ti/vetor-gratis/p1/1886209-doctor-medical-cartoon-design-vetor.jpg',
            ),
          ),
          SizedBox(width: 15),
          Text(
            'Dr. Carlos João',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      // AÇÃO DO MAPA IMPLEMENTADA DIRETAMENTE AQUI
      actions: [
        IconButton(
          icon: const Icon(Icons.location_on, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GoogleMapsPage(position: position),
              ),
            );
          },
        ),
        const SizedBox(width: 5),
      ],
    );
  }

  Widget _buildMensagensList() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _mensagens.length,
      itemBuilder: (context, index) {
        final msg = _mensagens[index];
        return Align(
          alignment:
          msg.enviado ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: msg.enviado
                  ? const Color(0xFFBBDEFB)
                  : Colors.grey[250],
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft:
                msg.enviado ? const Radius.circular(16) : Radius.zero,
                bottomRight:
                msg.enviado ? Radius.zero : const Radius.circular(16),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 1,
                  offset: Offset(1, 2),
                ),
              ],
            ),
            child: Text(
              msg.texto,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      color: Colors.grey[300],
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _mensagemController,
              decoration: const InputDecoration(
                hintText: 'Mensagem',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.grey),
            onPressed: () {},
          ),
          FloatingActionButton(
            mini: true,
            backgroundColor: const Color(0xFF3D9ABA),
            onPressed: _enviarMensagem,
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }

  void _enviarMensagem() {
    final texto = _mensagemController.text.trim();
    if (texto.isEmpty) return;

    setState(() {
      _mensagens.add(_Mensagem(texto: texto, enviado: true));
      _mensagemController.clear();
    });
  }
}

class _Mensagem {
  final String texto;
  final bool enviado;

  _Mensagem({required this.texto, required this.enviado});
}
