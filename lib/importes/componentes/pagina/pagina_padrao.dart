import 'package:flutter/material.dart';
import 'package:noronhaecotech/importar_componentes.dart';
import 'package:noronhaecotech/importar_estilos.dart';
import 'package:noronhaecotech/importar_sistemas.dart';

// ----------------------------------------------------------------------------- Componentes Pagina Padrão
class $ComPaginaPadrao extends StatelessWidget {
  final bool? paginaIndisponivel;
  final bool? botaoPaginaIndisponivel;
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
    required Key? chave,
    required this.paginaIndisponivel,
    required this.botaoPaginaIndisponivel,
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
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    ////////////////////////////////////////////////////////////////////////////
    final largura = MediaQuery.of(context).size.width;
    final indice = conteudo.length - 1;
    int escalaTela = (largura - 240) ~/ 240;
    if (escalaTela > indice) escalaTela = indice;
    ////////////////////////////////////////////////////////////////////////////
    try {
      if (paginaIndisponivel == true) throw "Indisponivel";
      return WillPopScope(
        onWillPop: aoVoltar,
        child: Scaffold(
          appBar: barraSuperior,
          body: conteudo.elementAt(escalaTela),
          bottomNavigationBar: barraInferior,
          floatingActionButton: botaoFlutuante,
          floatingActionButtonAnimator: animacaoBotaoFlutuante,
          floatingActionButtonLocation: localidadeBotaoFlutuante,
          drawer: menuGavetaEsquerda,
          onDrawerChanged: aoMudarMenuGavetaEsquerda,
          endDrawer: menuGavetaDireita,
          onEndDrawerChanged: aoMudarMenuGavetaDireita,
          bottomSheet: gavetaInferior,
        ),
      );
    } catch (erro) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Componentes.pagina.rolagem(
              conteudo: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Componentes.imagem.padrao(
                    imagem: "Indisponivel",
                    largura: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 40),
                    child: Componentes.texto.padrao(
                      texto: Idiomas.of(context).tituloIndisponivel,
                      estilo: Estilos.texto.titulo(context: context),
                    ),
                  ),
                  Visibility(
                    visible: botaoPaginaIndisponivel ?? true,
                    child: Componentes.botao.elevadoIcone(
                      aoPrecionar: () => Sistemas.navegador.voltar(context),
                      icone: Icons.arrow_back,
                      titulo: Idiomas.of(context).tituloVoltar,
                    ),
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
