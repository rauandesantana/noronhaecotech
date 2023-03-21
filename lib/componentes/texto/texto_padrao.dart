import 'package:flutter/material.dart';

class $ComponetesTextoPadrao extends StatefulWidget {
  final String texto;
  final TextStyle? estilo;
  final StrutStyle? estiloEscorar;
  final TextAlign? alinhamento;
  final TextDirection? direcao;
  final Locale? localidade;
  final bool? envolverFlexivel;
  final TextOverflow? transbordar;
  final double? fatorEscala;
  final int? maxLinhas;
  final String? textoSemantico;
  final TextWidthBasis? baseLargura;
  final TextHeightBehavior? comportamentoAltura;
  final Color? corSelecao;
  const $ComponetesTextoPadrao({
    Key? key,
    required this.texto,
    required this.estilo,
    required this.estiloEscorar,
    required this.alinhamento,
    required this.direcao,
    required this.localidade,
    required this.envolverFlexivel,
    required this.transbordar,
    required this.fatorEscala,
    required this.maxLinhas,
    required this.textoSemantico,
    required this.baseLargura,
    required this.comportamentoAltura,
    required this.corSelecao,
  }) : super(key: key);

  @override
  State<$ComponetesTextoPadrao> createState() => _$ComponetesTextoPadraoState();
}

class _$ComponetesTextoPadraoState extends State<$ComponetesTextoPadrao> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.texto,
      style: widget.estilo,
      strutStyle: widget.estiloEscorar,
      textAlign: widget.alinhamento,
      textDirection: widget.direcao,
      locale: widget.localidade,
      softWrap: widget.envolverFlexivel,
      overflow: widget.transbordar,
      textScaleFactor: widget.fatorEscala,
      maxLines: widget.maxLinhas,
      semanticsLabel: widget.textoSemantico,
      textWidthBasis: widget.baseLargura,
      textHeightBehavior: widget.comportamentoAltura,
      selectionColor: widget.corSelecao,
    );
  }
}
