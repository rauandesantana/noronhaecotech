import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:noronhaecotech/firebase_options.dart';
import 'package:noronhaecotech/importes/importar_paginas.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';

void main() async {
  // --------------------------------------------------------------------------- Carregamento
  runApp(Paginas.carregamento);
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    ////////////////////////////////////////////////////////////////////////////
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    ////////////////////////////////////////////////////////////////////////////
  ]).whenComplete(() {
    GlobalKey<NavigatorState> chaveNavegador = GlobalKey();
    final autenticacao = FirebaseAuth.instance.authStateChanges();
    bool logado = FirebaseAuth.instance.currentUser != null;

    runApp(
      MaterialApp(
        ////////////////////////////////////////////////////////////////////////
        title: "Noronha EcoTech",
        debugShowCheckedModeBanner: false,
        navigatorKey: chaveNavegador,
        initialRoute: Paginas.rotaInicial.caminho,
        routes: Paginas.rotas,
        // --------------------------------------------------------------------- Idiomas
        supportedLocales: Idiomas.delegate.supportedLocales,
        localizationsDelegates: const [
          Idiomas.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // --------------------------------------------------------------------- Temas
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.grey,
        ),
        ////////////////////////////////////////////////////////////////////////
      ),
    );

    autenticacao.listen((usuario) {
      final bool valorAtual = usuario != null;
      if (logado != valorAtual) {
        logado = valorAtual;
        final contextoAtual = chaveNavegador.currentContext;
        if (contextoAtual != null) {
          if (valorAtual) {
            Sistemas.navegador.padrao(
              context: contextoAtual,
              pagina: Paginas.inicio,
            );
          } else {
            Sistemas.navegador.padrao(
              context: contextoAtual,
              pagina: Paginas.login,
            );
          }
        }
      }
    });
  });
}
