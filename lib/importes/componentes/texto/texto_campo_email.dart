import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Componentes Texto Campo Email
class $ComTextoCampoEmail extends StatelessWidget {
  final bool? habilitado;
  final bool? bloqueado;
  final bool? botaoLimpar;
  final bool? autoValidar;
  final ControladorEmail? controlador;
  final FocusNode? foco;
  final bool? autoFoco;
  final TextInputType? tipoTeclado;
  final TextInputAction? acaoBotaoTeclado;
  final List<TextInputFormatter>? formatacao;
  final String? textoTitulo;
  final String? textoAjuda;
  final String? textoErro;
  final String? textoDica;
  final String? textoPrefixo;
  final String? textoSufixo;
  final Widget? componenteExterno;
  final IconData? iconePrefixo;
  final Widget? componenteSufixo;
  final void Function(String)? aoMudar;
  final String? Function(String)? aoValidar;
  final EditableTextContextMenuBuilder? menuTexto;

  const $ComTextoCampoEmail({
    required Key? chave,
    required this.habilitado,
    required this.bloqueado,
    required this.botaoLimpar,
    required this.autoValidar,
    required this.controlador,
    required this.foco,
    required this.autoFoco,
    required this.tipoTeclado,
    required this.acaoBotaoTeclado,
    required this.formatacao,
    required this.textoTitulo,
    required this.textoAjuda,
    required this.textoErro,
    required this.textoDica,
    required this.textoPrefixo,
    required this.textoSufixo,
    required this.componenteExterno,
    required this.iconePrefixo,
    required this.componenteSufixo,
    required this.aoMudar,
    required this.aoValidar,
    required this.menuTexto,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    return Componentes.texto.campoPadrao(
      habilitado: habilitado,
      bloqueado: bloqueado,
      ocultarTexto: false,
      botaoLimpar: botaoLimpar,
      controlador: controlador?.instancia,
      foco: foco,
      autoFoco: autoFoco,
      tipoTeclado: tipoTeclado ?? TextInputType.emailAddress,
      capitalizacao: TextCapitalization.none,
      acaoBotaoTeclado: acaoBotaoTeclado,
      textoTitulo: textoTitulo ?? Idiomas.current.tituloEmail,
      textoAjuda: textoAjuda,
      textoErro: textoErro,
      textoDica: textoDica,
      textoPrefixo: textoPrefixo,
      textoSufixo: textoSufixo,
      componenteExterno: componenteExterno,
      componentePrefixo: Componentes.icone.padrao(
        iconePrimario: iconePrefixo ?? Icons.email_rounded,
      ),
      componenteSufixo: componenteSufixo,
      menuTexto: menuTexto,
      aoMudar: aoMudar,
      aoValidar: (autoValidar == true || aoValidar != null)
          ? (valorEmail) {
              if (controlador != null) {
                final validarEmail = controlador!.validarEmail;
                if (valorEmail.isEmpty) {
                  return Idiomas.current.textoCampoObrigatorio;
                } else if (validarEmail != true) {
                  return Idiomas.current.textoInformeEmailValido;
                } else if (aoValidar != null) {
                  return aoValidar!(valorEmail);
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
