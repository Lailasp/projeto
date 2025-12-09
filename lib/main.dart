import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importe o pacote
import 'package:projeto/pages/agendaMes.dart';
import 'package:projeto/provider/agenda_provider.dart'; // Importe seu novo provider

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AgendaProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AgendaMes(),
      ),
    ),
  );
}