import 'package:flutter/material.dart';

class $EstTextoNormal extends TextStyle {
  const $EstTextoNormal({
    required Color? corTexto,
    required String? fonte,
    required FontWeight? negrito,
    required double? tamanho,
  }) : super(
    color: corTexto,
    fontFamily: fonte,
    fontWeight: negrito ?? FontWeight.normal,
    fontSize: tamanho ?? 12,
  );
}
