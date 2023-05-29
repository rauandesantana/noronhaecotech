import 'package:noronhaecotech/importes/sistemas/api/api_padrao.dart';
import 'package:noronhaecotech/importes/sistemas/dados/dados_padrao.dart';
import 'package:noronhaecotech/importes/sistemas/dispositivo/dispositivo_padrao.dart';
import 'package:noronhaecotech/importes/sistemas/firebase/firebase_padrao.dart';
import 'package:noronhaecotech/importes/sistemas/navegador/navegador_padrao.dart';
import 'package:noronhaecotech/importes/sistemas/texto/texto_padrao.dart';
////////////////////////////////////////////////////////////////////////////////
export 'package:noronhaecotech/importes/modelos/modelos_dispositivo.dart';

// ----------------------------------------------------------------------------- Sistemas
class Sistemas {
  const Sistemas();
  //////////////////////////////////////////////////////////////////////////////
  static $SisNavegadorPadrao get navegador => const $SisNavegadorPadrao();
  static $SisDispositivoPadrao get dispositivo => const $SisDispositivoPadrao();
  static $SisAPIPadrao get api => const $SisAPIPadrao();
  static $SisTextoPadrao get texto => const $SisTextoPadrao();
  static $SisDadosPadrao get dados => $SisDadosPadrao();
  static $SisFirebasePadrao get firebase => $SisFirebasePadrao();
}
