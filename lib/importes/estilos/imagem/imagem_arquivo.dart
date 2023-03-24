import 'package:flutter/material.dart';

// ----------------------------------------------------------------------------- Imagem Logos
class $EstImagemLogos {
  const $EstImagemLogos();
  //////////////////////////////////////////////////////////////////////////////
  $EstLogosNoronhaEcoTech get noronhaEcoTech => const $EstLogosNoronhaEcoTech();
}

////////////////////////////////////////////////////////////////////////////////
//////////////////////////////  Arquivos  //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// ----------------------------------------------------------------------------- Imagem Icone
class $EstImagemIcones {
  const $EstImagemIcones();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Golfinho
  String get golfinho => "assets/imagens/icones/golfinho.png";
}

// ----------------------------------------------------------------------------- Logos Noronha EcoTech
class $EstLogosNoronhaEcoTech {
  const $EstLogosNoronhaEcoTech();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Resolução 512
  String r512(BuildContext context) {
    switch (Theme.of(context).brightness.name) {
      case "dark":
        return "assets/imagens/logos/noronha_ecotech/noronha_ecotech_512_dark.png";
      default:
        return "assets/imagens/logos/noronha_ecotech/noronha_ecotech_512_light.png";
    }
  }

  // --------------------------------------------------------------------------- Resolução 512
  String r192(BuildContext context) {
    switch (Theme.of(context).brightness.name) {
      case "dark":
        return "assets/imagens/logos/noronha_ecotech/noronha_ecotech_192_dark.png";
      default:
        return "assets/imagens/logos/noronha_ecotech/noronha_ecotech_192_light.png";
    }
  }
}
