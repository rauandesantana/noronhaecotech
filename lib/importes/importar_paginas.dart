import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';
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
  static autenticacao(bool autenticacao, {BuildContext? context}) {
    const String paginaLogado = "/inicio";
    const String paginaDeslogado = "/login";

    if (context != null) {
      if (!autenticacao) {
        Sistemas.navegador.padrao(
          context: context,
          pagina: paginaDeslogado,
          fecharAnterior: true,
        );
      }
    } else {
      _rotaInicial = (autenticacao) ? paginaLogado : paginaDeslogado;
    }
  }
}
