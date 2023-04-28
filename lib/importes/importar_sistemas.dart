import 'package:noronhaecotech/importes/sistemas/api/api_padrao.dart';
import 'package:noronhaecotech/importes/sistemas/navegador/navegador_padrao.dart';
import 'package:noronhaecotech/importes/sistemas/teclado/teclado_padrao.dart';
import 'package:noronhaecotech/importes/sistemas/texto/texto_padrao.dart';

class Sistemas {
  const Sistemas();
  //////////////////////////////////////////////////////////////////////////////
  static $SisNavegadorPadrao get navegador => const $SisNavegadorPadrao();
  static $SisTecladoPadrao get teclado => const $SisTecladoPadrao();
  static $SisAPIPadrao get api => const $SisAPIPadrao();
  static $SisTextoPadrao get texto => const $SisTextoPadrao();
}
