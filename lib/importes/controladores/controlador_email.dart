import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Controlador Email
class ControladorEmail extends ChangeNotifier {
  late TextEditingController _controlador;
  final String? textoInicial;
  final regexEmail = RegExp(r'^([\w.-_]+)@+\w+((\.+\w{2,3}){1,2})$');

  ControladorEmail({
    this.textoInicial = "",
  }) {
    _controlador = TextEditingController(text: textoInicial);
  }
  //////////////////////////////////////////////////////////////////////////////
  TextEditingController get instancia => _controlador;
  String get email => _controlador.text;
  set email(String email) => _controlador.text = email;
  TextEditingValue get valor => _controlador.value;
  int get tamanho => _controlador.text.length;
  TextSelection get selecao => _controlador.selection;
  bool get validarEmail => regexEmail.hasMatch(_controlador.text);
  void get limparComposicao => _controlador.clearComposing;
  void get limpar => _controlador.clear;
  AcaoObservardor get adicionarObservador => _controlador.addListener;
  AcaoObservardor get romoverObservador => _controlador.removeListener;
  bool get observando => _controlador.hasListeners;
  void get descartar => _controlador.dispose;
}
