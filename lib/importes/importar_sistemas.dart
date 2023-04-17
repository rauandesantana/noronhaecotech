import 'package:noronhaecotech/importes/modelos/modelos_dispositivo.dart';
import 'package:noronhaecotech/importes/sistemas/api/api_padrao.dart';
import 'package:noronhaecotech/importes/sistemas/navegador/navegador_padrao.dart';
import 'package:noronhaecotech/importes/sistemas/teclado/teclado_padrao.dart';

class Sistemas {
  const Sistemas();
  //////////////////////////////////////////////////////////////////////////////
  static $SisNavegadorPadrao get navegador => const $SisNavegadorPadrao();
  static $SisTecladoPadrao get teclado => const $SisTecladoPadrao();
  static $SisAPIPadrao get api => const $SisAPIPadrao();
  static Dispositivo get info => Dispositivo(
        plataforma: (kIsWeb) ? "web" : Platform.operatingSystem,
        tipo: (!kIsWeb)
            ? (Platform.isAndroid || Platform.isIOS)
                ? "mobile"
                : "outros"
            : "outros",
      );
}
