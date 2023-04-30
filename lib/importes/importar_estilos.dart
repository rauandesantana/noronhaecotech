import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noronhaecotech/importes/estilos/botao/botao_borda.dart';
import 'package:noronhaecotech/importes/estilos/botao/botao_elevado.dart';
import 'package:noronhaecotech/importes/estilos/botao/botao_texto.dart';
import 'package:noronhaecotech/importes/estilos/imagem/imagem_arquivo.dart';
import 'package:noronhaecotech/importes/estilos/selecao/selecao_campo.dart';
import 'package:noronhaecotech/importes/estilos/texto/texto_campo.dart';
import 'package:noronhaecotech/importes/estilos/texto/texto_decorativo.dart';
import 'package:noronhaecotech/importes/estilos/texto/texto_formatar.dart';
import 'package:noronhaecotech/importes/estilos/texto/texto_normal.dart';
import 'package:noronhaecotech/importes/estilos/texto/texto_titulo.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
export 'package:noronhaecotech/importes/modelos/modelos_formatos_texto.dart';

class Estilos {
  const Estilos();
  //////////////////////////////////////////////////////////////////////////////
  static $EstFonte get fonte => const $EstFonte();
  static $EstTexto get texto => const $EstTexto();
  static $EstBotao get botao => const $EstBotao();
  static $EstImagem get imagem => const $EstImagem();
  static $EstSelecao get selecao => const $EstSelecao();
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

  // --------------------------------------------------------------------------- Texto Seleção
  EditableTextContextMenuBuilder get menuTexto {
    return (context, editableTextState) {
      return AdaptiveTextSelectionToolbar(
        anchors: editableTextState.contextMenuAnchors,
        children: editableTextState.contextMenuButtonItems.map((buttonItem) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.4),
            child: CupertinoButton(
              borderRadius: null,
              color: Theme.of(context).primaryColor,
              disabledColor: Theme.of(context).disabledColor,
              onPressed: buttonItem.onPressed,
              padding: const EdgeInsets.all(10),
              pressedOpacity: 0.7,
              minSize: 10,
              child: Componentes.texto.padrao(
                estilo: Estilos.texto.decorativo(
                  negrito: FontWeight.w500,
                ),
                texto: CupertinoTextSelectionToolbarButton.getButtonLabel(
                  context,
                  buttonItem,
                ),
              ),
            ),
          );
        }).toList(),
      );
    };
  }

  // --------------------------------------------------------------------------- Texto Formatar
  List<TextInputFormatter> formatar({
    required FormatosTexto formato,
  }) =>
      [$EstTextoFormatar(formato: formato)];

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

  // --------------------------------------------------------------------------- Texto Campo
  InputDecoration campo({
    required BuildContext context,
    BorderSide? bordaHabilitada,
    BorderSide? bordaDesabilitada,
    BorderSide? bordaFoco,
    BorderSide? bordaErro,
    BorderSide? bordaFocoErro,
    BorderRadius? arredondarBorda,
    EdgeInsetsGeometry? espacoInterno,
    Color? corIcone,
    String? textoTitulo,
    String? textoAjuda,
    String? textoErro,
    String? textoDica,
    String? textoPrefixo,
    String? textoSufixo,
    Widget? componenteExterno,
    Widget? componentePrefixo,
    Widget? componenteSufixo,
    TextStyle? estiloTitulo,
    TextStyle? estiloAjuda,
    TextStyle? estiloErro,
    TextStyle? estiloDica,
    TextStyle? estiloTextoPrefixo,
    TextStyle? estiloTextoSufixo,
  }) =>
      $EstTextoCampo(
        context: context,
        bordaHabilitada: bordaHabilitada,
        bordaDesabilitada: bordaDesabilitada,
        bordaFoco: bordaFoco,
        bordaErro: bordaErro,
        bordaFocoErro: bordaFocoErro,
        arredondarBorda: arredondarBorda,
        espacoInterno: espacoInterno,
        corIcone: corIcone,
        textoTitulo: textoTitulo,
        textoAjuda: textoAjuda,
        textoErro: textoErro,
        textoDica: textoDica,
        textoPrefixo: textoPrefixo,
        textoSufixo: textoSufixo,
        componenteExterno: componenteExterno,
        componentePrefixo: componentePrefixo,
        componenteSufixo: componenteSufixo,
        estiloTitulo: estiloTitulo,
        estiloAjuda: estiloAjuda,
        estiloErro: estiloErro,
        estiloDica: estiloDica,
        estiloTextoPrefixo: estiloTextoPrefixo,
        estiloTextoSufixo: estiloTextoSufixo,
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

  // --------------------------------------------------------------------------- Botão Borda
  ButtonStyle borda({
    required BuildContext context,
    required bool habilitado,
    Color? corPrimaria,
    Color? corSecundaria,
    Color? corDesabilitado,
    double? borda,
    BorderRadius? arredondarBorda,
    EdgeInsetsGeometry? espacoInterno,
  }) =>
      $EstBotaoBorda(
        context: context,
        habilitado: habilitado,
        corPrimaria: corPrimaria,
        corSecundaria: corSecundaria,
        corDesabilitado: corDesabilitado,
        borda: borda,
        arredondarBorda: arredondarBorda,
        espacoInterno: espacoInterno,
      );

  // --------------------------------------------------------------------------- Botão Texto
  ButtonStyle texto({
    required BuildContext context,
    required bool habilitado,
    Color? corPrimaria,
    Color? corSecundaria,
    Color? corDesabilitado,
    BorderRadius? arredondarBorda,
    EdgeInsetsGeometry? espacoInterno,
  }) =>
      $EstBotaoTexto(
        context: context,
        habilitado: habilitado,
        corPrimaria: corPrimaria,
        corSecundaria: corSecundaria,
        corDesabilitado: corDesabilitado,
        arredondarBorda: arredondarBorda,
        espacoInterno: espacoInterno,
      );
}

