import 'package:flutter/material.dart';
import 'package:projeto/Domain/propriedades.dart';
import 'package:projeto/Api/Address_Api.dart';
import 'package:projeto/Domain/Address.dart';

class CardPropriedades extends StatefulWidget {
  final Propriedades propriedades;

  CardPropriedades({required this.propriedades, super.key});

  @override
  State<CardPropriedades> createState() => _CardPropriedadesState();
}

class _CardPropriedadesState extends State<CardPropriedades> {
  Propriedades get propriedades => widget.propriedades;
  late String urlImage = widget.propriedades.urlImagem;

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
