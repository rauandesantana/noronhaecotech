import 'package:flutter/material.dart';

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
}
