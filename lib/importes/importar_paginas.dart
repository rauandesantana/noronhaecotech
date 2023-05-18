import 'package:flutter/material.dart';
import 'package:noronhaecotech/carregamento.dart';
import 'package:noronhaecotech/importes/paginas/cadastro.dart';
import 'package:noronhaecotech/importes/paginas/login.dart';
import 'package:noronhaecotech/importes/paginas/principal/principal_inicio.dart';
////////////////////////////////////////////////////////////////////////////////
export 'package:noronhaecotech/idiomas/arquivos_gerados/l10n.dart';

typedef Rotas = Map<String, WidgetBuilder>;
typedef Pagina = $Pagina;

// ----------------------------------------------------------------------------- Paginas
class Paginas {
  Paginas();
  //////////////////////////////////////////////////////////////////////////////
  static Widget get carregamento => const Carregamento();
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
  // =========================================================================== Lista Paginas
  static final List<Pagina> _lista = [
    login,
    cadastro,
    inicio,
  ];
  //////////////////////////////////////////////////////////////////////////////

  static Map<String, bool> get restricao {
    return {for (var pagina in _lista) pagina.caminho: pagina.restrita};
  }

  static Rotas get rotas {
    return {for (var pagina in _lista) pagina.caminho: pagina.objeto};
  }
}

// ----------------------------------------------------------------------------- Pagina
class $Pagina {
  final String caminho;
  final WidgetBuilder objeto;
  final bool restrita;

  $Pagina({
    required this.caminho,
    required this.objeto,
    this.restrita = false,
  });
}
