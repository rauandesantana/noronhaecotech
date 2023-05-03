import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/paginas/autenticacao.dart';
import 'package:noronhaecotech/importes/paginas/principal/principal_cadastro.dart';
import 'package:noronhaecotech/importes/paginas/principal/principal_login.dart';
import 'package:noronhaecotech/importes/paginas/principal/principal_inicio.dart';
export 'package:noronhaecotech/idiomas/arquivos_gerados/l10n.dart';

class Paginas {
  const Paginas();
  //////////////////////////////////////////////////////////////////////////////
  static String get rotaInicial => "/";
  static Map<String, Widget Function(BuildContext)> get rotas {
    return {
      "/": (context) => const Autenticacao(),
      // ----------------------------------------------------------------------- Principal
      "/login": (context) => const PrincipalLogin(),
      "/cadastro": (context) => const PrincipalCadastro(),
      "/inicio": (context) => const PrincipalInicio(),
      //////////////////////////////////////////////////////////////////////////
    };
  }
}
