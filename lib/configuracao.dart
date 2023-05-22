import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_paginas.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';

typedef Rotas = Map<String, WidgetBuilder>;

// ----------------------------------------------------------------------------- Configuração
class Configuracao {
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Definições
  final String tituloApp;
  final bool debugBanner;
  final ThemeData temaClaro;
  final ThemeData temaEscuro;
  final GlobalKey<NavigatorState> chaveNavegador;
  final Rotas rotas;
  final Iterable<Locale> idiomasSuportados;
  final Iterable<LocalizationsDelegate> idiomasDelegar;

  Configuracao({
    required this.tituloApp,
    this.debugBanner = false,
    required this.temaClaro,
    required this.temaEscuro,
    required this.chaveNavegador,
    required this.rotas,
    required this.idiomasSuportados,
    required this.idiomasDelegar,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Sistemas.firebase.auth.observadorAutenticacao(
        acaoLogado: () =>
            observadorNavegador.navigator?.pushNamedAndRemoveUntil(
          Paginas.rotaLogado.caminho,
          ModalRoute.withName(Paginas.rotaLogado.caminho),
        ),
        acaoDeslogado: () =>
            observadorNavegador.navigator?.pushNamedAndRemoveUntil(
          Paginas.rotaDeslogado.caminho,
          ModalRoute.withName(Paginas.rotaDeslogado.caminho),
        ),
      );
    });
  }
  //////////////////////////////////////////////////////////////////////////////
  final RouteObserver<PageRoute> observadorNavegador = ObservadorNavegador();
  Pagina get rotaInicial => Paginas.rotaInicial;
}

// ----------------------------------------------------------------------------- Tema
class Tema {
  const Tema();
  //////////////////////////////////////////////////////////////////////////////
  // =========================================================================== Tema Claro
  static ThemeData get claro => ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      );

  // =========================================================================== Tema Escuro
  static ThemeData get escuro => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      );
}

// ----------------------------------------------------------------------------- Observador Navegador
class ObservadorNavegador extends RouteObserver<PageRoute> {
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Observador
  void _observador(PageRoute rota) {
    final logado = Sistemas.firebase.auth.logado;
    bool? tagRestrita;
    bool? tagAuth;
    Paginas.tags.forEach((caminho, tags) {
      if (caminho == rota.settings.name) {
        for (var tag in tags) {
          if (tag == Pagina.tag.restrita) tagRestrita = true;
          if (tag == Pagina.tag.auth) tagAuth = true;
        }
      }
    });
    if (logado == false && tagRestrita == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        rota.navigator?.pushNamedAndRemoveUntil(
          Paginas.rotaDeslogado.caminho,
          ModalRoute.withName(Paginas.rotaDeslogado.caminho),
        );
      });
    } else if (logado == true && tagAuth == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        rota.navigator?.pushNamedAndRemoveUntil(
          Paginas.rotaLogado.caminho,
          ModalRoute.withName(Paginas.rotaLogado.caminho),
        );
      });
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _observador(route);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _observador(newRoute);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _observador(previousRoute);
    }
  }
}
