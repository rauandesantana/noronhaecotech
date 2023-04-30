import 'package:flutter/services.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/modelos/modelos_formatos_texto.dart';

class $EstTextoFormatar extends TextInputFormatter {
  final FormatosTexto formato;

  $EstTextoFormatar({
    required this.formato,
  });

  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    final bool apagando = (oldValue.text.length > newValue.text.length);

    if (oldValue.text.isEmpty) {
      final String valorFormato = formato.valorFormato;
      final String textoDesconvertido = formato.desconverter(newValue.text);
      final String textoConvertido = formato.converter(textoDesconvertido);
      final int indiceCursor = formato.indiceCursor(
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

    final int tamanhoTexto = formato.desconverter(oldValue.text).length;
    final bool finalizado = tamanhoTexto == formato.tamanhoFormato;

    if (finalizado && !apagando) return oldValue;

    final int cursor = newValue.selection.baseOffset;

    return atualizar(
      atual: newValue,
      anterior: oldValue,
      cursor: cursor,
      apagando: apagando,
    );
  }

  TextEditingValue atualizar({
    required TextEditingValue atual,
    required TextEditingValue anterior,
    required int cursor,
    required bool apagando,
  }) {
    String textoDesconvertido = formato.desconverter(atual.text);
    String textoConvertido = formato.converter(textoDesconvertido);
    int indiceCursor = formato.indiceCursor(
      textoConvertido,
      apagando,
      cursor,
    );

    if (apagando) {
      final bool apagandoUnitario =
          (anterior.text.length - atual.text.length) == 1;
      final bool selecao =
          anterior.selection.baseOffset != anterior.selection.extentOffset;
      final bool textoValido = textoConvertido.isNotEmpty && cursor > 0;

      if (apagandoUnitario && !selecao && textoValido) {
        final String caractere = textoConvertido[cursor];
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
    }

    return atual.copyWith(
      text: textoConvertido,
      composing: TextRange.empty,
      selection: TextSelection.collapsed(offset: indiceCursor),
    );
  }
}
