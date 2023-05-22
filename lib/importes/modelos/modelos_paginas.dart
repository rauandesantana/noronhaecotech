import 'package:flutter/material.dart';

typedef Tags = $PaginaTags;

// ----------------------------------------------------------------------------- Pagina
class Pagina {
  final String caminho;
  final WidgetBuilder objeto;
  final List<String> tags;

  Pagina({
    required this.caminho,
    required this.objeto,
    required this.tags,
  });
  //////////////////////////////////////////////////////////////////////////////
  static Tags get tag => Tags();
}

// ----------------------------------------------------------------------------- Pagina Marcações
class $PaginaTags {
  $PaginaTags();
  ////////////////////////////////////////////////////////////////////////////// Definir Pagina Tags
  final String publica = "publica";
  final String restrita = "restrita";
  final String auth = "autenticação";
}
