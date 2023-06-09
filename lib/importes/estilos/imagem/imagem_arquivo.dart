import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Estilos Imagem Logos
class $EstImagemLogos {
  const $EstImagemLogos();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Noronha EcoTech
  $EstLogosNoronhaEcoTech get noronhaEcoTech => const $EstLogosNoronhaEcoTech();
  // =========================================================================== Apple
  String get apple => "assets/imagens/logos/apple.png";
  // =========================================================================== Facebook
  String get facebook => "assets/imagens/logos/facebook.png";
  // =========================================================================== Google
  String get google => "assets/imagens/logos/google.png";
  // =========================================================================== Whatsapp
  String get whatsapp => "assets/imagens/logos/whatsapp.png";
}

////////////////////////////////////////////////////////////////////////////////
//////////////////////////////  Arquivos  //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// ----------------------------------------------------------------------------- Estilos Imagem Icone
class $EstImagemIcones {
  const $EstImagemIcones();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Golfinho
  String get golfinho => "assets/imagens/icones/golfinho.png";
  // =========================================================================== Globo Países
  String get globoPaises => "assets/imagens/icones/globo_paises.png";
  // =========================================================================== Globo Países
  String get email => "assets/imagens/icones/email.png";
}

// ----------------------------------------------------------------------------- Logos Noronha EcoTech
class $EstLogosNoronhaEcoTech {
  const $EstLogosNoronhaEcoTech();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Resolução 512
  String r512(BuildContext context) {
    switch (Estilos.cor(context).brightness.name) {
      case "dark":
        return "assets/imagens/logos/noronha_ecotech/noronha_ecotech_512_dark.png";
      default:
        return "assets/imagens/logos/noronha_ecotech/noronha_ecotech_512_light.png";
    }
  }

  // =========================================================================== Resolução 512
  String r192(BuildContext context) {
    switch (Estilos.cor(context).brightness.name) {
      case "dark":
        return "assets/imagens/logos/noronha_ecotech/noronha_ecotech_192_dark.png";
      default:
        return "assets/imagens/logos/noronha_ecotech/noronha_ecotech_192_light.png";
    }
  }
}
