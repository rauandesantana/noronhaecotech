import 'dart:math';

const String valorEmBranco = "";
const indiceNaoEncontrado = -1;

class FormatosTexto {
  final String valorFormato;
  final String caractereLetra;
  final String caractereNumero;

  FormatosTexto({
    required this.valorFormato,
    this.caractereLetra = "@",
    this.caractereNumero = "#",
  });

  // --------------------------------------------------------------------------- indiceCursor
  int indiceCursor(String? valor, [int iniciar = 0]) =>
      _indiceCursor(valor, iniciar);

  int _indiceCursor(String? valor, int iniciar) {
    if (valor == null) {
      return indiceNaoEncontrado;
    } else if (valor.isEmpty) {
      return 0;
    }

    int indice = max(
      valor.indexOf(caractereLetra, iniciar),
      valor.indexOf(caractereNumero, iniciar),
    );

    return (indice == -1)
        ? valor.lastIndexOf(RegExp(r'[a-zá-úA-ZÀ-Ù\d]')) + 1
        : indice;
  }

  // --------------------------------------------------------------------------- Converter
  String converter(String? valor) => _converter(valor);

  String _converter(String? valor) {
    if (valor == null || valor.isEmpty) return valorEmBranco;

    String resultado = valorFormato;

    int v = 0;
    for (int f = 0; f < valorFormato.length; f++) {
      if (v >= valor.length) break;

      final RegExp? regex = (valorFormato[f] == caractereLetra)
          ? RegExp(r'[a-zá-úA-ZÀ-Ù]')
          : (valorFormato[f] == caractereNumero)
              ? RegExp(r'\d')
              : null;

      if (regex != null && valor[v].contains(regex)) {
        resultado = resultado.replaceFirst(valorFormato[f], valor[v]);
        v++;
      }
    }
    return resultado;
  }

  // --------------------------------------------------------------------------- Converter
  String desconverter(String? valor) => _desconverter(valor);

  String _desconverter(String? valor) {
    if (valor == null || valor.isEmpty) return valorEmBranco;

    return valor.replaceAll(
      RegExp(r'[^a-zá-úA-ZÀ-Ù\d]'),
      valorEmBranco,
    );
  }

  // --------------------------------------------------------------------------- Adicionar
  String adicionar(String? valorAnterior, String? valorAtual) =>
      _adicionar(valorAnterior, valorAtual);

  String _adicionar(String? valorAnterior, String? valorAtual) {
    if (valorAnterior == null || valorAnterior.isEmpty) return valorEmBranco;
    if (valorAtual == null || valorAtual.isEmpty) return valorEmBranco;

    String resultado = valorAnterior;

    for (int v = 0; v < valorAnterior.length; v++) {
      final RegExp? regex = (valorFormato[v] == caractereLetra)
          ? RegExp(r'[a-zá-úA-ZÀ-Ù]')
          : (valorFormato[v] == caractereNumero)
              ? RegExp(r'\d')
              : null;

      if (regex != null && !valorAnterior[v].contains(regex)) {
        resultado = valorAnterior.replaceRange(v, v + 1, valorAtual[v]);
        break;
      }
    }

    return resultado;
  }

  // --------------------------------------------------------------------------- Adicionar
  String remover(String? valorAnterior, String? valorAtual) =>
      _remover(valorAnterior, valorAtual);

  String _remover(String? valorAnterior, String? valorAtual) {
    if (valorAnterior == null || valorAnterior.isEmpty) return valorEmBranco;
    if (valorAtual == null || valorAtual.isEmpty) return valorEmBranco;

    String resultado = valorAnterior;

    for (int v = (valorAnterior.length - 1); v >= 0; v--) {
      final RegExp? regex = (valorFormato[v] == caractereLetra)
          ? RegExp(r'[a-zá-úA-ZÀ-Ù]')
          : (valorFormato[v] == caractereNumero)
              ? RegExp(r'\d')
              : null;

      if (regex != null && valorAnterior[v].contains(regex)) {
        resultado = valorAnterior.replaceRange(v, v + 1, valorFormato[v]);
        break;
      }
    }
    return resultado;
  }
}
