import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:noronhaecotech/importes/importar_paginas.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    //////////////////////////////////////////////////////////////////////////// Carregamento
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    ////////////////////////////////////////////////////////////////////////////
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noronha EcoTech',
      initialRoute: Paginas.rotaInicial,
      routes: Paginas.rotas,
      ////////////////////////////////////////////////////////////////////////// Idiomas
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        Idiomas.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Idiomas.delegate.supportedLocales,
      ////////////////////////////////////////////////////////////////////////// Temas
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey,
      ),
      //////////////////////////////////////////////////////////////////////////
    );
  }
}
