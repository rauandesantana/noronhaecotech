import 'package:flutter/material.dart';
import 'package:noronhaecotech/estilos/texto/texto_padrao.dart';
import 'package:noronhaecotech/estilos/texto/texto_titulo.dart';

class Estilos {
  const Estilos();
  //////////////////////////////////////////////////////////////////////////////
  static $EstFonte get fonte => const $EstFonte();
  static $EstTexto get texto => const $EstTexto();
}

class $EstFonte {
  const $EstFonte();
  //////////////////////////////////////////////////////////////////////////////
  String get noronhaEcoTech => "Orbitron";
  String get noronhaDesigner => "Brighton";
}

// ----------------------------------------------------------------------------- Texto
class $EstTexto {
  const $EstTexto();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Texto Padrão
  TextStyle padrao({
    Color? corTexto,
    String? fonte,
    FontWeight? negrito,
    double? tamanho,
  }) =>
      $EstTextoPadrao(
        corTexto: corTexto,
        fonte: fonte,
        negrito: negrito,
        tamanho: tamanho,
      );

  // --------------------------------------------------------------------------- Texto Titulo
  TextStyle titulo({
    required BuildContext context,
    Color? corTexto,
    String? fonte,
    FontWeight? negrito,
    double? escala,
  }) =>
      $EstTextoTitulo(
        context: context,
        corTexto: corTexto,
        fonte: fonte,
        negrito: negrito,
        escala: escala,
      );
}
