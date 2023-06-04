import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Controlador Senha
class ControladorSenha extends ChangeNotifier {
  late TextEditingController _controlador;
  final String? textoInicial;
  final regexSenha = RegExp(r'([A-ZÁ-Ú]+)|([a-zá-ú]+)|([0-9]+)|(\W+)');

  ControladorSenha({
    this.textoInicial = "",
  }) {
    _controlador = TextEditingController(text: textoInicial);
  }
  //////////////////////////////////////////////////////////////////////////////
  TextEditingController get instancia => _controlador;
  String get senha => _controlador.text;
  set senha(String senha) => _controlador.text = senha;
  TextEditingValue get valor => _controlador.value;
  int get tamanho => _controlador.text.length;
  TextSelection get selecao => _controlador.selection;
  void get limparComposicao => _controlador.clearComposing;
  void get limpar => _controlador.clear;
  AcaoObservardor get adicionarObservador => _controlador.addListener;
  AcaoObservardor get romoverObservador => _controlador.removeListener;
  bool get observando => _controlador.hasListeners;
  void get descartar => _controlador.dispose;

  ValidacaoSenha get validarSenha {
    if (regexSenha.hasMatch(_controlador.text)) {
      final validacao = regexSenha.allMatches(_controlador.text);
      ValidacaoSenha retorno = ValidacaoSenha(validacao);
      return retorno;
    } else {
      return ValidacaoSenha.invalida;
    }
  }
}
