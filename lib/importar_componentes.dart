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
import 'package:noronhaecotech/importes/componentes/dialogo/dialogo_mensagem.dart';
import 'package:noronhaecotech/importes/componentes/dialogo/dialogo_padrao.dart';
import 'package:noronhaecotech/importes/componentes/gaveta/gaveta_inferior.dart';
import 'package:noronhaecotech/importes/componentes/icone/icone_padrao.dart';
import 'package:noronhaecotech/importes/componentes/imagem/imagem_arredondada.dart';
import 'package:noronhaecotech/importes/componentes/imagem/imagem_circular.dart';
import 'package:noronhaecotech/importes/componentes/imagem/imagem_padrao.dart';
import 'package:noronhaecotech/importes/componentes/pagina/pagina_deslizante.dart';
import 'package:noronhaecotech/importes/componentes/pagina/pagina_padrao.dart';
import 'package:noronhaecotech/importes/componentes/pagina/pagina_rolagem.dart';
import 'package:noronhaecotech/importes/componentes/selecao/selecao_campo.dart';
import 'package:noronhaecotech/importes/componentes/selecao/selecao_lista.dart';
import 'package:noronhaecotech/importes/componentes/texto/texto_campo_celular.dart';
import 'package:noronhaecotech/importes/componentes/texto/texto_campo_email.dart';
import 'package:noronhaecotech/importes/componentes/texto/texto_campo_nome.dart';
import 'package:noronhaecotech/importes/componentes/texto/texto_campo_padrao.dart';
import 'package:noronhaecotech/importes/componentes/texto/texto_campo_senha.dart';
import 'package:noronhaecotech/importes/componentes/texto/texto_padrao.dart';
import 'package:noronhaecotech/importes/modelos/modelos_objeto_selecao.dart';
////////////////////////////////////////////////////////////////////////////////
export 'package:noronhaecotech/importar_modelos.dart';
export 'package:noronhaecotech/importes/componentes/texto/texto_campo_celular.dart';

// ----------------------------------------------------------------------------- Componentes
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
  static $ComDialogo get dialogo => const $ComDialogo();
  static $ComGaveta get gaveta => const $ComGaveta();
}

