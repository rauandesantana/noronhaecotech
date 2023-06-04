import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Componentes Texto Campo Email
class $ComTextoCampoEmail extends StatelessWidget {
  final bool? habilitado;
  final bool? bloqueado;
  final bool? botaoLimpar;
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
  final EditableTextContextMenuBuilder? menuTexto;

  const $ComTextoCampoEmail({
    required Key? chave,
    required this.habilitado,
    required this.bloqueado,
    required this.botaoLimpar,
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
        textoTitulo: textoTitulo ?? Idiomas.of(context).tituloEmail,
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
        aoValidar: (valorEmail) {
          if (controlador != null) {
            final validarEmail = controlador!.validarEmail;
            if (validarEmail != true) {
              return Idiomas.of(context).textoInformeEmailValido;
            }
            return null;
          } else {
            return null;
          }
        });
  }
}
