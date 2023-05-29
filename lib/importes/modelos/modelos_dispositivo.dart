
// ----------------------------------------------------------------------------- Dispositivo
class Dispositivo {
  final String plataforma;
  final String tipo;

  const Dispositivo({
    required this.plataforma,
    required this.tipo,
  });
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Definições
  static String get web => "web";
  static String get android => "android";
  static String get ios => "android";
  static String get windows => "windows";
  static String get macos => "macos";
  static String get linux => "linux";
  static String get fuchsia => "fuchsia";
  static String get tipoWeb => web;
  static String get tipoMobile => "mobile";
  static String get tipoOutros => "outros";
}