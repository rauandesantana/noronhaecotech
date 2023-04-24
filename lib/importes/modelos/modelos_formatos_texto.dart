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

  // --------------------------------------------------------------------------- Checar Caractere
  bool checarCaractere(String? valor) => _checarCaractere(valor);

  bool _checarCaractere(String? valor) {
    if (valor == null || valor.isEmpty || valor.length > 1) return false;

    return valor.contains(caractereLetra) || valor.contains(caractereNumero);
  }

  // --------------------------------------------------------------------------- Indice Cursor
  int indiceCursor(String? valor, [int cursor = 0]) =>
      _indiceCursor(valor, cursor);

  int _indiceCursor(String? valor, int cursor) {
    if (valor == null) {
      return indiceNaoEncontrado;
    } else if (valor.isEmpty) {
      return 0;
    }

    bool escritaInicial = _desconverter(valor).length <= 2;
    RegExp regex = RegExp(r'[a-zá-úA-ZÀ-Ù\d]');

    if(escritaInicial || valor.lastIndexOf(regex) < cursor){
      int indice = max(
        valor.indexOf(caractereLetra, 0),
        valor.indexOf(caractereNumero, 0),
      );

      return (indice == -1) ? valor.lastIndexOf(regex) + 1 : indice;
    }

    return valor.indexOf(regex, cursor);
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

  // --------------------------------------------------------------------------- Desconverter
  String desconverter(String? valor) => _desconverter(valor);

  String _desconverter(String? valor) {
    if (valor == null || valor.isEmpty) return valorEmBranco;

    return valor.replaceAll(
      RegExp(r'[^a-zá-úA-ZÀ-Ù\d]'),
      valorEmBranco,
    );
  }
}
