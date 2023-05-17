import 'package:flutter/material.dart';
import 'package:noronhaecotech/carregamento.dart';
import 'package:noronhaecotech/importes/paginas/cadastro.dart';
import 'package:noronhaecotech/importes/paginas/login.dart';
import 'package:noronhaecotech/importes/paginas/principal/principal_inicio.dart';
export 'package:noronhaecotech/idiomas/arquivos_gerados/l10n.dart';

class Paginas {
  const Paginas();

  static final Map<String, WidgetBuilder> _rotas = {
    "/login": (context) => const Login(),
    "/cadastro": (context) => const Cadastro(),
    // ------------------------------------------------------------------------- Principal
    "/inicio": (context) => const PrincipalInicio(),
  };
  static const String _rotaInicial = "/login";
  static const Widget _carregamento = Carregamento();

  //////////////////////////////////////////////////////////////////////////////

  static Map<String, WidgetBuilder> get rotas => _rotas;
  static String get rotaInicial => _rotaInicial;
  static Widget get carregamento => _carregamento;
}
