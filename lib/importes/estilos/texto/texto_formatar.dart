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
    final int tamanhoFormato = formato.tamanhoFormato;
    final bool apagando = (oldValue.text.length > newValue.text.length);
    if (oldValue.text.isEmpty) {
      int cursor = newValue.selection.baseOffset;
      String textoConvertido = formato.converter(newValue.text);
      int indiceCursor = formato.indiceCursor(
        textoConvertido,
        apagando,
        cursor,
      );
      oldValue = oldValue.copyWith(text: valorFormato);
      newValue = newValue.copyWith(
        text: textoConvertido,
        composing: TextRange.empty,
        selection: TextSelection.collapsed(offset: indiceCursor),
      );
      return newValue;
    }

    final bool finalizado =
        formato.desconverter(newValue.text).length > tamanhoFormato;

    if (finalizado) return oldValue;

    return atualizar(atual: newValue, anterior: oldValue, apagando: apagando);
  }

  TextEditingValue atualizar({
    required TextEditingValue atual,
    required TextEditingValue anterior,
    required bool apagando,
  }) {
    final int cursor = atual.selection.baseOffset;
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
