import 'package:flutter/material.dart';
import 'package:noronhaecotech/carregamento.dart';
import 'package:noronhaecotech/importes/paginas/cadastro.dart';
import 'package:noronhaecotech/importes/paginas/login.dart';
import 'package:noronhaecotech/importes/paginas/principal/principal_inicio.dart';
////////////////////////////////////////////////////////////////////////////////
export 'package:noronhaecotech/idiomas/arquivos_gerados/l10n.dart';

typedef Rotas = Map<String, WidgetBuilder>;
typedef Pagina = $Pagina;

class Paginas {
  Paginas();
  //////////////////////////////////////////////////////////////////////////////
  // =========================================================================== Paginas Publicas
  static Pagina get login => Pagina(
        caminho: "/login",
        objeto: (context) => const Login(),
      );
  static Pagina get cadastro => Pagina(
        caminho: "/cadastro",
        objeto: (context) => const Cadastro(),
      );
  // =========================================================================== Paginas Restritas
  static Pagina get inicio => Pagina(
        caminho: "/inicio",
        objeto: (context) => const PrincipalInicio(),
        restrita: true,
      );
  //////////////////////////////////////////////////////////////////////////////
  static Pagina get rotaInicial => login;
  static Widget get carregamento => const Carregamento();
  static Rotas get rotas {
    return Map.of({
      ...login.rota,
      ...cadastro.rota,
      ...inicio.rota,
    });
  }
}

class $Pagina {
  final String caminho;
  final WidgetBuilder objeto;
  final bool? restrita;
  Rotas rota = {};

  $Pagina({
    required this.caminho,
    required this.objeto,
    this.restrita,
  }) {
    rota = {caminho: objeto};
  }
}
