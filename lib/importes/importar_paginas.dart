import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/paginas/autenticacao.dart';
import 'package:noronhaecotech/importes/paginas/login/login_celular.dart';
import 'package:noronhaecotech/importes/paginas/principal/principal_inicio.dart';
export 'package:noronhaecotech/idiomas/arquivos_gerados/l10n.dart';

class Paginas {
  const Paginas();
  //////////////////////////////////////////////////////////////////////////////
  static String rotaInicial() => "/";
  static Map<String, Widget Function(BuildContext)> rotas() {
    return {
      "/": (context) => const Autenticacao(),
      //////////////////////////////////////////////////////////////////////////
      "/login": (context) => const LoginCelular(),
      //////////////////////////////////////////////////////////////////////////
      "/inicio": (context) => const PrincipalInicio(),
      //////////////////////////////////////////////////////////////////////////
    };
  }
}
