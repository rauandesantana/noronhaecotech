import 'package:noronhaecotech/importes/modelos/modelos_paginas.dart';
import 'package:noronhaecotech/paginas/objetos/rota_inicial.dart';
import 'package:noronhaecotech/paginas/objetos/cadastro.dart';
import 'package:noronhaecotech/paginas/objetos/login.dart';
import 'package:noronhaecotech/paginas/objetos/principal/principal_inicio.dart';
import 'package:noronhaecotech/paginas/objetos/usuario/usuario_perfil.dart';
import 'package:noronhaecotech/paginas/objetos/usuario/usuario_recuperar_senha.dart';
////////////////////////////////////////////////////////////////////////////////
import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Paginas Padrão
class $PaginasPadrao {
  const $PaginasPadrao();
  ////////////////////////////////////////////////////////////////////////////// Definir Paginas

  // =========================================================================== Paginas Publicas

  // --------------------------------------------------------------------------- Apresentação
  Pagina get rotaInicial => Pagina(
        caminho: "/",
        construtor: (context) => const RotaInicial(),
        tags: [Pagina.tag.publica, Pagina.tag.auth],
      );

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
  // --------------------------------------------------------------------------- Pasta Usuario
  $PastaPrincipal get principal => const $PastaPrincipal("/principal");

  // --------------------------------------------------------------------------- Pasta Usuario
  $PastaUsuario get usuario => const $PastaUsuario("/usuario");
}

// ----------------------------------------------------------------------------- Pasta Principal
class $PastaPrincipal {
  final String _pasta;
  const $PastaPrincipal(this._pasta);
  //////////////////////////////////////////////////////////////////////////////
  // =========================================================================== Inicio
  Pagina get inicio => Pagina(
        caminho: "$_pasta/inicio",
        construtor: (context) => const PrincipalInicio(),
        tags: [Pagina.tag.restrita],
      );
}

// ----------------------------------------------------------------------------- Pasta Usuario
class $PastaUsuario {
  final String _pasta;
  const $PastaUsuario(this._pasta);
  //////////////////////////////////////////////////////////////////////////////
  // =========================================================================== Recuperar Senha
  Pagina get recuperarSenha => Pagina(
        caminho: "$_pasta/recuperar_senha",
        construtor: (context) => UsuarioRecuperarSenha(),
        tags: [Pagina.tag.restrita],
      );

  // =========================================================================== Recuperar Senha
  Pagina get perfil => Pagina(
        caminho: "$_pasta/perfil",
        construtor: (context) => const UsuarioPerfil(),
        tags: [Pagina.tag.restrita],
      );
}
