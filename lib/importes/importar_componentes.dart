import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noronhaecotech/importes/componentes/botao/botao_borda.dart';
import 'package:noronhaecotech/importes/componentes/botao/botao_borda_icone.dart';
import 'package:noronhaecotech/importes/componentes/botao/botao_elevado.dart';
import 'package:noronhaecotech/importes/componentes/botao/botao_elevado_icone.dart';
import 'package:noronhaecotech/importes/componentes/botao/botao_icone.dart';
import 'package:noronhaecotech/importes/componentes/botao/botao_texto.dart';
import 'package:noronhaecotech/importes/componentes/botao/botao_texto_icone.dart';
import 'package:noronhaecotech/importes/componentes/carregamento/carregamento_circular.dart';
import 'package:noronhaecotech/importes/componentes/icone/icone_padrao.dart';
import 'package:noronhaecotech/importes/componentes/imagem/imagem_arredondada.dart';
import 'package:noronhaecotech/importes/componentes/imagem/imagem_padrao.dart';
import 'package:noronhaecotech/importes/componentes/pagina/pagina_construtora.dart';
import 'package:noronhaecotech/importes/componentes/pagina/pagina_padrao.dart';
import 'package:noronhaecotech/importes/componentes/selecao/selecao_campo.dart';
import 'package:noronhaecotech/importes/componentes/texto/texto_campo_celular.dart';
import 'package:noronhaecotech/importes/componentes/texto/texto_campo_padrao.dart';
import 'package:noronhaecotech/importes/componentes/texto/texto_padrao.dart';
export 'package:noronhaecotech/importes/componentes/texto/texto_campo_celular.dart';
export 'package:noronhaecotech/importes/modelos/modelos_ddi.dart';
export 'package:noronhaecotech/idiomas/arquivos_gerados/l10n.dart';

class Componentes {
  const Componentes();
  //////////////////////////////////////////////////////////////////////////////
  static $ComPagina get pagina => const $ComPagina();
  static $ComTexto get texto => const $ComTexto();
  static $ComImagem get imagem => const $ComImagem();
  static $ComCarregamento get carregamento => const $ComCarregamento();
  static $ComBotao get botao => const $ComBotao();
  static $ComIcone get icone => const $ComIcone();
  static $ComSelecao get selecao => const $ComSelecao();
}

