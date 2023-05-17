import 'package:flutter/material.dart';
import 'package:noronhaecotech/carregamento.dart';
import 'package:noronhaecotech/importes/paginas/cadastro.dart';
import 'package:noronhaecotech/importes/paginas/login.dart';
import 'package:noronhaecotech/importes/paginas/principal/principal_inicio.dart';
export 'package:noronhaecotech/idiomas/arquivos_gerados/l10n.dart';

class Paginas {
  Paginas();
  //////////////////////////////////////////////////////////////////////////////
  static Widget get carregamento => const Carregamento();
  static String get rotaInicial => "/login";
  static Map<String, WidgetBuilder> get rotas {
    return {
      ////////////////////////////////////////////////////////////////////////// Rotas Publicas
      "/login": (context) => const Login(),
      "/cadastro": (context) => const Cadastro(),
      ////////////////////////////////////////////////////////////////////////// Rotas Restritas
      // ----------------------------------------------------------------------- Principal
      "/inicio": (context) => const PrincipalInicio(),
    };
  }
}
