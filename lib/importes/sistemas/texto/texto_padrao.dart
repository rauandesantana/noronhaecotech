import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';

// ----------------------------------------------------------------------------- Sistemas Texto Padrão
class $SisTextoPadrao {
  const $SisTextoPadrao();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Texto Copiar
  Future<void> copiar(String texto) async {
    await Clipboard.setData(
      ClipboardData(text: texto),
    );
  }

  // =========================================================================== Texto Copiar
  Future<String> colar() async {
    final areaDeTransferencia = await Clipboard.getData(Clipboard.kTextPlain);
    return areaDeTransferencia?.text ?? "";
  }

  // =========================================================================== Texto Copiar
  Future<bool> checar() async => Clipboard.hasStrings();

  // =========================================================================== Criptografar
  String? criptografar(String? texto) {
    if (texto == null) return null;
    final camada_1 = sha256.convert(utf8.encode(texto)).toString();
    final camada_2 = camada_1.split("").reversed.join();
    final camada_3 = sha512.convert(utf8.encode(camada_2)).toString();
    return camada_3;
  }
}
