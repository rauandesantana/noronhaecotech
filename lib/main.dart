import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:noronhaecotech/importes/importar_paginas.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // --------------------------------------------------------------------------- Carregamento
  runApp(Paginas.carregamento);
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    ////////////////////////////////////////////////////////////////////////////
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    ////////////////////////////////////////////////////////////////////////////
  ]).whenComplete(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //////////////////////////////////////////////////////////////////////////
      title: "Noronha EcoTech",
      debugShowCheckedModeBanner: false,
      initialRoute: Paginas.rotaInicial,
      routes: Paginas.rotas,
      // ----------------------------------------------------------------------- Idiomas
      supportedLocales: Idiomas.delegate.supportedLocales,
      localizationsDelegates: const [
        Idiomas.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // ----------------------------------------------------------------------- Temas
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
