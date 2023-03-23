import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/paginas/login/login_rapido.dart';

class Paginas {
  const Paginas();
  //////////////////////////////////////////////////////////////////////////////
  static String rotaInicial() => "/";
  static Map<String, Widget Function(BuildContext)> rotas() => {
    "/": (context) => const LoginRapido(),
  };
}