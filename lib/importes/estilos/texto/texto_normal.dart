import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Estilos Texto Normal
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
          decoration: TextDecoration.none,
        );
}
