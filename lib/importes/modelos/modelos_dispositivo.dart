import 'package:noronhaecotech/configuracoes/importar_tudo.dart';
import 'dart:html';

// ----------------------------------------------------------------------------- Dispositivo
class Dispositivo {
  final Teclado teclado;
  late final String plataforma;
  late final String tipo;

  Dispositivo({
    required this.teclado,
  }) {
    if (kIsWeb) {
      final infoWeb = window.navigator.userAgent;





      plataforma =  _buscarPlataforma(infoWeb);
      tipo = tipoWeb;
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          plataforma = android;
          tipo = tipoMobile;
          break;
        case TargetPlatform.iOS:
          plataforma = ios;
          tipo = tipoMobile;
          break;
        case TargetPlatform.macOS:
          plataforma = macos;
          tipo = tipoOutros;
          break;
        case TargetPlatform.windows:
          plataforma = windows;
          tipo = tipoOutros;
          break;
        case TargetPlatform.linux:
          plataforma = linux;
          tipo = tipoOutros;
          break;
        case TargetPlatform.fuchsia:
          plataforma = fuchsia;
          tipo = tipoOutros;
          break;
      }
    }
  }
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Definições
  static String get android => "android";
  static String get ios => "android";
  static String get windows => "windows";
  static String get macos => "macos";
  static String get linux => "linux";
  static String get fuchsia => "fuchsia";
  static String get tipoWeb => "web";
  static String get tipoMobile => "mobile";
  static String get tipoOutros => "desktop";


  String _buscarPlataforma(String infoWeb) {
    int inicio = infoWeb.indexOf("(") + 1;
    int fim = infoWeb.indexOf(";");



    return infoWeb.substring(inicio, fim);
  }
}
