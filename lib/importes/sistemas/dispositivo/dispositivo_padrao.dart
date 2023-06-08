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

  void aguardarRenderizacao(AcaoRenderizacao acao) {
    WidgetsBinding.instance.addPostFrameCallback((duracao) {
      acao(duracao);
    });
  }

  // =========================================================================== Observador Conexão
  Stream<ConnectivityResult> get observadorConexao {
    final Connectivity objetoConexao = Connectivity();
    return objetoConexao.onConnectivityChanged;
  }

  // =========================================================================== Checar Conexão
  Future<ConnectivityResult> checarConexao() async {
    final Connectivity objetoConexao = Connectivity();
    late ConnectivityResult estadoConexao;
    try {
      estadoConexao = await objetoConexao.checkConnectivity();
    } on PlatformException catch (erro) {
      estadoConexao = ConnectivityResult.none;
      reportarErro(
        erro: erro,
        local: ["Sistemas", "DispositivoPadrao"],
        verificacao: "checarConexao",
      );
    }
    return estadoConexao;
  }

  void reportarErro({
    required Object erro,
    required List<String> local,
    required String verificacao,
  }) {
    FlutterError.reportError(
      FlutterErrorDetails(
        exception: erro,
        library: local.join(" > "),
        context: ErrorSummary("=> $verificacao"),
      ),
    );
  }
}
