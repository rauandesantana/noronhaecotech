import 'package:flutter/foundation.dart';
import 'dart:io';
export 'package:flutter/foundation.dart' show kIsWeb;
export 'dart:io';

// ----------------------------------------------------------------------------- Dispositivo
class Dispositivo {
  final String plataforma;
  final String tipo;

  const Dispositivo({
    required this.plataforma,
    required this.tipo,
  });
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Dispositivo Info
  static Dispositivo get info => Dispositivo(
    plataforma: (kIsWeb) ? "web" : Platform.operatingSystem,
    tipo: (!kIsWeb)
        ? (Platform.isAndroid || Platform.isIOS)
        ? "mobile"
        : "outros"
        : "outros",
  );
}