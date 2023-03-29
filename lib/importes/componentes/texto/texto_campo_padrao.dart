import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

class $ComTextoCampoPadrao extends StatefulWidget {
  final bool? habilitado;
  final bool? bloqueado;
  final bool? ocultarTexto;
  final bool? botaoLimpar;
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
  State<$ComTextoCampoPadrao> createState() => _$ComTextoCampoPadraoState();
}

class _$ComTextoCampoPadraoState extends State<$ComTextoCampoPadrao> {
  bool ocultarTexto = false;

  @override
  void initState() {
    super.initState();
    widget.controlador?.addListener(() => setState(() {}));
    (widget.ocultarTexto == true) ? ocultarTexto = true : null;
  }

  @override
  Widget build(BuildContext context) {
    bool conteudoVazio = widget.controlador?.text.isEmpty ?? true;
    bool ocultarTextoAtivo = widget.ocultarTexto != true;
    bool botaoLimparAtivo =
        widget.botaoLimpar == false || widget.controlador == null;

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
          componenteSufixo: (botaoLimparAtivo)
              ? (ocultarTextoAtivo)
                  ? widget.componenteSufixo
                  : Componentes.botao.icone(
                      aoPrecionar: () => setState(
                        () => ocultarTexto = !ocultarTexto,
                      ),
                      alternarIcone: ocultarTexto,
                      iconePrimario: Icons.visibility_off_rounded,
                      iconeSecundario: Icons.visibility_rounded,
                    )
              : (ocultarTextoAtivo && conteudoVazio)
                  ? null
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      textDirection: TextDirection.rtl,
                      children: <Widget>[
                        (ocultarTextoAtivo)
                            ? widget.componenteSufixo ?? Container(width: 0)
                            : Componentes.botao.icone(
                                aoPrecionar: () => setState(
                                  () => ocultarTexto = !ocultarTexto,
                                ),
                                alternarIcone: ocultarTexto,
                                iconePrimario: Icons.visibility_off_rounded,
                                iconeSecundario: Icons.visibility_rounded,
                              ),
                        (conteudoVazio)
                            ? Container(width: 0)
                            : Componentes.botao.icone(
                                aoPrecionar: () => widget.controlador?.clear(),
                                iconePrimario: Icons.clear_rounded,
                              ),
                      ],
                    ),
          textoSufixo: widget.textoSufixo,
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
