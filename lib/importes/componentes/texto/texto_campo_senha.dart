import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Componentes Texto Campo Senha
class $ComTextoCampoSenha extends StatelessWidget {
  final bool? habilitado;
  final bool? bloqueado;
  final bool? botaoLimpar;
  final bool? tituloConfirmacao;
  final bool? autoValidar;
  final ControladorSenha? controlador;
  final FocusNode? foco;
  final bool? autoFoco;
  final TextInputType? tipoTeclado;
  final TextInputAction? acaoBotaoTeclado;
  final String? textoTitulo;
  final String? textoAjuda;
  final String? textoErro;
  final String? textoDica;
  final String? textoPrefixo;
  final String? textoSufixo;
  final IconData? iconePrefixo;
  final void Function(String)? aoMudar;
  final String? Function(String)? aoValidar;
  final EditableTextContextMenuBuilder? menuTexto;

  const $ComTextoCampoSenha({
    required Key? chave,
    required this.habilitado,
    required this.bloqueado,
    required this.botaoLimpar,
    required this.tituloConfirmacao,
    required this.autoValidar,
    required this.controlador,
    required this.foco,
    required this.autoFoco,
    required this.tipoTeclado,
    required this.acaoBotaoTeclado,
    required this.textoTitulo,
    required this.textoAjuda,
    required this.textoErro,
    required this.textoDica,
    required this.textoPrefixo,
    required this.textoSufixo,
    required this.iconePrefixo,
    required this.aoMudar,
    required this.aoValidar,
    required this.menuTexto,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    return Componentes.texto.campoPadrao(
      habilitado: habilitado,
      bloqueado: bloqueado,
      ocultarTexto: true,
      botaoLimpar: botaoLimpar,
      controlador: controlador?.instancia,
      foco: foco,
      autoFoco: autoFoco,
      tipoTeclado: tipoTeclado ?? TextInputType.visiblePassword,
      acaoBotaoTeclado: acaoBotaoTeclado,
      textoTitulo: (textoTitulo != null)
          ? textoTitulo
          : (tituloConfirmacao == true)
              ? Idiomas.of(context).tituloConfirmarSenha
              : Idiomas.of(context).tituloSenha,
      textoAjuda: textoAjuda,
      textoErro: textoErro,
      textoDica: textoDica,
      textoPrefixo: textoPrefixo,
      textoSufixo: textoSufixo,
      componentePrefixo: Componentes.icone.padrao(
        iconePrimario: iconePrefixo ?? Icons.password_rounded,
      ),
      menuTexto: menuTexto,
      aoMudar: aoMudar,
      aoValidar: (autoValidar == true || aoValidar != null)
          ? (valorSenha) {
              if (controlador != null) {
                final validarSenha = controlador!.validarSenha;
                if (valorSenha.isEmpty) {
                  return Idiomas.of(context).textoCampoObrigatorio;
                } else if (validarSenha.letasMaisculas != true) {
                  return Idiomas.of(context).textoSenhaLetrasMaiusculas;
                } else if (validarSenha.letasMinusculas != true) {
                  return Idiomas.of(context).textoSenhaLetrasMinusculas;
                } else if (validarSenha.digitosNumericos != true) {
                  return Idiomas.of(context).textoSenhaDigitosNumericos;
                } else if (validarSenha.caracteresEspeciais != true) {
                  return Idiomas.of(context).textoSenhaCaracteresEspeciais;
                } else if (valorSenha.length < 6) {
                  return Idiomas.of(context).textoSenhaTamanhoMinimo;
                } else if (aoValidar != null) {
                  return aoValidar!(valorSenha);
                } else {
                  return null;
                }
              } else {
                return null;
              }
            }
          : null,
    );
  }
}
