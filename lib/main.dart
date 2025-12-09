import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto/inicial.dart';
import 'package:projeto/providers/humor_providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HumorProvider()),],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Inicial(),),
    ),
  );
}