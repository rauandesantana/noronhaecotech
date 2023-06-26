// ----------------------------------------------------------------------------- Estilos Imagem Logos
class $EstImagemLogos {
  static const String pasta = "assets/imagens/logos";
  const $EstImagemLogos();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Noronha EcoTech
  $EstLogosNoronhaEcoTech get noronhaEcoTech => const $EstLogosNoronhaEcoTech();
  // =========================================================================== Apple
  String get apple => "$pasta/apple.png";
  // =========================================================================== Facebook
  String get facebook => "$pasta/facebook.png";
  // =========================================================================== Google
  String get google => "$pasta/google.png";
  // =========================================================================== Whatsapp
  String get whatsapp => "$pasta/whatsapp.png";
}

////////////////////////////////////////////////////////////////////////////////
//////////////////////////////  Arquivos  //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// ----------------------------------------------------------------------------- Estilos Imagem Icone
class $EstImagemIcones {
  static const String pasta = "assets/imagens/icones";
  const $EstImagemIcones();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Golfinho
  String get golfinho => "$pasta/golfinho.png";
  // =========================================================================== Globo Países
  String get globoPaises => "$pasta/globo_paises.png";
  // =========================================================================== Globo Países
  String get email => "$pasta/email.png";
}

// ----------------------------------------------------------------------------- Logos Noronha EcoTech
class $EstLogosNoronhaEcoTech {
  static const String pasta = "assets/imagens/logos/noronha_ecotech";
  const $EstLogosNoronhaEcoTech();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Resolução 512
  String get r512 => "$pasta/noronha_ecotech_512.png";

  // =========================================================================== Resolução 512
  String get r192 => "$pasta/noronha_ecotech_192.png";
}
