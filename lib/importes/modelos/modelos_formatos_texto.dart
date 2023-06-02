import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

const String valorEmBranco = "";
const indiceNaoEncontrado = -1;

// ----------------------------------------------------------------------------- Formatos Texto
class FormatosTexto {
  final String valorFormato;
  final String caractereLetra;
  final String caractereNumero;

  FormatosTexto({
    required this.valorFormato,
    this.caractereLetra = "@",
    this.caractereNumero = "#",
  });
  //////////////////////////////////////////////////////////////////////////////
  final RegExp regex = RegExp(r'[a-zá-úA-ZÀ-Ù\d]');
  final RegExp regexInverso = RegExp(r'[^a-zá-úA-ZÀ-Ù\d]');
  final RegExp regexLetra = RegExp(r'[a-zá-úA-ZÀ-Ù]');
  final RegExp regexNumero = RegExp(r'\d');

  // =========================================================================== Tamanho Formato
  int get tamanhoFormato => _obterTamanho();
  int _obterTamanho() {
    if (valorFormato.isEmpty) return 0;
    int tamanho = 0;
    for (int i = 0; i < valorFormato.length; i++) {
      final String caractere = valorFormato[i];
      final bool adicionar =
          caractere == caractereLetra || caractere == caractereNumero;
      if (adicionar) tamanho++;
    }
    return tamanho;
  }

  // =========================================================================== Checar Caractere
  bool checarCaractere(String? valor) => _checarCaractere(valor);
  bool _checarCaractere(String? valor) {
    if (valor == null || valor.isEmpty || valor.length > 1) return false;
    return valor.contains(regexInverso) &&
        !(valor.contains(caractereLetra) || valor.contains(caractereNumero));
  }

  // =========================================================================== Indice Cursor
  int indiceCursor(String? valor, bool apagando, [int cursor = 0]) =>
      _indiceCursor(valor, apagando, cursor);
  int _indiceCursor(String? valor, bool apagando, int cursor) {
    if (valor == null) return indiceNaoEncontrado;
    if (valor.isEmpty) return 0;
    int limite = valor.lastIndexOf(regex) + 1;
    if (cursor >= limite) {
      int indice = max(
        valor.indexOf(caractereLetra, 0),
        valor.indexOf(caractereNumero, 0),
      );
      return (indice == -1) ? indice = valor.lastIndexOf(regex) + 1 : indice;
    }
    if (apagando) return cursor;
    final bool checar = _checarCaractere(valor[cursor - 1]);
    if (checar) return valor.indexOf(regex, cursor) + 1;
    return valor.indexOf(regex, cursor);
  }

  // =========================================================================== Converter
  String converter(String? valor) => _converter(valor);
  String _converter(String? valor) {
    if (valor == null || valor.isEmpty) return valorEmBranco;
    String resultado = valorFormato;
    int v = 0;
    for (int f = 0; f < valorFormato.length; f++) {
      if (v >= valor.length) break;
      final RegExp? regexCaractere = (valorFormato[f] == caractereLetra)
          ? regexLetra
          : (valorFormato[f] == caractereNumero)
              ? regexNumero
              : null;
      if (regexCaractere != null && valor[v].contains(regexCaractere)) {
        resultado = resultado.replaceFirst(valorFormato[f], valor[v]);
        v++;
      }
    }
    return resultado;
  }

  // =========================================================================== Desconverter
  String desconverter(String? valor) => _desconverter(valor);
  String _desconverter(String? valor) {
    if (valor == null || valor.isEmpty) return valorEmBranco;
    return valor.replaceAll(
      regexInverso,
      valorEmBranco,
    );
  }
}
