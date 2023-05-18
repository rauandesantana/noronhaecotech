import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

// ----------------------------------------------------------------------------- Estilos Texto Decorativo
class $EstTextoDecorativo extends TextStyle {
  $EstTextoDecorativo({
    required Color? corTexto,
    required String? fonte,
    required FontWeight? negrito,
    required double? tamanho,
  }) : super(
          color: corTexto,
          fontFamily: fonte ?? Estilos.fonte.noronhaEcoTech,
          fontWeight: negrito ?? FontWeight.bold,
          fontSize: tamanho ?? 12,
          decoration: TextDecoration.none,
        );
}
