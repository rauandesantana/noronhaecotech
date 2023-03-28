import 'package:flutter/material.dart';

class $SisNavegador {
  const $SisNavegador();
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
}
