import 'package:flutter/material.dart';
import 'package:tp1_2363662/ecran_connexion.dart';
import 'package:dio/dio.dart';

import 'ecran_accueil.dart';
import 'ecran_creation.dart';
import 'ecran_inscription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tp1',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const EcranConnexion(),
      routes: routes(),
    );
  }

  Map<String, WidgetBuilder> routes() {
    return {
      '/inscription': (context) => const EcranInscription(),
      '/connexion': (context) => const EcranConnexion(),
      '/accueil': (context) => const EcranAccueil(),
      '/creation': (context) => const EcranCreation(),
    };
  }
}



