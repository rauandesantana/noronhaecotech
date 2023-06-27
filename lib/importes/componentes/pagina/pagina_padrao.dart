import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Componentes Pagina Padrão
class $ComPaginaPadrao extends StatelessWidget {
  final bool? paginaIndisponivel;
  final String? tituloPaginaIndisponivel;
  final bool? botaoPaginaIndisponivel;
  final WillPopCallback? aoVoltar;
  final PreferredSizeWidget? barraSuperior;
  final ConteudoPaginaPadrao? conteudo;
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
    required this.tituloPaginaIndisponivel,
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
    try {
      if (conteudo == null || paginaIndisponivel == true) throw "Indisponivel";
      final dispositivo = Sistemas.dispositivo.info;
      return WillPopScope(
        onWillPop: aoVoltar,
        child: Scaffold(
          appBar: barraSuperior,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final retorno = conteudo!(context, constraints, dispositivo);
                if (retorno.isEmpty) throw "Indisponivel";
                ////////////////////////////////////////////////////////////////
                final largura = constraints.maxWidth;
                final indiceMax = retorno.length - 1;
                int escalaTela = (largura - 240) ~/ 240;
                if (escalaTela > indiceMax) escalaTela = indiceMax;
                ////////////////////////////////////////////////////////////////
                return retorno.elementAt(escalaTela);
              },
            ),
          ),
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
      if (erro != "Indisponivel") {
        Sistemas.dispositivo.reportarErro(
          erro: erro,
          local: ["Componentes", "PaginaPadrao"],
          verificacao: "paginaIndisponivel",
        );
      }
      return WillPopScope(
        onWillPop: aoVoltar,
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: Componentes.pagina.rolagem(
                conteudo: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Componentes.imagem.padrao(
                      imagem: Estilos.imagem.icones.golfinho,
                      corImagem: Estilos.cor(context).primary,
                      largura: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 40),
                      child: Componentes.texto.padrao(
                        texto: tituloPaginaIndisponivel ??
                            Idiomas.current.tituloIndisponivel,
                        estilo: Estilos.texto.titulo(context: context),
                      ),
                    ),
                    Visibility(
                      visible: botaoPaginaIndisponivel ?? true,
                      child: Componentes.botao.elevadoIcone(
                        aoPrecionar: () => Sistemas.navegador.voltar(context),
                        icone: Icons.arrow_back,
                        titulo: Idiomas.current.tituloVoltar,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
