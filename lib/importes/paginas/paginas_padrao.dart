import 'package:noronhaecotech/importes/modelos/modelos_paginas.dart';
import 'package:noronhaecotech/importes/paginas/objetos/cadastro.dart';
import 'package:noronhaecotech/importes/paginas/objetos/login.dart';
import 'package:noronhaecotech/importes/paginas/objetos/principal/principal_inicio.dart';

// ----------------------------------------------------------------------------- Paginas Padrão
class $PaginasPadrao {
  const $PaginasPadrao();
  ////////////////////////////////////////////////////////////////////////////// Definir Paginas

  // =========================================================================== Paginas Publicas
  // --------------------------------------------------------------------------- Login
  Pagina get login => Pagina(
        caminho: "/login",
        construtor: (context) => Login(),
        tags: [Pagina.tag.publica, Pagina.tag.auth],
      );

  // --------------------------------------------------------------------------- Cadastro
  Pagina get cadastro => Pagina(
        caminho: "/cadastro",
        construtor: (context) => Cadastro(),
        tags: [Pagina.tag.publica, Pagina.tag.auth],
      );

  // =========================================================================== Paginas Restritas
  // --------------------------------------------------------------------------- Inicio
  Pagina get inicio => Pagina(
        caminho: "/inicio",
        construtor: (context) => const PrincipalInicio(),
        tags: [Pagina.tag.restrita],
      );
}
