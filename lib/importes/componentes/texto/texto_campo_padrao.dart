import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

class $CompTextoCampoPadrao extends StatefulWidget {
  final bool? habilitado;
  final bool? bloqueado;
  final bool? ocultarTexto;
  final TextEditingController? controlador;
  final FocusNode? foco;
  final bool? autoFoco;
  final TextInputType? tipoTeclado;
  final TextCapitalization? capitalizacao;
  final TextInputAction? acaoBotaoTeclado;
  final int? linhasMax;
  final int? linhasMin;
  final List<TextInputFormatter>? formatacao;
  final InputDecoration? estilo;
  final TextStyle? estiloTexto;
  final IconData? iconeExterno;
  final String? textoTitulo;
  final String? textoAjuda;
  final String? textoErro;
  final String? textoDica;
  final Widget? componentePrefixo;
  final String? textoPrefixo;
  final Widget? componenteSufixo;
  final String? textoSufixo;

  const $CompTextoCampoPadrao({
    Key? key,
    required this.habilitado,
    required this.bloqueado,
    required this.ocultarTexto,
    required this.controlador,
    required this.foco,
    required this.autoFoco,
    required this.tipoTeclado,
    required this.capitalizacao,
    required this.acaoBotaoTeclado,
    required this.linhasMax,
    required this.linhasMin,
    required this.formatacao,
    required this.estilo,
    required this.estiloTexto,
    required this.iconeExterno,
    required this.textoTitulo,
    required this.textoAjuda,
    required this.textoErro,
    required this.textoDica,
    required this.componentePrefixo,
    required this.textoPrefixo,
    required this.componenteSufixo,
    required this.textoSufixo,
  }) : super(key: key);

  @override
  State<$CompTextoCampoPadrao> createState() => _$CompTextoCampoPadraoState();
}

class _$CompTextoCampoPadraoState extends State<$CompTextoCampoPadrao> {
  @override
  Widget build(BuildContext context) {
    final estiloPadrao = widget.estilo ??
        Estilos.texto.campo(
          context: context,
          iconeExterno: widget.iconeExterno,
          textoTitulo: widget.textoTitulo,
          textoAjuda: (widget.habilitado == false) ? null : widget.textoAjuda,
          textoErro: (widget.habilitado == false) ? null : widget.textoErro,
          textoDica: (widget.habilitado == false) ? null : widget.textoDica,
          componentePrefixo: widget.componentePrefixo,
          textoPrefixo: widget.textoPrefixo,
          componenteSufixo: widget.componenteSufixo,
          textoSufixo: widget.textoSufixo,
        );

    return TextFormField(
      enabled: widget.habilitado ?? true,
      readOnly: widget.bloqueado ?? false,
      obscureText: widget.ocultarTexto ?? false,
      controller: widget.controlador,
      focusNode: widget.foco,
      autofocus: widget.autoFoco ?? false,
      decoration: estiloPadrao,
      cursorColor: estiloPadrao.iconColor,
      cursorRadius: const Radius.circular(1),
      keyboardType: widget.tipoTeclado ?? TextInputType.text,
      textCapitalization: widget.capitalizacao ?? TextCapitalization.none,
      textInputAction: widget.acaoBotaoTeclado ?? TextInputAction.none,
      style: widget.estiloTexto ?? Estilos.texto.normal(tamanho: 16),
      contextMenuBuilder: Estilos.texto.selecao,
      maxLines: widget.linhasMax ?? 1,
      minLines: widget.linhasMin,
      inputFormatters: widget.formatacao,
    );
  }
}
