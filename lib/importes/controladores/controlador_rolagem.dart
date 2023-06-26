import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Controlador Rolagem
class ControladorRolagem extends ChangeNotifier {
  late ScrollController _controlador;

  ControladorRolagem() {
    _controlador = ScrollController();
  }
  //////////////////////////////////////////////////////////////////////////////
ScrollController get instancia => _controlador;
}