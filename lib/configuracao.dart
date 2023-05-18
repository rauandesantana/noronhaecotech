import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_paginas.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';

typedef Rotas = Map<String, WidgetBuilder>;

// ----------------------------------------------------------------------------- Configuração
class Configuracao {
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Padrão
  final String tituloApp;
  final bool debugBanner;
  final ThemeData temaClaro;
  final ThemeData temaEscuro;

  // =========================================================================== Navegação e Autenticação
  final GlobalKey<NavigatorState> chaveNavegador;
  final Stream<User?> estadoUsuario;

  // =========================================================================== Rotas e Idiomas
  final Rotas rotas;
  final Iterable<Locale> idiomasSuportados;
  final Iterable<LocalizationsDelegate> idiomasDelegar;

  Configuracao({
    required this.tituloApp,
    this.debugBanner = false,
    required this.temaClaro,
    required this.temaEscuro,
    required this.chaveNavegador,
    required this.estadoUsuario,
    required this.rotas,
    required this.idiomasSuportados,
    required this.idiomasDelegar,
  }) {
    _aoMudarEstadoUsuario;
  }
  //////////////////////////////////////////////////////////////////////////////
  final RouteObserver<PageRoute> observadorNavegador = ObservadorNavegador();
  bool _usuarioLogado = FirebaseAuth.instance.currentUser != null;
  bool get usuarioLogado => _usuarioLogado;
  Pagina get rotaInicial => (_usuarioLogado) ? Paginas.inicio : Paginas.login;

  void get _aoMudarEstadoUsuario {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      estadoUsuario.listen((usuario) {
        final valorAtual = usuario != null;
        if (valorAtual != _usuarioLogado) {
          _usuarioLogado = valorAtual;
          _redirecionarUsuario();
        }
      });
    });
  }

  _redirecionarUsuario() {
    final contextoAtual = chaveNavegador.currentContext;
    if (contextoAtual != null) {
      if (_usuarioLogado) {
        Sistemas.navegador.padrao(
          context: contextoAtual,
          pagina: Paginas.inicio,
          fecharAnterior: true,
        );
      } else {
        Sistemas.navegador.padrao(
          context: contextoAtual,
          pagina: Paginas.login,
          fecharAnterior: true,
        );
      }
    }
  }
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
    final logado = FirebaseAuth.instance.currentUser != null;
    bool? restricaoPagina;
    Paginas.restricao.forEach((caminho, restricao) {
      if (caminho == rota.settings.name) restricaoPagina = restricao;
    });
    if (!logado && restricaoPagina == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        rota.navigator?.pushNamed(Paginas.login.caminho);
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
