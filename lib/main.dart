import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tp1_2363662/ecran_connexion.dart';
import 'package:dio/dio.dart';
import 'package:tp1_2363662/ecran_consultation.dart';

import 'ecran_accueil.dart';
import 'ecran_creation.dart';
import 'ecran_inscription.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('fr'),
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
      '/consultation': (context) => const EcranConsultation(tacheId: 0),
    };
  }
}



