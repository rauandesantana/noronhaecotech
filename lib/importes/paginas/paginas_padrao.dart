import 'package:noronhaecotech/importes/modelos/modelos_paginas.dart';
import 'package:noronhaecotech/importes/paginas/objetos/cadastro.dart';
import 'package:noronhaecotech/importes/paginas/objetos/login.dart';
import 'package:noronhaecotech/importes/paginas/objetos/principal/principal_inicio.dart';
import 'package:noronhaecotech/importes/paginas/objetos/usuario/usuario_recuperar_senha.dart';

// ----------------------------------------------------------------------------- Paginas Padrão
class $PaginasPadrao {
  const $PaginasPadrao();
  ////////////////////////////////////////////////////////////////////////////// Definir Paginas

  // =========================================================================== Paginas Publicas
  // --------------------------------------------------------------------------- Login
  Pagina get login => Pagina(
        caminho: "/login",
        construtor: (context) => const Login(),
        tags: [Pagina.tag.publica, Pagina.tag.auth],
      );

  // --------------------------------------------------------------------------- Cadastro
  Pagina get cadastro => Pagina(
        caminho: "/cadastro",
        construtor: (context) => const Cadastro(),
        tags: [Pagina.tag.publica, Pagina.tag.auth],
      );

  // =========================================================================== Paginas Restritas
  // --------------------------------------------------------------------------- Inicio
  Pagina get inicio => Pagina(
        caminho: "/inicio",
        construtor: (context) => const PrincipalInicio(),
        tags: [Pagina.tag.restrita],
      );

  // --------------------------------------------------------------------------- Recuperar Senha
  Pagina get recuperarSenha => Pagina(
    caminho: "/recuperar_senha",
    construtor: (context) => const UsuarioRecuperarSenha(),
    tags: [Pagina.tag.restrita],
  );
}