// ----------------------------------------------------------------------------- Componentes Pagina
class $ComPagina {
  const $ComPagina();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Pagina Padrão
  Widget padrao({
    Key? chave,
    bool? paginaIndisponivel,
    bool? botaoPaginaIndisponivel,
    WillPopCallback? aoVoltar,
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
        chave: chave,
        paginaIndisponivel: paginaIndisponivel,
        botaoPaginaIndisponivel: botaoPaginaIndisponivel,
        aoVoltar: aoVoltar,
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

  // =========================================================================== Pagina Rolagem
  Widget rolagem({
    Key? chave,
    Axis? direcao,
    bool? reverso,
    ScrollController? controlador,
    ScrollPhysics? fisica,
    Widget? conteudo,
  }) =>
      $ComPaginaRolagem(
        chave: chave,
        direcao: direcao,
        reverso: reverso,
        controlador: controlador,
        fisica: fisica,
        conteudo: conteudo,
      );

  // =========================================================================== Pagina Rolagem
  Widget deslizante({
    Key? chave,
    Axis? direcao,
    bool? reverso,
    PageController? controlador,
    ScrollPhysics? fisica,
    void Function(int)? aoMudar,
    required List<Widget> conteudo,
  }) =>
      $ComPaginaDeslizante(
        chave: chave,
        direcao: direcao,
        reverso: reverso,
        controlador: controlador,
        fisica: fisica,
        aoMudar: aoMudar,
        conteudo: conteudo,
      );
}

// ----------------------------------------------------------------------------- Componentes Texto
class $ComTexto {
  const $ComTexto();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Texto Padrão
  Widget padrao({
    Key? chave,
    required String texto,
    TextStyle? estilo,
    StrutStyle? estiloEscorar,
    TextAlign? alinhamento,
    TextDirection? direcao,
    Locale? localidade,
    bool? envolverFlexivel,
    TextOverflow? aoEstourar,
    double? fatorEscala,
    int? maxLinhas,
    String? textoSemantico,
    TextWidthBasis? baseLargura,
    TextHeightBehavior? comportamentoAltura,
    Color? corSelecao,
  }) =>
      $ComTextoPadrao(
        chave: chave,
        texto: texto,
        estilo: estilo,
        estiloEscorar: estiloEscorar,
        alinhamento: alinhamento,
        direcao: direcao,
        localidade: localidade,
        envolverFlexivel: envolverFlexivel,
        aoEstourar: aoEstourar,
        fatorEscala: fatorEscala,
        maxLinhas: maxLinhas,
        textoSemantico: textoSemantico,
        baseLargura: baseLargura,
        comportamentoAltura: comportamentoAltura,
        corSelecao: corSelecao,
      );

  // =========================================================================== Texto Campo Padrão
  Widget campoPadrao({
    Key? chave,
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
    EditableTextContextMenuBuilder? menuTexto,
  }) =>
      $ComTextoCampoPadrao(
        chave: chave,
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
        menuTexto: menuTexto,
      );

  // =========================================================================== Texto Campo Celular
  Widget campoCelular({
    Key? chave,
    bool? habilitado,
    bool? bloqueado,
    bool? botaoLimpar,
    required ControladorCelular controlador,
    FocusNode? foco,
    bool? autoFoco,
    TextInputAction? acaoBotaoTeclado,
    String? textoTitulo,
    String? textoAjuda,
    String? textoErro,
    String? textoDica,
    IconData? iconePrefixo,
    EditableTextContextMenuBuilder? menuTexto,
  }) =>
      $ComTextoCampoCelular(
        chave: chave,
        habilitado: habilitado,
        bloqueado: bloqueado,
        botaoLimpar: botaoLimpar,
        controlador: controlador,
        foco: foco,
        autoFoco: autoFoco,
        acaoBotaoTeclado: acaoBotaoTeclado,
        textoTitulo: textoTitulo,
        textoAjuda: textoAjuda,
        textoErro: textoErro,
        textoDica: textoDica,
        iconePrefixo: iconePrefixo,
        menuTexto: menuTexto,
      );

  // =========================================================================== Texto Campo Senha
  Widget campoSenha({
    Key? chave,
    bool? habilitado,
    bool? bloqueado,
    bool? botaoLimpar,
    bool? tituloConfirmacao,
    TextEditingController? controlador,
    FocusNode? foco,
    bool? autoFoco,
    TextInputType? tipoTeclado,
    TextInputAction? acaoBotaoTeclado,
    String? textoTitulo,
    String? textoAjuda,
    String? textoErro,
    String? textoDica,
    String? textoPrefixo,
    String? textoSufixo,
    IconData? iconePrefixo,
    EditableTextContextMenuBuilder? menuTexto,
  }) =>
      $ComTextoCampoSenha(
        chave: chave,
        habilitado: habilitado,
        bloqueado: bloqueado,
        botaoLimpar: botaoLimpar,
        tituloConfirmacao: tituloConfirmacao,
        controlador: controlador,
        foco: foco,
        autoFoco: autoFoco,
        tipoTeclado: tipoTeclado,
        acaoBotaoTeclado: acaoBotaoTeclado,
        textoTitulo: textoTitulo,
        textoAjuda: textoAjuda,
        textoErro: textoErro,
        textoDica: textoDica,
        textoPrefixo: textoPrefixo,
        textoSufixo: textoSufixo,
        iconePrefixo: iconePrefixo,
        menuTexto: menuTexto,
      );

  // =========================================================================== Texto Campo Nome
  Widget campoNome({
    Key? chave,
    bool? habilitado,
    bool? bloqueado,
    bool? botaoLimpar,
    TextEditingController? controlador,
    FocusNode? foco,
    bool? autoFoco,
    TextInputType? tipoTeclado,
    TextInputAction? acaoBotaoTeclado,
    List<TextInputFormatter>? formatacao,
    String? textoTitulo,
    String? textoAjuda,
    String? textoErro,
    String? textoDica,
    String? textoPrefixo,
    String? textoSufixo,
    Widget? componenteExterno,
    IconData? iconePrefixo,
    Widget? componenteSufixo,
    EditableTextContextMenuBuilder? menuTexto,
  }) =>
      $ComTextoCampoNome(
        chave: chave,
        habilitado: habilitado,
        bloqueado: bloqueado,
        botaoLimpar: botaoLimpar,
        controlador: controlador,
        foco: foco,
        autoFoco: autoFoco,
        tipoTeclado: tipoTeclado,
        acaoBotaoTeclado: acaoBotaoTeclado,
        formatacao: formatacao,
        textoTitulo: textoTitulo,
        textoAjuda: textoAjuda,
        textoErro: textoErro,
        textoDica: textoDica,
        textoPrefixo: textoPrefixo,
        textoSufixo: textoSufixo,
        componenteExterno: componenteExterno,
        iconePrefixo: iconePrefixo,
        componenteSufixo: componenteSufixo,
        menuTexto: menuTexto,
      );

  // =========================================================================== Texto Campo Nome
  Widget campoEmail({
    Key? chave,
    bool? habilitado,
    bool? bloqueado,
    bool? botaoLimpar,
    TextEditingController? controlador,
    FocusNode? foco,
    bool? autoFoco,
    TextInputType? tipoTeclado,
    TextInputAction? acaoBotaoTeclado,
    List<TextInputFormatter>? formatacao,
    String? textoTitulo,
    String? textoAjuda,
    String? textoErro,
    String? textoDica,
    String? textoPrefixo,
    String? textoSufixo,
    Widget? componenteExterno,
    IconData? iconePrefixo,
    Widget? componenteSufixo,
    EditableTextContextMenuBuilder? menuTexto,
  }) =>
      $ComTextoCampoEmail(
        chave: chave,
        habilitado: habilitado,
        bloqueado: bloqueado,
        botaoLimpar: botaoLimpar,
        controlador: controlador,
        foco: foco,
        autoFoco: autoFoco,
        tipoTeclado: tipoTeclado,
        acaoBotaoTeclado: acaoBotaoTeclado,
        formatacao: formatacao,
        textoTitulo: textoTitulo,
        textoAjuda: textoAjuda,
        textoErro: textoErro,
        textoDica: textoDica,
        textoPrefixo: textoPrefixo,
        textoSufixo: textoSufixo,
        componenteExterno: componenteExterno,
        iconePrefixo: iconePrefixo,
        componenteSufixo: componenteSufixo,
        menuTexto: menuTexto,
      );
}

// ----------------------------------------------------------------------------- Componentes Carregamento
class $ComCarregamento {
  const $ComCarregamento();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Carregamento Circular
  Widget circular({
    Key? chave,
    double? valor,
    Color? corBarra,
    double? espessura,
  }) =>
      $ComCarregamentoCircular(
        chave: chave,
        valor: valor,
        corBarra: corBarra,
        espessura: espessura,
      );
}

// ----------------------------------------------------------------------------- Componentes Imagem
class $ComImagem {
  const $ComImagem();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Imagem Padrão
  Widget padrao({
    Key? chave,
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
        chave: chave,
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

  // =========================================================================== Imagem Arredondada
  Widget arredondada({
    Key? chave,
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
        chave: chave,
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

  // =========================================================================== Imagem Circular
  Widget circular({
    Key? chave,
    required String imagem,
    double? diametro,
    BoxFit? ajuste,
    AlignmentGeometry? alinhamento,
    ImageRepeat? repetirImagem,
    Color? corImagem,
    int? cacheDiametro,
    ImageLoadingBuilder? carregamento,
    void Function()? aoTocar,
    BorderRadius? arredondarBorda,
  }) =>
      $ComImagemCircular(
        chave: chave,
        imagem: imagem,
        diametro: diametro,
        ajuste: ajuste,
        alinhamento: alinhamento,
        repetirImagem: repetirImagem,
        corImagem: corImagem,
        cacheDiametro: cacheDiametro,
        carregamento: carregamento,
        aoTocar: aoTocar,
        arredondarBorda: arredondarBorda,
      );
}

// ----------------------------------------------------------------------------- Componentes Botão
class $ComBotao {
  const $ComBotao();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Botão Elevado
  Widget elevado({
    Key? chave,
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
        chave: chave,
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

  // =========================================================================== Botão Elevado Icone
  Widget elevadoIcone({
    Key? chave,
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
        chave: chave,
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

  // =========================================================================== Botão Borda
  Widget borda({
    Key? chave,
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
        chave: chave,
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

  // =========================================================================== Botão Borda Icone
  Widget bordaIcone({
    Key? chave,
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
        chave: chave,
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

  // =========================================================================== Botão Texto
  Widget texto({
    Key? chave,
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
        chave: chave,
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

  // =========================================================================== Botão Texto Icone
  Widget textoIcone({
    Key? chave,
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
        chave: chave,
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

  // =========================================================================== Botão Icone
  Widget icone({
    Key? chave,
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
        chave: chave,
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

// ----------------------------------------------------------------------------- Componentes Icone
class $ComIcone {
  const $ComIcone();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Icone Padrão
  Widget padrao({
    Key? chave,
    bool? alternarIcone,
    required IconData iconePrimario,
    IconData? iconeSecundario,
    double? tamanho,
    Color? corIcone,
  }) =>
      $ComIconePadrao(
        chave: chave,
        alternarIcone: alternarIcone,
        iconePrimario: iconePrimario,
        iconeSecundario: iconeSecundario,
        tamanho: tamanho,
        corIcone: corIcone,
      );
}

// ----------------------------------------------------------------------------- Componentes Seleção
class $ComSelecao {
  const $ComSelecao();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Seleção Campo
  Widget campo({
    Key? chave,
    bool? habilitado,
    FocusNode? foco,
    bool? autoFoco,
    AutovalidateMode? modoValidacao,
    required void Function(String?) aoMudar,
    void Function()? aoTocar,
    void Function(String?)? aoSalvar,
    String? Function(String?)? validacao,
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
    required List<String> listaItens,
    dynamic valor,
  }) =>
      $ComSelecaoCampo(
        chave: chave,
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

  // =========================================================================== Seleção Lista
  Widget lista({
    Key? chave,
    required List<ObjetoSelecao> listaItens,
    void Function(int, ObjetoSelecao)? aoTocar,
  }) =>
      $ComSelecaoLista(
        chave: chave,
        listaItens: listaItens,
        aoTocar: aoTocar,
      );
}

// ----------------------------------------------------------------------------- Componentes Dialogo
class $ComDialogo {
  const $ComDialogo();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Dialogo Mensagem
  Widget padrao({
    Key? chave,
    VoidCallback? estadoInicial,
    void Function(StateSetter)? estadoMontado,
    void Function(StateSetter)? estadoDesmontado,
    VoidCallback? estadoDescarte,
    required String titulo,
    required StatefulWidgetBuilder conteudo,
  }) =>
      $ComDialogoPadrao(
        chave: chave,
        estadoInicial: estadoInicial,
        estadoMontado: estadoMontado,
        estadoDesmontado: estadoDesmontado,
        estadoDescarte: estadoDescarte,
        titulo: titulo,
        conteudo: conteudo,
      );

  // =========================================================================== Dialogo Mensagem
  Widget mensagem({
    Key? chave,
    required String titulo,
    required String texto,
    String? tituloBotaoPrimario,
    String? tituloBotaoSecundario,
    String? tituloBotaoNeutro,
    required VoidCallback acaoBotaoPrimario,
    VoidCallback? acaoBotaoSecundario,
    VoidCallback? acaoBotaoNeutro,
  }) =>
      $ComDialogoMensagem(
        chave: chave,
        titulo: titulo,
        texto: texto,
        tituloBotaoPrimario: tituloBotaoPrimario,
        tituloBotaoSecundario: tituloBotaoSecundario,
        tituloBotaoNeutro: tituloBotaoNeutro,
        acaoBotaoPrimario: acaoBotaoPrimario,
        acaoBotaoSecundario: acaoBotaoSecundario,
        acaoBotaoNeutro: acaoBotaoNeutro,
      );
}

// ----------------------------------------------------------------------------- Componentes Gaveta
class $ComGaveta {
  const $ComGaveta();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Gaveta Inferior
  Widget inferior({
    Key? chave,
    VoidCallback? estadoInicial,
    void Function(StateSetter)? estadoMontado,
    void Function(StateSetter)? estadoDesmontado,
    VoidCallback? estadoDescarte,
    void Function(bool)? estadoGaveta,
    required StatefulWidgetBuilder conteudo,
  }) =>
      $ComGavetaInferior(
        chave: chave,
        estadoInicial: estadoInicial,
        estadoMontado: estadoMontado,
        estadoDesmontado: estadoDesmontado,
        estadoDescarte: estadoDescarte,
        estadoGaveta: estadoGaveta,
        conteudo: conteudo,
      );
}
