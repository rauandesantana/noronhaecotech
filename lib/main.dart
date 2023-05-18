import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:noronhaecotech/configuracao.dart';
import 'package:noronhaecotech/firebase_options.dart';
import 'package:noronhaecotech/importes/importar_paginas.dart';

void main() async {
  runApp(Paginas.carregamento);
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    //////////////////////////////////////////////////////////////////////////// Carregar Dependencias
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    ////////////////////////////////////////////////////////////////////////////
  ]).whenComplete(() {
    //////////////////////////////////////////////////////////////////////////// Configuração
    final config = Configuracao(
      tituloApp: "Noronha EcoTech",
      temaClaro: Tema.claro,
      temaEscuro: Tema.escuro,
      chaveNavegador: GlobalKey<NavigatorState>(),
      estadoUsuario: FirebaseAuth.instance.authStateChanges(),
      rotas: Paginas.rotas,
      idiomasSuportados: Idiomas.delegate.supportedLocales,
      idiomasDelegar: const [
        Idiomas.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
    ////////////////////////////////////////////////////////////////////////////
    runApp(
      MaterialApp(
        title: config.tituloApp,
        debugShowCheckedModeBanner: config.debugBanner,
        navigatorKey: config.chaveNavegador,
        navigatorObservers: [config.observadorNavegador],
        initialRoute: config.rotaInicial.caminho,
        routes: config.rotas,
        supportedLocales: config.idiomasSuportados,
        localizationsDelegates: config.idiomasDelegar,
        theme: config.temaClaro,
        darkTheme: config.temaEscuro,
      ),
    );
  });
}
