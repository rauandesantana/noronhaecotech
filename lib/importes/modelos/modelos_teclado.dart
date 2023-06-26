import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Teclado
class Teclado {
  final bool Function(BuildContext) estado;
  final VoidCallback fechar;

  const Teclado({
    required this.estado,
    required this.fechar,
  });
  //////////////////////////////////////////////////////////////////////////////
}