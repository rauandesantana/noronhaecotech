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
  static String get android => "Android";
  static String get ios => "IOS";
  static String get windows => "Windows";
  static String get macos => "MacOS";
  static String get linux => "Linux";
  static String get fuchsia => "Fuchsia";
  static String get tipoWeb => "Web";
  static String get tipoMobile => "Mobile";
  static String get tipoOutros => "Desconhecido";

  String get _buscarPlataforma {
    final regex = RegExp(r'\((?<info>.*?)\)');
    final plataformaWeb = window.navigator.userAgent;
    final info = regex.firstMatch(plataformaWeb)?.namedGroup("info");
    final String plataforma = (info?.contains(RegExp(r'Android')) ?? false)
        ? android
        : (info?.contains(RegExp(r'iPhone')) ?? false)
            ? ios
            : (info?.contains(RegExp(r'Macintosh|Mac')) ?? false)
                ? macos
                : (info?.contains(RegExp(r'Windows|Win')) ?? false)
                    ? windows
                    : (info?.contains(RegExp(r'Linux')) ?? false)
                        ? linux
                        : tipoOutros;
    return plataforma;
  }
}