// ----------------------------------------------------------------------------- Pagina
class $ComPagina {
  const $ComPagina();
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
      $ComPaginaPadrao(
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

  // --------------------------------------------------------------------------- Pagina Construtora
  Widget construtora({
    void Function(StateSetter)? estadoInicial,
    void Function(StateSetter)? estadoMontado,
    void Function(StateSetter)? estadoDesmontado,
    void Function(StateSetter)? estadoDescarte,
    required StatefulWidgetBuilder construtor,
  }) =>
      $ComPaginaConstrutora(
        construtor: construtor,
        estadoInicial: estadoInicial,
        estadoMontado: estadoMontado,
        estadoDesmontado: estadoDesmontado,
        estadoDescarte: estadoDescarte,
      );
}

// ----------------------------------------------------------------------------- Texto
class $ComTexto {
  const $ComTexto();
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
      $ComTextoPadrao(
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

  // --------------------------------------------------------------------------- Texto Campo Padrão
  Widget campoPadrao({
    bool? habilitado,
    bool? bloqueado,
    bool? ocultarTexto,
    bool? botaoLimpar,
    TextEditingController? controlador,
    FocusNode? foco,
    bool? autoFoco,
    TextInputType? tipoTeclado,
    TextCapitalization? capitalizacao,
    TextInputAction? acaoBotaoTeclado,
    int? linhasMax,
    int? linhasMin,
    List<TextInputFormatter>? formatacao,
    InputDecoration? estilo,
    TextStyle? estiloTexto,
    String? textoTitulo,
    String? textoAjuda,
    String? textoErro,
    String? textoDica,
    String? textoPrefixo,
    String? textoSufixo,
    Widget? componenteExterno,
    Widget? componentePrefixo,
    Widget? componenteSufixo,
    void Function(String)? aoMudar,
    void Function()? aoPrecionar,
  }) =>
      $ComTextoCampoPadrao(
        habilitado: habilitado,
        bloqueado: bloqueado,
        ocultarTexto: ocultarTexto,
        botaoLimpar: botaoLimpar,
        controlador: controlador,
        foco: foco,
        autoFoco: autoFoco,
        tipoTeclado: tipoTeclado,
        capitalizacao: capitalizacao,
        acaoBotaoTeclado: acaoBotaoTeclado,
        linhasMax: linhasMax,
        linhasMin: linhasMin,
        formatacao: formatacao,
        estilo: estilo,
        estiloTexto: estiloTexto,
        textoTitulo: textoTitulo,
        textoAjuda: textoAjuda,
        textoErro: textoErro,
        textoDica: textoDica,
        textoPrefixo: textoPrefixo,
        textoSufixo: textoSufixo,
        componenteExterno: componenteExterno,
        componentePrefixo: componentePrefixo,
        componenteSufixo: componenteSufixo,
        aoMudar: aoMudar,
        aoPrecionar: aoPrecionar,
      );

  // --------------------------------------------------------------------------- Texto Campo Celular
  Widget campoCelular({
    bool? habilitado,
    bool? bloqueado,
    bool? botaoLimpar,
    required ControladorCelular controlador,
    FocusNode? foco,
    TextInputAction? acaoBotaoTeclado,
    String? textoTitulo,
    String? textoAjuda,
    String? textoErro,
    String? textoDica,
    IconData? iconePrefixo,
  }) =>
      $ComTextoCampoCelular(
        habilitado: habilitado,
        bloqueado: bloqueado,
        botaoLimpar: botaoLimpar,
        controlador: controlador,
        foco: foco,
        acaoBotaoTeclado: acaoBotaoTeclado,
        textoTitulo: textoTitulo,
        textoAjuda: textoAjuda,
        textoErro: textoErro,
        textoDica: textoDica,
        iconePrefixo: iconePrefixo,
      );
}

// ----------------------------------------------------------------------------- Carregamento
class $ComCarregamento {
  const $ComCarregamento();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Carregamento Circular
  Widget circular({
    double? valor,
    Color? corBarra,
    double? espessura,
  }) =>
      $ComCarregamentoCircular(
        valor: valor,
        corBarra: corBarra,
        espessura: espessura,
      );
}

// ----------------------------------------------------------------------------- Imagem
class $ComImagem {
  const $ComImagem();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Imagem Padrão
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
    ImageLoadingBuilder? carregamento,
    void Function()? aoTocar,
  }) =>
      $ComImagemPadrao(
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
        aoTocar: aoTocar,
      );

  // --------------------------------------------------------------------------- Imagem Arredondada
  Widget arredondada({
    required String imagem,
    double? largura,
    double? altura,
    BoxFit? ajuste,
    AlignmentGeometry? alinhamento,
    ImageRepeat? repetirImagem,
    Color? corImagem,
    int? cacheLargura,
    int? cacheAltura,
    ImageLoadingBuilder? carregamento,
    void Function()? aoTocar,
    BorderRadius? arredondarBorda,
  }) =>
      $ComImagemArredondada(
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
        aoTocar: aoTocar,
        arredondarBorda: arredondarBorda,
      );
}

// ----------------------------------------------------------------------------- Botão
class $ComBotao {
  const $ComBotao();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Botão Elevado
  Widget elevado({
    bool? habilitado,
    required void Function()? aoPrecionar,
    void Function()? aoSegurar,
    void Function(bool)? aoPassar,
    void Function(bool)? aoMudarFoco,
    ButtonStyle? estilo,
    FocusNode? foco,
    bool? autoFoco,
    MaterialStatesController? controladorEstado,
    required String titulo,
    TextStyle? estiloTitulo,
  }) =>
      $ComBotaoElevado(
        habilitado: habilitado,
        aoPrecionar: aoPrecionar,
        aoSegurar: aoSegurar,
        aoPassar: aoPassar,
        aoMudarFoco: aoMudarFoco,
        estilo: estilo,
        foco: foco,
        autoFoco: autoFoco,
        controladorEstado: controladorEstado,
        titulo: titulo,
        estiloTitulo: estiloTitulo,
      );

