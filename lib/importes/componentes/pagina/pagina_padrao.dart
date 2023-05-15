import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';

class $ComPaginaPadrao extends StatefulWidget {
  final bool? paginaIndisponivel;
  final WillPopCallback? aoVoltar;
  final PreferredSizeWidget? barraSuperior;
  final List<Widget> conteudo;
  final Widget? barraInferior;
  final Widget? botaoFlutuante;
  final FloatingActionButtonAnimator? animacaoBotaoFlutuante;
  final FloatingActionButtonLocation? localidadeBotaoFlutuante;
  final Widget? menuGavetaEsquerda;
  final void Function(bool)? aoMudarMenuGavetaEsquerda;
  final Widget? menuGavetaDireita;
  final void Function(bool)? aoMudarMenuGavetaDireita;
  final Widget? gavetaInferior;

  const $ComPaginaPadrao({
    Key? key,
    required this.paginaIndisponivel,
    required this.aoVoltar,
    required this.barraSuperior,
    required this.conteudo,
    required this.barraInferior,
    required this.botaoFlutuante,
    required this.animacaoBotaoFlutuante,
    required this.localidadeBotaoFlutuante,
    required this.menuGavetaEsquerda,
    required this.aoMudarMenuGavetaEsquerda,
    required this.menuGavetaDireita,
    required this.aoMudarMenuGavetaDireita,
    required this.gavetaInferior,
  }) : super(key: key);

  @override
  State<$ComPaginaPadrao> createState() => _$ComPaginaPadraoState();
}

class _$ComPaginaPadraoState extends State<$ComPaginaPadrao> {
  @override
  Widget build(BuildContext context) {
    ////////////////////////////////////////////////////////////////////////////
    final largura = MediaQuery.of(context).size.width;
    final indice = widget.conteudo.length - 1;
    int escalaTela = (largura - 240) ~/ 240;
    if (escalaTela > indice) escalaTela = indice;
    ////////////////////////////////////////////////////////////////////////////
    try {
      if (widget.paginaIndisponivel == true) throw "Indisponivel";
      return WillPopScope(
        onWillPop: widget.aoVoltar,
        child: Scaffold(
          appBar: widget.barraSuperior,
          body: widget.conteudo.elementAt(escalaTela),
          bottomNavigationBar: widget.barraInferior,
          floatingActionButton: widget.botaoFlutuante,
          floatingActionButtonAnimator: widget.animacaoBotaoFlutuante,
          floatingActionButtonLocation: widget.localidadeBotaoFlutuante,
          drawer: widget.menuGavetaEsquerda,
          onDrawerChanged: widget.aoMudarMenuGavetaEsquerda,
          endDrawer: widget.menuGavetaDireita,
          onEndDrawerChanged: widget.aoMudarMenuGavetaDireita,
          bottomSheet: widget.gavetaInferior,
        ),
      );
    } catch (erro) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ------------------------------------------------------------- Icone Golfinho
                  Componentes.imagem.padrao(
                    imagem: "Indisponivel",
                    largura: 200,
                  ),
                  // ------------------------------------------------------------- Título Indisponível
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 40),
                    child: Componentes.texto.padrao(
                      texto: Idiomas.of(context).paginaTituloIndisponivel,
                      estilo: Estilos.texto.titulo(context: context),
                    ),
                  ),
                  // ------------------------------------------------------------- Botão Voltar
                  Componentes.botao.elevadoIcone(
                    aoPrecionar: () => Sistemas.navegador.voltar(context),
                    icone: Icons.arrow_back,
                    titulo: Idiomas.of(context).tituloBotaoVoltar,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
