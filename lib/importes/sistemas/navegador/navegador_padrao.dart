import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

class $SisNavegadorPadrao {
  const $SisNavegadorPadrao();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Navegador Voltar
  void voltar(BuildContext context) {
    switch (Navigator.of(context).canPop()) {
      case true:
        Navigator.pop(context);
        break;
      default:
        Navigator.popAndPushNamed(context, "/");
        break;
    }
  }

  // --------------------------------------------------------------------------- Navegador Padrão
  void padrao({
    required BuildContext context,
    required String pagina,
    bool? fecharAnterior,
  }) {
    switch (fecharAnterior) {
      case true:
        Navigator.popAndPushNamed(context, pagina);
        break;
      default:
        Navigator.pushNamed(context, pagina);
        break;
    }
  }

  // --------------------------------------------------------------------------- Navegador Abrir Dialogo
  Future<dynamic> abrirDialogo({
    required BuildContext context,
    required Widget dialogo,
    bool? persistente,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: !(persistente ?? false),
      builder: (context) {
        return dialogo;
      },
    );
  }

  // --------------------------------------------------------------------------- Abrir Gaveta Inferior
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
    primaryFocus?.unfocus(disposition: UnfocusDisposition.scope);
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: !(persistente ?? false),
      constraints: BoxConstraints(
        maxWidth: larguraMax ?? tamanhoTela.width,
        maxHeight: tamanhoTela.height * 0.489,
      ),
      builder: (context) => Componentes.gaveta.inferior(
        estadoInicial: estadoInicial,
        estadoMontado: estadoMontado,
        estadoDesmontado: estadoDesmontado,
        estadoDescarte: estadoDescarte,
        estadoGaveta: estadoGaveta,
        conteudo: conteudo,
      ),
    );
  }
}
