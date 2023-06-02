import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Componentes Texto Campo Email
class $ComTextoCampoEmail extends StatefulWidget {
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
  State<$ComTextoCampoEmail> createState() => _$ComTextoCampoEmailState();
}

class _$ComTextoCampoEmailState extends State<$ComTextoCampoEmail> {
  String? textoErro;

  @override
  void initState() {
    widget.controlador?.adicionarObservador(() => setState(() {
      final validarEmail = widget.controlador?.validarEmail;
      textoErro = (validarEmail == true) ? null : "";
    }));
    super.initState();
  }

  @override
  void dispose() {
    widget.controlador?.removeListener(() { });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Componentes.texto.campoPadrao(
      habilitado: widget.habilitado,
      bloqueado: widget.bloqueado,
      ocultarTexto: false,
      botaoLimpar: widget.botaoLimpar,
      controlador: widget.controlador?.instancia,
      foco: widget.foco,
      autoFoco: widget.autoFoco,
      tipoTeclado: widget.tipoTeclado ?? TextInputType.emailAddress,
      capitalizacao: TextCapitalization.none,
      acaoBotaoTeclado: widget.acaoBotaoTeclado,
      textoTitulo: widget.textoTitulo ?? Idiomas.of(context).tituloEmail,
      textoAjuda: widget.textoAjuda,
      textoErro: widget.textoErro ?? textoErro,
      textoDica: widget.textoDica,
      textoPrefixo: widget.textoPrefixo,
      textoSufixo: widget.textoSufixo,
      componenteExterno: widget.componenteExterno,
      componentePrefixo: Componentes.icone.padrao(
        iconePrimario: widget.iconePrefixo ?? Icons.email_rounded,
      ),
      componenteSufixo: widget.componenteSufixo,
      menuTexto: widget.menuTexto,
    );
  }
}
