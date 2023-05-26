import 'package:flutter/material.dart';
import 'package:noronhaecotech/carregamento.dart';
import 'package:noronhaecotech/importes/modelos/modelos_paginas.dart';
import 'package:noronhaecotech/importes/paginas/paginas_padrao.dart';
////////////////////////////////////////////////////////////////////////////////
export 'package:noronhaecotech/idiomas/arquivos_gerados/l10n.dart';
export 'package:noronhaecotech/importes/modelos/modelos_paginas.dart';

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
  static Pagina get rotaInicial => rotaDeslogado;

  // =========================================================================== Lista de Paginas
  static List<Pagina> get _lista => [
    // ------------------------------------------------------------------------- Paginas Publicas
    acesso.login,
    acesso.cadastro,
    // ------------------------------------------------------------------------- Paginas Restritas
    acesso.inicio,
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