  // --------------------------------------------------------------------------- Botão Elevado Icone
  Widget elevadoIcone({
    bool? habilitado,
    required void Function()? aoPrecionar,
    void Function()? aoSegurar,
    void Function(bool)? aoPassar,
    void Function(bool)? aoMudarFoco,
    ButtonStyle? estilo,
    FocusNode? foco,
    bool? autoFoco,
    MaterialStatesController? controladorEstado,
    required IconData icone,
    double? tamanhoIcone,
    required String titulo,
    TextStyle? estiloTitulo,
  }) =>
      $ComBotaoElevadoIcone(
        habilitado: habilitado,
        aoPrecionar: aoPrecionar,
        aoSegurar: aoSegurar,
        aoPassar: aoPassar,
        aoMudarFoco: aoMudarFoco,
        estilo: estilo,
        foco: foco,
        autoFoco: autoFoco,
        controladorEstado: controladorEstado,
        icone: icone,
        tamanhoIcone: tamanhoIcone,
        titulo: titulo,
        estiloTitulo: estiloTitulo,
      );

  // --------------------------------------------------------------------------- Botão Borda
  Widget borda({
    bool? habilitado,
    required void Function()? aoPrecionar,
    void Function()? aoSegurar,
    void Function(bool)? aoPassar,
    void Function(bool)? aoMudarFoco,
    ButtonStyle? estilo,
    FocusNode? foco,
    bool? autoFoco,
    MaterialStatesController? controladorEstado,
    required String titulo,
    TextStyle? estiloTitulo,
  }) =>
      $ComBotaoBorda(
        habilitado: habilitado,
        aoPrecionar: aoPrecionar,
        aoSegurar: aoSegurar,
        aoPassar: aoPassar,
        aoMudarFoco: aoMudarFoco,
        estilo: estilo,
        foco: foco,
        autoFoco: autoFoco,
        controladorEstado: controladorEstado,
        titulo: titulo,
        estiloTitulo: estiloTitulo,
      );

  // --------------------------------------------------------------------------- Botão Borda Icone
  Widget bordaIcone({
    bool? habilitado,
    required void Function()? aoPrecionar,
    void Function()? aoSegurar,
    ButtonStyle? estilo,
    FocusNode? foco,
    bool? autoFoco,
    MaterialStatesController? controladorEstado,
    required IconData icone,
    double? tamanhoIcone,
    required String titulo,
    TextStyle? estiloTitulo,
  }) =>
      $ComBotaoBordaIcone(
        habilitado: habilitado,
        aoPrecionar: aoPrecionar,
        aoSegurar: aoSegurar,
        estilo: estilo,
        foco: foco,
        autoFoco: autoFoco,
        controladorEstado: controladorEstado,
        icone: icone,
        tamanhoIcone: tamanhoIcone,
        titulo: titulo,
        estiloTitulo: estiloTitulo,
      );

  // --------------------------------------------------------------------------- Botão Texto
  Widget texto({
    bool? habilitado,
    required void Function()? aoPrecionar,
    void Function()? aoSegurar,
    void Function(bool)? aoPassar,
    void Function(bool)? aoMudarFoco,
    ButtonStyle? estilo,
    FocusNode? foco,
    bool? autoFoco,
    MaterialStatesController? controladorEstado,
    required String titulo,
    TextStyle? estiloTitulo,
  }) =>
      $ComBotaoTexto(
        habilitado: habilitado,
        aoPrecionar: aoPrecionar,
        aoSegurar: aoSegurar,
        aoPassar: aoPassar,
        aoMudarFoco: aoMudarFoco,
        estilo: estilo,
        foco: foco,
        autoFoco: autoFoco,
        controladorEstado: controladorEstado,
        titulo: titulo,
        estiloTitulo: estiloTitulo,
      );

  // --------------------------------------------------------------------------- Botão Texto Icone
  Widget textoIcone({
    bool? habilitado,
    required void Function()? aoPrecionar,
    void Function()? aoSegurar,
    void Function(bool)? aoPassar,
    void Function(bool)? aoMudarFoco,
    ButtonStyle? estilo,
    FocusNode? foco,
    bool? autoFoco,
    MaterialStatesController? controladorEstado,
    required IconData icone,
    double? tamanhoIcone,
    required String titulo,
    TextStyle? estiloTitulo,
  }) =>
      $ComBotaoTextoIcone(
        habilitado: habilitado,
        aoPrecionar: aoPrecionar,
        aoSegurar: aoSegurar,
        aoPassar: aoPassar,
        aoMudarFoco: aoMudarFoco,
        estilo: estilo,
        foco: foco,
        autoFoco: autoFoco,
        controladorEstado: controladorEstado,
        icone: icone,
        tamanhoIcone: tamanhoIcone,
        titulo: titulo,
        estiloTitulo: estiloTitulo,
      );

