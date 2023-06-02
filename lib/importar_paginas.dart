import 'package:flutter/material.dart';
import 'package:noronhaecotech/importar_sistemas.dart';
import 'package:noronhaecotech/paginas/objetos/carregamento.dart';
import 'package:noronhaecotech/paginas/paginas_padrao.dart';
////////////////////////////////////////////////////////////////////////////////
export 'package:noronhaecotech/importar_modelos.dart';

typedef Rotas = Map<String, WidgetBuilder>;
typedef Restricoes = Map<String, List<String>>;
typedef Acesso = $PaginasPadrao;

// ----------------------------------------------------------------------------- Paginas
class Paginas {
  Paginas();
  //////////////////////////////////////////////////////////////////////////////
  static Acesso get acesso => const Acesso();
  static Widget get carregamento => const Carregamento();
  static Pagina get rotaLogado => acesso.inicio;
  static Pagina get rotaDeslogado => acesso.login;
  static Pagina get rotaInicial =>
      (Sistemas.firebase.auth.logado) ? rotaLogado : rotaDeslogado;

  // =========================================================================== Lista de Paginas
  static List<Pagina> get _lista => [
        // ------------------------------------------------------------------------- Paginas Publicas
        acesso.login,
        acesso.cadastro,
        // ------------------------------------------------------------------------- Paginas Restritas
        acesso.inicio,
        acesso.recuperarSenha,
      ];

  // =========================================================================== Restrições
  static Restricoes get tags {
    return {for (var pagina in _lista) pagina.caminho: pagina.tags};
  }

  // =========================================================================== Rotas
  static Rotas get rotas {
    return {for (var pagina in _lista) pagina.caminho: pagina.construtor};
  }
}