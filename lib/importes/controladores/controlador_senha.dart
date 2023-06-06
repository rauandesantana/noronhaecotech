import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Controlador Senha
class ControladorSenha {
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
  void limpar() => _controlador.clear();

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