  // --------------------------------------------------------------------------- Botão Icone
  Widget icone({
    bool? habilitado,
    required void Function()? aoPrecionar,
    ButtonStyle? estilo,
    double? tamanho,
    EdgeInsetsGeometry? espacoInterno,
    AlignmentGeometry? alinhamento,
    bool? corDinamica,
    Color? corIcone,
    Color? corFoco,
    Color? corAcima,
    Color? corDestaque,
    Color? corRespingo,
    Color? corDesabilitado,
    FocusNode? foco,
    bool? autoFoco,
    bool? alternarIcone,
    required IconData iconePrimario,
    IconData? iconeSecundario,
  }) =>
      $ComBotaoIcone(
        habilitado: habilitado,
        aoPrecionar: aoPrecionar,
        estilo: estilo,
        tamanho: tamanho,
        espacoInterno: espacoInterno,
        alinhamento: alinhamento,
        corDinamica: corDinamica,
        corIcone: corIcone,
        corFoco: corFoco,
        corAcima: corAcima,
        corDestaque: corDestaque,
        corRespingo: corRespingo,
        corDesabilitado: corDesabilitado,
        foco: foco,
        autoFoco: autoFoco,
        alternarIcone: alternarIcone,
        iconePrimario: iconePrimario,
        iconeSecundario: iconeSecundario,
      );
}

// ----------------------------------------------------------------------------- Icone
class $ComIcone {
  const $ComIcone();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Icone Padrão
  Widget padrao({
    bool? alternarIcone,
    required IconData iconePrimario,
    IconData? iconeSecundario,
    double? tamanho,
    Color? corIcone,
  }) =>
      $ComIconePadrao(
        alternarIcone: alternarIcone,
        iconePrimario: iconePrimario,
        iconeSecundario: iconeSecundario,
        tamanho: tamanho,
        corIcone: corIcone,
      );
}

// ----------------------------------------------------------------------------- Seleção
class $ComSelecao {
  const $ComSelecao();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Seleção Campo
  Widget campo({
    bool? habilitado,
    FocusNode? foco,
    bool? autoFoco,
    AutovalidateMode? modoValidacao,
    required void Function(dynamic) aoMudar,
    void Function()? aoTocar,
    void Function(dynamic)? aoSalvar,
    String? Function(dynamic)? validacao,
    InputDecoration? estilo,
    TextStyle? estiloTexto,
    String? textoTitulo,
    String? textoAjuda,
    String? textoErro,
    String? textoDica,
    String? textoPrefixo,
    String? textoSufixo,
    Widget? componenteExterno,
    Widget? componentePrefixo,
    Widget? componenteSufixo,
    AlignmentGeometry? alinhamento,
    double? alturaMaxMenu,
    List<Widget> Function(BuildContext)? editarLista,
    required List<DropdownMenuItem<dynamic>> listaItens,
    dynamic valor,
  }) =>
      $ComSelecaoCampo(
        habilitado: habilitado,
        foco: foco,
        autoFoco: autoFoco,
        modoValidacao: modoValidacao,
        aoMudar: aoMudar,
        aoTocar: aoTocar,
        aoSalvar: aoSalvar,
        validacao: validacao,
        estilo: estilo,
        estiloTexto: estiloTexto,
        textoTitulo: textoTitulo,
        textoAjuda: textoAjuda,
        textoErro: textoErro,
        textoDica: textoDica,
        textoPrefixo: textoPrefixo,
        textoSufixo: textoSufixo,
        componenteExterno: componenteExterno,
        componentePrefixo: componentePrefixo,
        componenteSufixo: componenteSufixo,
        alinhamento: alinhamento,
        alturaMaxMenu: alturaMaxMenu,
        editarLista: editarLista,
        listaItens: listaItens,
        valor: valor,
      );
}
