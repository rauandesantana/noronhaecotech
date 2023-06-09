import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Estilos Texto Titulo
class $EstTextoTitulo extends TextStyle {
  $EstTextoTitulo({
    required BuildContext context,
    required Color? corTexto,
    required String? fonte,
    required FontWeight? negrito,
    required double? escala,
  }) : super(
          color: corTexto ?? Estilos.cor(context).primary,
          fontFamily: fonte ?? Estilos.fonte.noronhaEcoTech,
          fontWeight: negrito ?? FontWeight.bold,
          fontSize: (escala == null || escala <= 1)
              ? 28
              : (escala == 2)
                  ? 24
                  : (escala == 3)
                      ? 20
                      : (escala == 4)
                          ? 16
                          : 12,
          decoration: TextDecoration.none,
        );
}
