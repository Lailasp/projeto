import 'package:flutter/material.dart';
import 'package:projeto/pages/google_maps_page.dart';
import 'package:projeto/domain/propriedade1.dart';
import 'package:projeto/api/address_api.dart';
import 'package:projeto/domain/address.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CardPropriedades1 extends StatefulWidget {
  final Propriedades1 propriedades1;


  CardPropriedades1({required this.propriedades1, super.key});


  @override
  State<CardPropriedades1> createState() => _CardPropriedades1State();
}


class _CardPropriedades1State extends State<CardPropriedades1> {
  Propriedades1 get propriedades1 => widget.propriedades1;
  late String urlImage = widget.propriedades1.urlImagem;


  final AddressApi _addressApi = AddressApi();
  final TextEditingController _medicamentoController = TextEditingController();


  String _apiResultado = "Pesquise um medicamento para ver seu propósito.";
  String _apiErro = "";
  bool _isLoading = false;


  Future<void> _buscarMedicamento() async {
    if (_medicamentoController.text.isEmpty) return;


    setState(() {
      _isLoading = true;
      _apiErro = "";
      _apiResultado = "";
    });


    try {
      final Address info = await _addressApi.buscarMedicamento(
        _medicamentoController.text,
      );


      setState(() {
        _isLoading = false;
        _apiResultado =
        "Propósito: ${info.proposta}\n\nMarca: ${info.marcaName}";
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _apiErro = e.toString().replaceAll(
          "Exception: ",
          "",
        ); // Remove "Exception: "
      });
    }
  }


  void _navigateToGoogleMaps() {
    const latitude = -9.73440;
    const longitude = -36.65542;
    final position = LatLng(latitude, longitude);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoogleMapsPage(position: position),
      ),
    );
  }


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
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(urlImage),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.propriedades1.nomeUsuario,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.propriedades1.email,
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
                ListTile(
                  leading: const Icon(
                    Icons.location_on, // Ícone de localização (sugestão)
                    color: Color(0xFF3D9ABA),
                  ),
                  trailing:
                  const Icon(Icons.arrow_forward_ios, size: 16), // Seta de navegação
                  onTap: _navigateToGoogleMaps, // Ação ao tocar
                ),
                const Divider(indent: 72, endIndent: 16),


                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListTile(
                        leading: Icon(
                          Icons.medication,
                          color: Color(0xFF3D9ABA),
                        ),
                        title: Text('Consultar Medicamento'),
                        subtitle: Text('Digite o ingrediente ativo em INGLÊS'),
                      ),
                      const SizedBox(height: 10),
                      // Novo ListTile para o botão do mapa (substituindo o ElevatedButton)

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          controller: _medicamentoController,
                          decoration: InputDecoration(
                            labelText: 'Ingrediente Ativo (ex: ibuprofen)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: _isLoading ? null : _buscarMedicamento,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Área de Resultado
                      Center(
                        child:
                        _isLoading
                            ? const CircularProgressIndicator()
                            : _apiErro.isNotEmpty
                            ? Text(
                          _apiErro,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        )
                            : Text(
                          _apiResultado,
                          style: const TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),

              ],


            ),
          ),
        ],
      ),
    );
  }
}