// ----------------------------------------------------------------------------- Botão
class $EstSelecao {
  const $EstSelecao();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Seleção Campo
  InputDecoration campo({
    required BuildContext context,
    bool? habilitado,
    BorderSide? bordaHabilitada,
    BorderSide? bordaDesabilitada,
    BorderSide? bordaFoco,
    BorderSide? bordaErro,
    BorderSide? bordaFocoErro,
    BorderRadius? arredondarBorda,
    EdgeInsetsGeometry? espacoInterno,
    Color? corIcone,
    String? textoTitulo,
    String? textoAjuda,
    String? textoErro,
    String? textoDica,
    String? textoPrefixo,
    String? textoSufixo,
    Widget? componenteExterno,
    Widget? componentePrefixo,
    Widget? componenteSufixo,
    TextStyle? estiloTitulo,
    TextStyle? estiloAjuda,
    TextStyle? estiloErro,
    TextStyle? estiloDica,
    TextStyle? estiloTextoPrefixo,
    TextStyle? estiloTextoSufixo,
  }) =>
      $EstSelecaoCampo(
        context: context,
        habilitado: habilitado,
        bordaHabilitada: bordaHabilitada,
        bordaDesabilitada: bordaDesabilitada,
        bordaFoco: bordaFoco,
        bordaErro: bordaErro,
        bordaFocoErro: bordaFocoErro,
        arredondarBorda: arredondarBorda,
        espacoInterno: espacoInterno,
        corIcone: corIcone,
        textoTitulo: textoTitulo,
        textoAjuda: textoAjuda,
        textoErro: textoErro,
        textoDica: textoDica,
        textoPrefixo: textoPrefixo,
        textoSufixo: textoSufixo,
        componenteExterno: componenteExterno,
        componentePrefixo: componentePrefixo,
        componenteSufixo: componenteSufixo,
        estiloTitulo: estiloTitulo,
        estiloAjuda: estiloAjuda,
        estiloErro: estiloErro,
        estiloDica: estiloDica,
        estiloTextoPrefixo: estiloTextoPrefixo,
        estiloTextoSufixo: estiloTextoSufixo,
      );
}
