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
    String valorFormato = formato.valorFormato;

    if (oldValue.text.isEmpty) {
      oldValue = oldValue.copyWith(text: valorFormato);
      newValue = atualizar(atual: newValue, anterior: oldValue);
      return newValue;
    }

    bool valoresDiferentes = (newValue.text.length > oldValue.text.length);
    bool bloqueio = oldValue.text.isNotEmpty &&
        !oldValue.text.endsWith(
          valorFormato[valorFormato.length - 1],
        );

    if (bloqueio && valoresDiferentes) return oldValue;

    return atualizar(atual: newValue, anterior: oldValue);
  }

  TextEditingValue atualizar({
    required TextEditingValue atual,
    required TextEditingValue anterior,
  }) {
    int indiceAtual = atual.text.length;
    int indiceAnterior = anterior.text.length;
    String textoDesconvertido = formato.desconverter(atual.text);
    String textoConvertido = formato.converter(textoDesconvertido);
    int indice = formato.indiceCursor(
      textoConvertido,
      atual.selection.baseOffset,
    );

    bool apagandoUnitario = ((indiceAnterior - indiceAtual) == 1 && indice > 1);

    if (apagandoUnitario && textoConvertido.isNotEmpty) {
      int cursor = anterior.selection.baseOffset;
      String caractere = textoConvertido[cursor - 1];
      RegExp regex = RegExp(r'[^a-zá-úA-ZÀ-Ù\d]');
      RegExp regexInverso = RegExp(r'[a-zá-úA-ZÀ-Ù\d]');

      if (!formato.checarCaractere(caractere) && caractere.contains(regex)) {
        String textoBusca = textoConvertido.substring(0, cursor);
        int indiceApagar = textoBusca.lastIndexOf(regexInverso);
        textoBusca = textoConvertido.replaceRange(indiceApagar, cursor, "");
        textoDesconvertido = formato.desconverter(textoBusca);
        textoConvertido = formato.converter(textoDesconvertido);
        indice = formato.indiceCursor(textoConvertido, indiceApagar);
      }
    }

    return atual.copyWith(
      text: textoConvertido,
      composing: TextRange.empty,
      selection: TextSelection.collapsed(offset: indice),
    );
  }
}
