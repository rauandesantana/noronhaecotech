import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Dispositivo
class $SisDispositivoPadrao {
  const $SisDispositivoPadrao();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Dispositivo Info
  Dispositivo get info => Dispositivo(
        plataforma: (kIsWeb) ? Dispositivo.web : Platform.operatingSystem,
        tipo: (kIsWeb)
            ? Dispositivo.tipoWeb
            : (Platform.isAndroid || Platform.isIOS)
                ? Dispositivo.tipoMobile
                : Dispositivo.tipoOutros,
      );

  // =========================================================================== Teclado Estado
  bool estadoTeclado(BuildContext context) {
    return (MediaQuery.of(context).viewInsets.bottom != 0);
  }

  void fecharTeclado() {
    primaryFocus?.unfocus(disposition: UnfocusDisposition.scope);
  }

  void aguardarRenderizacao(void Function(Duration) acao) async {
    WidgetsBinding.instance.addPostFrameCallback((duracao) {
      acao(duracao);
    });
  }
}
