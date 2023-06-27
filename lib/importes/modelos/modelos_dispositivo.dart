import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Dispositivo
class Dispositivo {
  final Teclado teclado;
  late final String plataforma;
  late final String tipo;

  Dispositivo({
    required this.teclado,
  }) {
    if (kIsWeb) {
      plataforma = _buscarPlataforma;
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

  String get _buscarPlataforma {
    final regex = RegExp(r';\s(?<info>.*?);');
    final plataformaWeb = window.navigator.userAgent;
    return regex.firstMatch(plataformaWeb)?.group(1) ?? tipoWeb;
  }
}
