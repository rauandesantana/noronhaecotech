import 'package:noronhaecotech/importes/sistemas/api/api_padrao.dart';
import 'package:noronhaecotech/importes/sistemas/navegador/navegador_padrao.dart';
import 'package:noronhaecotech/importes/sistemas/teclado/teclado_padrao.dart';

class Sistemas {
  const Sistemas();
  //////////////////////////////////////////////////////////////////////////////
  static $SisNavegador get navegador => const $SisNavegador();
  static $SisTeclado get teclado => const $SisTeclado();
  static $SisAPI get api => const $SisAPI();
}