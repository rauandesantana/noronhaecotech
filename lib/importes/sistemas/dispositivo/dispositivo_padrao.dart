import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Dispositivo
class $SisDispositivoPadrao {
  const $SisDispositivoPadrao();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Dispositivo Info
  Dispositivo get info {
    return Dispositivo(
      teclado: Teclado(
        estado: _estadoTeclado,
        fechar: _desfocar,
      ),
    );
  }

  // =========================================================================== Aguardar Rederização
  void aguardarRenderizacao(AcaoRenderizacao acao) {
    WidgetsBinding.instance.addPostFrameCallback((duracao) {
      acao(duracao);
    });
  }

  // =========================================================================== Observador Conexão
  void observadorConexao({
    required List<ConnectivityResult> conexoesPermitidas,
    required AcaoConexao acaoConectado,
    required AcaoConexao acaoDesconectado,
  }) {
    final Connectivity objetoConexao = Connectivity();
    bool checarConexaoInicial = true;
    aguardarRenderizacao((duracao) {
      objetoConexao.onConnectivityChanged.listen((resultadoConexao) {
        (conexoesPermitidas.contains(resultadoConexao))
            ? acaoConectado(resultadoConexao)
            : acaoDesconectado(resultadoConexao);
      });
      if (checarConexaoInicial) {
        final checarConexaoAtual = checarConexao(objetoConexao: objetoConexao);
        checarConexaoAtual.then((resultadoConexao) {
          (conexoesPermitidas.contains(resultadoConexao))
              ? acaoConectado(resultadoConexao)
              : acaoDesconectado(resultadoConexao);
        });
        checarConexaoInicial = false;
      }
    });
  }

  // =========================================================================== Checar Conexão
  Future<ConnectivityResult> checarConexao({
    Connectivity? objetoConexao,
  }) async {
    final Connectivity conexao = objetoConexao ?? Connectivity();
    late ConnectivityResult estadoConexao;
    try {
      estadoConexao = await conexao.checkConnectivity();
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

  // =========================================================================== Reportar Erro
  void reportarErro({
    required Object erro,
    required List<String> local,
    required String verificacao,
  }) {
    FlutterError.reportError(
      FlutterErrorDetails(
        exception: erro,
        library: "=> ${local.join(" > ")}",
        context: ErrorSummary("=> $verificacao"),
      ),
    );
  }

  // =========================================================================== Metodo Estado Teclado
  bool _estadoTeclado(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom != 0;
  }

  // =========================================================================== Metodo Fechar Teclado
  void _desfocar() {
    primaryFocus?.unfocus(disposition: UnfocusDisposition.scope);
  }
}
