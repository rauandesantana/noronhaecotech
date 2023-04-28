import 'package:flutter/services.dart';

class $SisTextoPadrao {
  const $SisTextoPadrao();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Texto Copiar
  Future<void> copiar(String texto) async {
    await Clipboard.setData(
      ClipboardData(text: texto),
    );
  }

  // --------------------------------------------------------------------------- Texto Copiar
  Future<String> colar() async {
    final areaDeTransferencia = await Clipboard.getData(Clipboard.kTextPlain);
    return areaDeTransferencia?.text ?? "";
  }

  // --------------------------------------------------------------------------- Texto Copiar
  Future<bool> checar() async => Clipboard.hasStrings();
}
