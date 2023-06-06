import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Controlador Senha
class ControladorNome extends ChangeNotifier {
  late TextEditingController _controlador;
  final String? textoInicial;

  ControladorNome({
    this.textoInicial = "",
  }) {
    _controlador = TextEditingController(text: textoInicial);
  }
  //////////////////////////////////////////////////////////////////////////////
  TextEditingController get instancia => _controlador;
  String get nome => _controlador.text;
  set nome(String nome) => _controlador.text = nome;
  TextEditingValue get valor => _controlador.value;
  int get tamanho => _controlador.text.length;
  TextSelection get selecao => _controlador.selection;
  void limpar() => _controlador.clear();
}
