import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

class $ComTextoCampoPadrao extends StatefulWidget {
  final bool? habilitado;
  final bool? bloqueado;
  final bool? ocultarTexto;
  final bool? botaoLimpar;
  final TextEditingController controlador;
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
  final String? textoTitulo;
  final String? textoAjuda;
  final String? textoErro;
  final String? textoDica;
  final String? textoPrefixo;
  final String? textoSufixo;
  final Widget? componenteExterno;
  final Widget? componentePrefixo;
  final Widget? componenteSufixo;

  const $ComTextoCampoPadrao({
    Key? key,
    required this.habilitado,
    required this.bloqueado,
    required this.ocultarTexto,
    required this.botaoLimpar,
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
    required this.textoTitulo,
    required this.textoAjuda,
    required this.textoErro,
    required this.textoDica,
    required this.textoPrefixo,
    required this.textoSufixo,
    required this.componenteExterno,
    required this.componentePrefixo,
    required this.componenteSufixo,
  }) : super(key: key);

  @override
  State<$ComTextoCampoPadrao> createState() => _$ComTextoCampoPadraoState();
}

class _$ComTextoCampoPadraoState extends State<$ComTextoCampoPadrao> {
  bool ocultarTexto = false;

  @override
  void initState() {
    super.initState();
    widget.controlador.addListener(() => setState(() {}));
    ocultarTexto = widget.ocultarTexto ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final Widget? botaoVisualizarTexto = (widget.ocultarTexto != true)
        ? widget.componenteSufixo
        : Componentes.botao.icone(
            aoPrecionar: () => setState(
              () => ocultarTexto = !ocultarTexto,
            ),
            alternarIcone: ocultarTexto,
            iconePrimario: Icons.visibility_off_rounded,
            iconeSecundario: Icons.visibility_rounded,
          );

    final Widget? botaoLimparTexto = (widget.controlador.text.isEmpty)
        ? null
        : Componentes.botao.icone(
            aoPrecionar: () => widget.controlador.clear(),
            iconePrimario: Icons.clear_rounded,
          );

    final InputDecoration estiloPadrao = widget.estilo ??
        Estilos.texto.campo(
          context: context,
          textoTitulo: widget.textoTitulo,
          textoAjuda: (widget.habilitado == false) ? null : widget.textoAjuda,
          textoErro: (widget.habilitado == false) ? null : widget.textoErro,
          textoDica: (widget.habilitado == false) ? null : widget.textoDica,
          textoPrefixo: widget.textoPrefixo,
          textoSufixo: widget.textoSufixo,
          componenteExterno: widget.componenteExterno,
          componentePrefixo: widget.componentePrefixo,
          componenteSufixo: (widget.botaoLimpar == false)
              ? botaoVisualizarTexto
              : (widget.ocultarTexto != true && widget.componenteSufixo == null)
                  ? botaoLimparTexto
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      textDirection: TextDirection.rtl,
                      children: <Widget>[
                        botaoVisualizarTexto ?? Container(width: 0),
                        botaoLimparTexto ?? Container(width: 0),
                      ],
                    ),
        );

    return TextFormField(
      enabled: widget.habilitado ?? true,
      readOnly: widget.bloqueado ?? false,
      obscureText: ocultarTexto,
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
