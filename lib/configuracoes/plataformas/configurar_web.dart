import 'dart:html' show window;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ----------------------------------------------------------------------------- Configurações
void configuracoesPlataforma() {
  setUrlStrategy(PathUrlStrategy());
}

// ----------------------------------------------------------------------------- Plataforma Web
String plataformaWeb = window.navigator.userAgent;
