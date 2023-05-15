import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/paginas/principal/principal_cadastro.dart';
import 'package:noronhaecotech/importes/paginas/principal/principal_login.dart';
import 'package:noronhaecotech/importes/paginas/principal/principal_inicio.dart';
export 'package:noronhaecotech/idiomas/arquivos_gerados/l10n.dart';

class Paginas {
  const Paginas();
  static String _rotaInicial = "/login";
  static final Map<String, Widget Function(BuildContext)> _rotas = {
    //////////////////////////////////////////////////////////////////////////
    // ------------------------------------------------------------------------- Principal
    "/login": (context) => const PrincipalLogin(),
    "/cadastro": (context) => const PrincipalCadastro(),
    "/inicio": (context) => const PrincipalInicio(),
    //////////////////////////////////////////////////////////////////////////
  };
  static Map<String, Widget Function(BuildContext)> get rotas => _rotas;
  static String get rotaInicial => _rotaInicial;
  static set definirRotaInicial(String rota) {
    if (_rotas.containsKey(rota)) _rotaInicial = rota;
  }
}
