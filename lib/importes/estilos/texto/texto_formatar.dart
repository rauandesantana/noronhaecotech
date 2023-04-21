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
    if (oldValue.text.isEmpty) {
      String textoConvertido = formato.converter(newValue.text);
      int indiceTextoConvertido = formato.indiceCursor(textoConvertido);

      oldValue = oldValue.copyWith(text: formato.valorFormato);
      newValue = newValue.copyWith(
        text: textoConvertido,
        selection: TextSelection.collapsed(offset: indiceTextoConvertido),
      );
      return newValue;
    }

    final int indiceAnterior = oldValue.selection.baseOffset;
    final int indiceAtual = newValue.selection.baseOffset;
    String resultado = oldValue.text;

    TextEditingValue atualizar(TextEditingValue valor) {
      String texto = formato.converter(formato.desconverter(valor.text));
      int indice = formato.indiceCursor(texto);
      return valor.copyWith(
        text: texto,
        composing: TextRange.empty,
        selection: TextSelection.collapsed(offset: indice),
      );
    }

    if (indiceAnterior < indiceAtual) {
      if ((indiceAtual - indiceAnterior) == 1) {
        // --------------------------------------------------------------------- Adicionando por Unidade
        resultado = formato.adicionar(oldValue.text, newValue.text);
      } else {
        // --------------------------------------------------------------------- Colando Texto
        return atualizar(newValue);
      }
    } else if (indiceAnterior > indiceAtual) {
      if (formato.desconverter(newValue.text).isNotEmpty) {
        // --------------------------------------------------------------------- Apagando por Unidade
        resultado = formato.remover(oldValue.text, newValue.text);
      } else {
        // --------------------------------------------------------------------- Apagando Último Dígito
        return valorVazio;
      }
    } else {
      if (newValue.text.length < oldValue.text.length) {
        if (formato.desconverter(newValue.text).isNotEmpty) {
          // ------------------------------------------------------------------- Apagando por Seleção Parte
          return atualizar(newValue);
        } else {
          // ------------------------------------------------------------------- Apagando por Seleção Total
          return valorVazio;
        }
      }
    }

    return oldValue.copyWith(
      text: resultado,
      composing: TextRange.empty,
      selection: TextSelection.collapsed(
        offset: formato.indiceCursor(resultado),
      ),
    );
  }
}
