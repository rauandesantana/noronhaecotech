import 'package:flutter/material.dart';
import 'package:noronhaecotech/componentes/pagina/pagina_padrao.dart';
import 'package:noronhaecotech/componentes/texto/texto_padrao.dart';

class Componentes {
  const Componentes();
  //////////////////////////////////////////////////////////////////////////////
  static $ComponentesPagina get pagina => const $ComponentesPagina();
  static $ComponentesTexto get texto => const $ComponentesTexto();
}

// ----------------------------------------------------------------------------- Pagina
class $ComponentesPagina {
  const $ComponentesPagina();
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
      $ComponentesPaginaPadrao(
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
class $ComponentesTexto {
  const $ComponentesTexto();
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
      $ComponentesTextoPadrao(
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
