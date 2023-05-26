import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

// ----------------------------------------------------------------------------- Componentes Texto Padrão
class $ComTextoPadrao extends StatelessWidget {
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

  const $ComTextoPadrao({
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
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: estilo ?? Estilos.texto.normal(),
      strutStyle: estiloEscorar,
      textAlign: alinhamento ?? TextAlign.justify,
      textDirection: direcao,
      locale: localidade,
      softWrap: envolverFlexivel,
      overflow: transbordar,
      textScaleFactor: fatorEscala,
      maxLines: maxLinhas,
      semanticsLabel: textoSemantico,
      textWidthBasis: baseLargura,
      textHeightBehavior: comportamentoAltura,
      selectionColor: corSelecao,
    );
  }
}
