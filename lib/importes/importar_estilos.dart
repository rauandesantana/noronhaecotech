import 'package:flutter/material.dart';
import 'package:noronhaecotech/estilos/texto/texto_padrao.dart';
import 'package:noronhaecotech/estilos/texto/texto_titulo.dart';

class Estilos {
  const Estilos();
  //////////////////////////////////////////////////////////////////////////////
  static $EstilosFonte get fonte => const $EstilosFonte();
  static $EstilosTexto get texto => const $EstilosTexto();
}

class $EstilosFonte {
  const $EstilosFonte();
  //////////////////////////////////////////////////////////////////////////////
  String get noronhaEcoTech => "Orbitron";
  String get noronhaDesigner => "Brighton";
}

// ----------------------------------------------------------------------------- Texto
class $EstilosTexto {
  const $EstilosTexto();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Texto Padrão
  TextStyle padrao({
    Color? corTexto,
    String? fonte,
    FontWeight? negrito,
    double? tamanho,
  }) =>
      $EstilosTextoPadrao(
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
      $EstilosTextoTitulo(
        context: context,
        corTexto: corTexto,
        fonte: fonte,
        negrito: negrito,
        escala: escala,
      );
}
