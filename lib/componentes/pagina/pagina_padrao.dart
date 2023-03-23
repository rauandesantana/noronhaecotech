import 'package:flutter/material.dart';
import 'package:noronhaecotech/idiomas/arquivos_gerados/l10n.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

class $CompPaginaPadrao extends StatefulWidget {
  final bool? paginaIndisponivel;
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

  const $CompPaginaPadrao({
    Key? key,
    required this.paginaIndisponivel,
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
  State<$CompPaginaPadrao> createState() => _$CompPaginaPadraoState();
}

class _$CompPaginaPadraoState extends State<$CompPaginaPadrao> {
  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    int escalaTela = largura ~/ 240;
    (escalaTela > (widget.conteudo.length - 1))
        ? escalaTela = (widget.conteudo.length - 1)
        : null;
    try {
      (widget.paginaIndisponivel == true) ? throw "Indisponivel" : null;
      return Scaffold(
        appBar: widget.barraSuperior,
        body: SingleChildScrollView(
          child: widget.conteudo.elementAt(escalaTela),
        ),
        bottomNavigationBar: widget.barraInferior,
        floatingActionButton: widget.botaoFlutuante,
        floatingActionButtonAnimator: widget.animacaoBotaoFlutuante,
        floatingActionButtonLocation: widget.localidadeBotaoFlutuante,
        drawer: widget.menuGavetaEsquerda,
        onDrawerChanged: widget.aoMudarMenuGavetaEsquerda,
        endDrawer: widget.menuGavetaDireita,
        onEndDrawerChanged: widget.aoMudarMenuGavetaDireita,
        bottomSheet: widget.gavetaInferior,
      );
    } catch (erro) {
      return Scaffold(
        body: Center(
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
                  aoPrecionar: () => {},
                  icone: Icons.arrow_back,
                  titulo: "Voltar",
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
