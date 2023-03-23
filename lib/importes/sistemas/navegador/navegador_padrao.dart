import 'package:flutter/material.dart';

class $SistNavegador {
  const $SistNavegador();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Navegador Voltar
  void voltar(BuildContext context) => Navigator.pop(context);

  // --------------------------------------------------------------------------- Navegador Padrão
  void padrao({
    required BuildContext context,
    required String pagina,
    bool? fecharAnterior,
  }) {
    switch(fecharAnterior) {
      case true :
        Navigator.popAndPushNamed(context, pagina);
        break;
      default :
        Navigator.pushNamed(context, pagina);
        break;
    }
  }
}
