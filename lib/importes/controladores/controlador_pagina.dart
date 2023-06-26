import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Controlador Pagina
class ControladorPagina {
  final int indiceInicial;
  late PageController _controlador;
  int indiceAtual = 0;

  ControladorPagina({
    this.indiceInicial = 0,
  }) {
    indiceAtual = indiceInicial;
    _controlador = PageController(initialPage: indiceInicial);
  }
  PageController get instancia => _controlador;

  void alterarIndice(int indice) {
    Sistemas.dispositivo.info.teclado.fechar();
    _controlador.animateToPage(
      indice,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCirc,
    );
  }

  void proximoIndice() {
    Sistemas.dispositivo.info.teclado.fechar();
    _controlador.animateToPage(
      indiceAtual + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCirc,
    );
  }

  void retrocederIndice() {
    Sistemas.dispositivo.info.teclado.fechar();
    _controlador.animateToPage(
      indiceAtual - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCirc,
    );
  }
}
