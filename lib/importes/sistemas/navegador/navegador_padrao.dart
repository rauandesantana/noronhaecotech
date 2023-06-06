import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Sistemas Navegador Padrão
class $SisNavegadorPadrao {
  const $SisNavegadorPadrao();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Navegador Padrão
  void padrao({
    required BuildContext context,
    required Pagina pagina,
    Object? dados,
    bool? fecharAnterior,
    bool? fecharTodas,
  }) {
    if (fecharTodas == true) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        pagina.caminho,
        (rota) => false,
        arguments: dados,
      );
    } else if (fecharAnterior == true) {
      Navigator.of(context).popAndPushNamed(
        pagina.caminho,
        arguments: dados,
      );
    } else {
      Navigator.of(context).pushNamed(
        pagina.caminho,
        arguments: dados,
      );
    }
  }

  // =========================================================================== Navegador Voltar
  void voltar(BuildContext context) {
    switch (Navigator.of(context).canPop()) {
      case true:
        Navigator.pop(context);
        break;
      default:
        SystemNavigator.pop(animated: true);
        break;
    }
  }

  // =========================================================================== Navegador Voltar
  Map recuperarDados(BuildContext context) {
    final objeto = ModalRoute.of(context)?.settings.arguments;
    return (objeto as Map?) ?? {};
  }

  // =========================================================================== Navegador Abrir Dialogo
  Future<dynamic> abrirDialogo({
    required BuildContext context,
    required Widget dialogo,
    bool? persistente,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: !(persistente ?? false),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => !(persistente ?? false),
          child: dialogo,
        );
      },
    );
  }

  // =========================================================================== Navegador Abrir Carregamento
  Future<dynamic> abrirCarregamento(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Componentes.dialogo.padrao(
              titulo: Idiomas.current.tituloCarregando,
              conteudo: (context, atualizar) {
                return Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: Componentes.carregamento.circular(),
                );
              }),
        );
      },
    );
  }

  // =========================================================================== Abrir Gaveta Inferior
  Future<dynamic>? abrirGavetaInferior({
    required BuildContext context,
    VoidCallback? estadoInicial,
    void Function(StateSetter)? estadoMontado,
    void Function(StateSetter)? estadoDesmontado,
    VoidCallback? estadoDescarte,
    void Function(bool)? estadoGaveta,
    required StatefulWidgetBuilder conteudo,
    double? larguraMax,
    bool? persistente,
  }) {
    final tamanhoTela = MediaQuery.of(context).size;
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: !(persistente ?? false),
      constraints: BoxConstraints(
        maxWidth: larguraMax ?? tamanhoTela.width,
        maxHeight: tamanhoTela.height * 0.489,
      ),
      builder: (context) => WillPopScope(
        onWillPop: () async => !(persistente ?? false),
        child: Componentes.gaveta.inferior(
          estadoInicial: estadoInicial,
          estadoMontado: estadoMontado,
          estadoDesmontado: estadoDesmontado,
          estadoDescarte: estadoDescarte,
          estadoGaveta: estadoGaveta,
          conteudo: conteudo,
        ),
      ),
    );
  }

  void abrirMensagem({
    required BuildContext context,
    required String mensagem,
    double? largura,
    bool? flutuante,
    bool? botaoFechar,
    Color? corFundo,
    Color? corIconeFechar,
    Duration? duracao,
    VoidCallback? aoVisualizar,
    double? tamanhoTexto,
    TextOverflow? aoEstourar,
  }) {
    const espacoInterno = EdgeInsets.symmetric(horizontal: 15, vertical: 15);
    final tamanhoTextoResultante = tamanhoTexto ?? 16;
    final larguraTela = MediaQuery.of(context).size.width;
    double? larguraResultante;

    if (flutuante == true && largura != null && largura < larguraTela) {
      larguraResultante = largura;
    } else if (flutuante == true && largura == null) {
      double tamanhoGerado = 0;

      for (var caractere in mensagem.characters) {
        if (caractere.contains(RegExp(r'[Ii]'))) {
          tamanhoGerado += ((tamanhoTextoResultante) * 0.28);
        } else if (caractere.contains(RegExp(r'[WMQGOHNwmqgohn\W]'))) {
          tamanhoGerado += ((tamanhoTextoResultante) * 0.89);
        } else {
          tamanhoGerado += ((tamanhoTextoResultante) * 0.67);
        }
      }

      larguraResultante = tamanhoGerado + espacoInterno.horizontal;
      if (larguraResultante >= larguraTela) larguraResultante = null;
    } else {
      larguraResultante = null;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: larguraResultante,
        backgroundColor: corFundo ?? Theme.of(context).primaryColor,
        margin: (flutuante == true && larguraResultante == null)
            ? const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
            : null,
        padding: espacoInterno,
        behavior: (flutuante == true)
            ? SnackBarBehavior.floating
            : SnackBarBehavior.fixed,
        shape: RoundedRectangleBorder(
          borderRadius: (flutuante == true)
              ? BorderRadius.circular(15)
              : BorderRadius.zero,
        ),
        showCloseIcon: botaoFechar,
        closeIconColor:
            corIconeFechar ?? Theme.of(context).scaffoldBackgroundColor,
        duration: duracao ?? const Duration(milliseconds: 4000),
        onVisible: aoVisualizar,
        content: Center(
          child: Componentes.texto.padrao(
            aoEstourar: aoEstourar,
            estilo: Estilos.texto.normal(tamanho: tamanhoTextoResultante),
            texto: mensagem,
          ),
        ),
      ),
    );
  }
}
