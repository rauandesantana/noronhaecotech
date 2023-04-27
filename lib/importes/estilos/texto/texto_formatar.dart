import 'package:flutter/services.dart';
import 'package:noronhaecotech/importes/modelos/modelos_formatos_texto.dart';

TextEditingValue valorVazio = const TextEditingValue(
  text: "",
  composing: TextRange.empty,
  selection: TextSelection.collapsed(offset: 0),
);

class $EstTextoFormatar extends TextInputFormatter {
  final FormatosTexto formato;

  $EstTextoFormatar({
    required this.formato,
  });

  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    final String valorFormato = formato.valorFormato;
    final bool apagando = (oldValue.text.length > newValue.text.length);

    if (oldValue.text.isEmpty) {
      String textoConvertido = formato.converter(newValue.text);
      int indiceCursor = formato.indiceCursor(
        textoConvertido,
        apagando,
        double.maxFinite.toInt(),
      );
      oldValue = oldValue.copyWith(text: valorFormato);
      newValue = newValue.copyWith(
        text: textoConvertido,
        composing: TextRange.empty,
        selection: TextSelection.collapsed(offset: indiceCursor),
      );
      return newValue;
    }

    final int tamanhoFormato = formato.tamanhoFormato;
    final bool finalizado =
        formato.desconverter(oldValue.text).length == tamanhoFormato;

    if (finalizado && !apagando) return oldValue;

    return atualizar(atual: newValue, anterior: oldValue, apagando: apagando);
  }

  TextEditingValue atualizar({
    required TextEditingValue atual,
    required TextEditingValue anterior,
    required bool apagando,
  }) {
    final int cursor = atual.selection.baseOffset;
    final bool colando = (atual.text.length - anterior.text.length) > 1;

    if (colando) {
      final int cursorAnterior = anterior.selection.baseOffset;
      final String texto = atual.text.substring(cursorAnterior, cursor);
      final String textoConvertido = formato.converter(texto);
      return atual.copyWith(
        text: textoConvertido,
        composing: TextRange.empty,
        selection: TextSelection.collapsed(
          offset: formato.indiceCursor(
            textoConvertido,
            apagando,
            double.maxFinite.toInt(),
          ),
        ),
      );
    }

    String textoDesconvertido = formato.desconverter(atual.text);
    String textoConvertido = formato.converter(textoDesconvertido);
    int indiceCursor = formato.indiceCursor(
      textoConvertido,
      apagando,
      cursor,
    );

    final bool apagandoUnitario =
        (anterior.text.length - atual.text.length) == 1;
    final bool semSelecao =
        (anterior.selection.end - anterior.selection.start) == 0;
    final bool textoValido = textoConvertido.isNotEmpty && cursor > 0;

    if (apagandoUnitario && semSelecao && textoValido) {
      String caractere = textoConvertido[cursor];
      if (formato.checarCaractere(caractere)) {
        String textoBusca = textoConvertido.substring(0, cursor);
        final int indiceApagar = textoBusca.lastIndexOf(formato.regex);
        textoBusca = textoConvertido.replaceRange(indiceApagar, cursor, "");
        textoDesconvertido = formato.desconverter(textoBusca);
        textoConvertido = formato.converter(textoDesconvertido);
        indiceCursor = formato.indiceCursor(
          textoConvertido,
          apagando,
          indiceApagar,
        );
      }
    }

    return atual.copyWith(
      text: textoConvertido,
      composing: TextRange.empty,
      selection: TextSelection.collapsed(offset: indiceCursor),
    );
  }
}
