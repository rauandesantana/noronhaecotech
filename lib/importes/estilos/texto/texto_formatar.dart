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
    final bool apagando = oldValue.text.length > newValue.text.length;

    final bool selecao =
        oldValue.selection.baseOffset != oldValue.selection.extentOffset;

    final String? textoColado = valorColado(
      atual: newValue,
      anterior: oldValue,
      apagando: apagando,
      selecao: selecao,
    );

    if (oldValue.text.isEmpty || textoColado != null) {
      final String valorFormato = formato.valorFormato;
      final String textoDesconvertido = formato.desconverter(
        (oldValue.text.isEmpty) ? newValue.text : textoColado,
      );
      final String textoConvertido = formato.converter(textoDesconvertido);
      final int indiceCursor = formato.indiceCursor(
        textoConvertido,
        false,
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
      selecao: selecao,
    );
  }

  TextEditingValue atualizar({
    required TextEditingValue atual,
    required TextEditingValue anterior,
    required int cursor,
    required bool apagando,
    required bool selecao,
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

  String? valorColado({
    required TextEditingValue atual,
    required TextEditingValue anterior,
    required bool apagando,
    required bool selecao,
  }) {
    if (anterior.text.isEmpty) return null;
    if(apagando && !selecao) return null;

    final int inicio = anterior.selection.baseOffset;
    final int fim = atual.selection.baseOffset;
    final String texto = atual.text.substring(inicio, fim);

    return (texto.length > 1) ? texto : null;
  }
}
