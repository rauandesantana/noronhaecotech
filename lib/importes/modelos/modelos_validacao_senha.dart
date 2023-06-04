// ----------------------------------------------------------------------------- Validação Senha
class ValidacaoSenha {
  final Iterable<RegExpMatch> validacao;
  bool _letasMaisculas = false;
  bool _letasMinusculas = false;
  bool _digitosNumericos = false;
  bool _caracteresEspeciais = false;

  ValidacaoSenha(this.validacao) {
    if (validacao.isNotEmpty) {
      for (var validacao in validacao) {
        if ((validacao.group(1) != null) != false) _letasMaisculas = true;
        if ((validacao.group(2) != null) != false) _letasMinusculas = true;
        if ((validacao.group(3) != null) != false) _digitosNumericos = true;
        if ((validacao.group(4) != null) != false) _caracteresEspeciais = true;
      }
    }
  }
  //////////////////////////////////////////////////////////////////////////////
  static ValidacaoSenha get invalida => ValidacaoSenha(const Iterable.empty());

  bool get letasMaisculas => _letasMaisculas;
  bool get letasMinusculas => _letasMinusculas;
  bool get digitosNumericos => _digitosNumericos;
  bool get caracteresEspeciais => _caracteresEspeciais;
}
