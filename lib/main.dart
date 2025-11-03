import 'package:projeto/agenda.dart';
import 'package:flutter/material.dart';
import 'package:projeto/agendaSemana.dart';
import 'package:projeto/agendaSemanaApi.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgendaSemanaApi(),
    ),
  );
}