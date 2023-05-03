import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

class $ComTextoCampoEmail extends StatefulWidget {
  final bool? habilitado;
  final bool? bloqueado;
  final bool? botaoLimpar;
  final TextEditingController? controlador;
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
    Key? key,
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
  }) : super(key: key);

  @override
  State<$ComTextoCampoEmail> createState() => _$ComTextoCampoEmailState();
}

class _$ComTextoCampoEmailState extends State<$ComTextoCampoEmail> {
  @override
  Widget build(BuildContext context) {
   return Componentes.texto.campoPadrao(
     habilitado: widget.habilitado,
     bloqueado: widget.bloqueado,
     ocultarTexto: false,
     botaoLimpar: widget.botaoLimpar,
     controlador: widget.controlador,
     foco: widget.foco,
     autoFoco: widget.autoFoco,
     tipoTeclado: widget.tipoTeclado ?? TextInputType.emailAddress,
     capitalizacao: TextCapitalization.none,
     acaoBotaoTeclado: widget.acaoBotaoTeclado,
     textoTitulo:
     widget.textoTitulo ?? Idiomas.of(context).tituloTextoCampoEmail,
     textoAjuda: widget.textoAjuda,
     textoErro: widget.textoErro,
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
