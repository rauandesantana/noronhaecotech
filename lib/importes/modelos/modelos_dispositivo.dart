export 'package:flutter/foundation.dart' show kIsWeb;
export 'dart:io';

class Dispositivo {
  final String plataforma;
  final String tipo;

  const Dispositivo({
    required this.plataforma,
    required this.tipo,
  });
}