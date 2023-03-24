import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/estilos/botao/botao_elevado.dart';
import 'package:noronhaecotech/importes/estilos/imagem/imagem_arquivo.dart';
import 'package:noronhaecotech/importes/estilos/texto/texto_decorativo.dart';
import 'package:noronhaecotech/importes/estilos/texto/texto_normal.dart';
import 'package:noronhaecotech/importes/estilos/texto/texto_titulo.dart';

class Estilos {
  const Estilos();
  //////////////////////////////////////////////////////////////////////////////
  static $EstFonte get fonte => const $EstFonte();
  static $EstTexto get texto => const $EstTexto();
  static $EstBotao get botao => const $EstBotao();
  static $EstImagem get imagem => const $EstImagem();
}

// ----------------------------------------------------------------------------- Fontes
class $EstFonte {
  const $EstFonte();
  //////////////////////////////////////////////////////////////////////////////
  String get noronhaEcoTech => "Orbitron";
  String get noronhaDesigner => "Brighton";
}

// ----------------------------------------------------------------------------- Imagem
class $EstImagem {
  const $EstImagem();
  //////////////////////////////////////////////////////////////////////////////
  $EstImagemIcones get icones => const $EstImagemIcones();
  $EstImagemLogos get logos => const $EstImagemLogos();
}

// ----------------------------------------------------------------------------- Texto
class $EstTexto {
  const $EstTexto();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Texto Normal
  TextStyle normal({
    Color? corTexto,
    String? fonte,
    FontWeight? negrito,
    double? tamanho,
  }) =>
      $EstTextoNormal(
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

  // --------------------------------------------------------------------------- Texto Decorativo
  TextStyle decorativo({
    Color? corTexto,
    String? fonte,
    FontWeight? negrito,
    double? tamanho,
  }) =>
      $EstTextoDecorativo(
        corTexto: corTexto,
        fonte: fonte,
        negrito: negrito,
        tamanho: tamanho,
      );
}

// ----------------------------------------------------------------------------- Botão
class $EstBotao {
  const $EstBotao();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Botão Elevado
  ButtonStyle elevado({
    required BuildContext context,
    required bool habilitado,
    Color? corPrimaria,
    Color? corSecundaria,
    Color? corDesabilitado,
    BorderSide? borda,
    BorderRadius? arredondarBorda,
    EdgeInsetsGeometry? espacoInterno,
  }) =>
      $EstBotaoElevado(
        context: context,
        habilitado: habilitado,
        corPrimaria: corPrimaria,
        corSecundaria: corSecundaria,
        corDesabilitado: corDesabilitado,
        borda: borda,
        arredondarBorda: arredondarBorda,
        espacoInterno: espacoInterno,
      );
}
