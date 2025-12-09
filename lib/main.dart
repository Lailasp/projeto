import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto/pages/agendaMes.dart';
import 'package:projeto/provider/agenda_provider.dart';

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