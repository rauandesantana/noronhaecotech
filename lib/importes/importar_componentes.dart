import 'package:flutter/material.dart';
import 'package:noronhaecotech/componentes/botao/botao_elevado.dart';
import 'package:noronhaecotech/componentes/carregamento/carregamento_circular.dart';
import 'package:noronhaecotech/componentes/imagem/imagem_padrao.dart';
import 'package:noronhaecotech/componentes/pagina/pagina_padrao.dart';
import 'package:noronhaecotech/componentes/texto/texto_padrao.dart';

class Componentes {
  const Componentes();
  //////////////////////////////////////////////////////////////////////////////
  static $CompPagina get pagina => const $CompPagina();
  static $CompTexto get texto => const $CompTexto();
  static $CompImagem get imagem => const $CompImagem();
  static $CompCarregamento get carregamento => const $CompCarregamento();
  static $CompBotao get botao => const $CompBotao();
}

// ----------------------------------------------------------------------------- Pagina
class $CompPagina {
  const $CompPagina();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Pagina Padrão
  Widget padrao({
    bool? paginaIndisponivel,
    PreferredSizeWidget? barraSuperior,
    required List<Widget> conteudo,
    Widget? barraInferior,
    Widget? botaoFlutuante,
    FloatingActionButtonAnimator? animacaoBotaoFlutuante,
    FloatingActionButtonLocation? localidadeBotaoFlutuante,
    Widget? menuGavetaEsquerda,
    void Function(bool)? aoMudarMenuGavetaEsquerda,
    Widget? menuGavetaDireita,
    void Function(bool)? aoMudarMenuGavetaDireita,
    Widget? gavetaInferior,
  }) =>
      $CompPaginaPadrao(
        paginaIndisponivel: paginaIndisponivel,
        barraSuperior: barraSuperior,
        conteudo: conteudo,
        barraInferior: barraInferior,
        botaoFlutuante: botaoFlutuante,
        animacaoBotaoFlutuante: animacaoBotaoFlutuante,
        localidadeBotaoFlutuante: localidadeBotaoFlutuante,
        menuGavetaEsquerda: menuGavetaEsquerda,
        aoMudarMenuGavetaEsquerda: aoMudarMenuGavetaEsquerda,
        menuGavetaDireita: menuGavetaDireita,
        aoMudarMenuGavetaDireita: aoMudarMenuGavetaDireita,
        gavetaInferior: gavetaInferior,
      );
}

// ----------------------------------------------------------------------------- Texto
class $CompTexto {
  const $CompTexto();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Texto Padrão
  Widget padrao({
    required String texto,
    TextStyle? estilo,
    StrutStyle? estiloEscorar,
    TextAlign? alinhamento,
    TextDirection? direcao,
    Locale? localidade,
    bool? envolverFlexivel,
    TextOverflow? transbordar,
    double? fatorEscala,
    int? maxLinhas,
    String? textoSemantico,
    TextWidthBasis? baseLargura,
    TextHeightBehavior? comportamentoAltura,
    Color? corSelecao,
  }) =>
      $CompTextoPadrao(
        texto: texto,
        estilo: estilo,
        estiloEscorar: estiloEscorar,
        alinhamento: alinhamento,
        direcao: direcao,
        localidade: localidade,
        envolverFlexivel: envolverFlexivel,
        transbordar: transbordar,
        fatorEscala: fatorEscala,
        maxLinhas: maxLinhas,
        textoSemantico: textoSemantico,
        baseLargura: baseLargura,
        comportamentoAltura: comportamentoAltura,
        corSelecao: corSelecao,
      );
}

// ----------------------------------------------------------------------------- Carregamento
class $CompCarregamento {
  const $CompCarregamento();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Carregamento Circular
  Widget circular({
    double? valor,
    Color? corBarra,
    double? espessura,
  }) =>
      $CompCarregamentoCircular(
        valor: valor,
        corBarra: corBarra,
        espessura: espessura,
      );
}

// ----------------------------------------------------------------------------- Imagem
class $CompImagem {
  const $CompImagem();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Imagem Padrao
  Widget padrao({
    required String imagem,
    double? largura,
    double? altura,
    BoxFit? ajuste,
    AlignmentGeometry? alinhamento,
    ImageRepeat? repetirImagem,
    Color? corImagem,
    int? cacheLargura,
    int? cacheAltura,
    Widget Function(BuildContext, Widget, ImageChunkEvent?)? carregamento,
  }) =>
      $CompImagemPadrao(
        imagem: imagem,
        largura: largura,
        altura: altura,
        ajuste: ajuste,
        alinhamento: alinhamento,
        repetirImagem: repetirImagem,
        corImagem: corImagem,
        cacheLargura: cacheLargura,
        cacheAltura: cacheAltura,
        carregamento: carregamento,
      );
}

// ----------------------------------------------------------------------------- Botão
class $CompBotao {
  const $CompBotao();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Botão Elevado
  Widget elevado({
    required void Function()? aoPrecionar,
    void Function()? aoSegurar,
    void Function(bool)? aoPassar,
    void Function(bool)? aoMudarFoco,
    ButtonStyle? estilo,
    FocusNode? foco,
    bool? autoFoco,
    required String titulo,
    TextStyle? estiloTitulo,
  }) =>
      $CompBotaoElevado(
        aoPrecionar: aoPrecionar,
        aoSegurar: aoSegurar,
        aoPassar: aoPassar,
        aoMudarFoco: aoMudarFoco,
        estilo: estilo,
        foco: foco,
        autoFoco: autoFoco,
        titulo: titulo,
        estiloTitulo: estiloTitulo,
      );
}
