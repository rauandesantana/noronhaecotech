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
////////////////////////////////////////////////////////////////////////////////
export 'package:noronhaecotech/importes/importar_modelos.dart';

// ----------------------------------------------------------------------------- Estilos
class Estilos {
  const Estilos();
  //////////////////////////////////////////////////////////////////////////////
  static $EstFonte get fonte => const $EstFonte();
  static $EstTexto get texto => const $EstTexto();
  static $EstBotao get botao => const $EstBotao();
  static $EstImagem get imagem => const $EstImagem();
  static $EstSelecao get selecao => const $EstSelecao();
}

// ----------------------------------------------------------------------------- Estilos Fontes
class $EstFonte {
  const $EstFonte();
  //////////////////////////////////////////////////////////////////////////////
  String get noronhaEcoTech => "Orbitron";
  String get noronhaDesigner => "Brighton";
}

// ----------------------------------------------------------------------------- Estilos Imagem
class $EstImagem {
  const $EstImagem();
  //////////////////////////////////////////////////////////////////////////////
  $EstImagemIcones get icones => const $EstImagemIcones();
  $EstImagemLogos get logos => const $EstImagemLogos();
}

// ----------------------------------------------------------------------------- Estilos Texto
class $EstTexto {
  const $EstTexto();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Texto Seleção
  EditableTextContextMenuBuilder menuTexto({
    bool? copiar,
    bool? colar,
    bool? recortar,
    bool? custom,
    bool? deletar,
  }) {
    return (context, editableTextState) {
      return AdaptiveTextSelectionToolbar(
        anchors: editableTextState.contextMenuAnchors,
        children: editableTextState.contextMenuButtonItems.map((buttonItem) {
          bool estado = true;

          switch(buttonItem.type) {
            case ContextMenuButtonType.copy:
              estado = copiar ?? true;
              break;
            case ContextMenuButtonType.cut:
              estado = recortar ?? true;
              break;
            case ContextMenuButtonType.paste:
              estado = colar ?? true;
              break;
            case ContextMenuButtonType.selectAll:
              estado = true;
              break;
            case ContextMenuButtonType.custom:
              estado = custom ?? true;
              break;
            case ContextMenuButtonType.delete:
              estado = deletar ?? true;
              break;
          }

          return (estado == true) ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.4),
            child: CupertinoButton(
              borderRadius: null,
              color: Theme.of(context).primaryColor,
              disabledColor: Theme.of(context).primaryColor.withOpacity(0.5),
              onPressed: buttonItem.onPressed,
              padding: const EdgeInsets.all(10),
              pressedOpacity: 0.7,
              minSize: 10,
              child: Componentes.texto.padrao(
                estilo: Estilos.texto.decorativo(
                  corTexto: Theme.of(context).scaffoldBackgroundColor,
                  negrito: FontWeight.w500,
                ),
                texto: CupertinoTextSelectionToolbarButton.getButtonLabel(
                  context,
                  buttonItem,
                ),
              ),
            ),
          ) : const SizedBox(width: 0, height: 0);
        }).toList(),
      );
    };
  }

  // =========================================================================== Texto Formatar
  List<TextInputFormatter> formatar({
    required FormatosTexto formato,
  }) =>
      [$EstTextoFormatar(formato: formato)];

  // =========================================================================== Texto Normal
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

  // =========================================================================== Texto Titulo
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

  // =========================================================================== Texto Decorativo
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

  // =========================================================================== Texto Campo
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

// ----------------------------------------------------------------------------- Estilos Botão
class $EstBotao {
  const $EstBotao();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Botão Elevado
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

  // =========================================================================== Botão Borda
  ButtonStyle borda({
    required BuildContext context,
    required bool habilitado,
    Color? corPrimaria,
    Color? corSecundaria,
    Color? corDesabilitado,
    Color? corFundo,
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
        corFundo: corFundo,
        borda: borda,
        arredondarBorda: arredondarBorda,
        espacoInterno: espacoInterno,
      );

  // =========================================================================== Botão Texto
  ButtonStyle texto({
    required BuildContext context,
    required bool habilitado,
    Color? corPrimaria,
    Color? corSecundaria,
    Color? corDesabilitado,
    Color? corFundo,
    BorderRadius? arredondarBorda,
    EdgeInsetsGeometry? espacoInterno,
  }) =>
      $EstBotaoTexto(
        context: context,
        habilitado: habilitado,
        corPrimaria: corPrimaria,
        corSecundaria: corSecundaria,
        corDesabilitado: corDesabilitado,
        corFundo: corFundo,
        arredondarBorda: arredondarBorda,
        espacoInterno: espacoInterno,
      );
}

// ----------------------------------------------------------------------------- Estilos Botão
class $EstSelecao {
  const $EstSelecao();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Seleção Campo
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
