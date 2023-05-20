import 'package:flutter/material.dart';
import 'package:noronhaecotech/carregamento.dart';
import 'package:noronhaecotech/importes/paginas/cadastro.dart';
import 'package:noronhaecotech/importes/paginas/login.dart';
import 'package:noronhaecotech/importes/paginas/principal/principal_inicio.dart';
////////////////////////////////////////////////////////////////////////////////
export 'package:noronhaecotech/idiomas/arquivos_gerados/l10n.dart';

typedef Rotas = Map<String, WidgetBuilder>;
typedef Restricoes = Map<String, bool>;
typedef Pagina = $Pagina;

// ----------------------------------------------------------------------------- Paginas
class Paginas {
  Paginas();
  //////////////////////////////////////////////////////////////////////////////
  static Widget get carregamento => const Carregamento();
  static Pagina get rotaLogado => inicio;
  static Pagina get rotaDeslogado => login;
  static Pagina get rotaInicial => rotaDeslogado;

  ////////////////////////////////////////////////////////////////////////////// Definir Paginas

  // =========================================================================== Paginas Publicas
  // --------------------------------------------------------------------------- Login
  static Pagina get login => Pagina(
    caminho: "/login",
    objeto: (context) => const Login(),
  );

  // --------------------------------------------------------------------------- Cadastro
  static Pagina get cadastro => Pagina(
    caminho: "/cadastro",
    objeto: (context) => const Cadastro(),
  );

  // =========================================================================== Paginas Restritas
  // --------------------------------------------------------------------------- Inicio
  static Pagina get inicio => Pagina(
    caminho: "/inicio",
    objeto: (context) => const PrincipalInicio(),
    restrita: true,
  );

  ////////////////////////////////////////////////////////////////////////////// Listar Paginas

  // =========================================================================== Lista Paginas
  static final List<Pagina> _lista = [
    login,
    cadastro,
    inicio,
  ];

  // =========================================================================== Restrições
  static Restricoes get restricoes {
    return {for (var pagina in _lista) pagina.caminho: pagina.restrita};
  }

  // =========================================================================== Rotas
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
