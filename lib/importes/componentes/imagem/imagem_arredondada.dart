import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

class $ComImagemArredondada extends StatefulWidget {
  final String imagem;
  final double? largura;
  final double? altura;
  final BoxFit? ajuste;
  final AlignmentGeometry? alinhamento;
  final ImageRepeat? repetirImagem;
  final Color? corImagem;
  final int? cacheLargura;
  final int? cacheAltura;
  final Widget Function(BuildContext, Widget, ImageChunkEvent?)? carregamento;
  final void Function()? aoTocar;
  final BorderRadius? arredondarBorda;
  
  const $ComImagemArredondada({
    Key? key,
    required this.imagem,
    required this.largura,
    required this.altura,
    required this.ajuste,
    required this.alinhamento,
    required this.repetirImagem,
    required this.corImagem,
    required this.cacheLargura,
    required this.cacheAltura,
    required this.carregamento,
    required this.aoTocar,
    required this.arredondarBorda,
  }) : super(key: key);

  @override
  State<$ComImagemArredondada> createState() => _$ComImagemArredondadaState();
}

class _$ComImagemArredondadaState extends State<$ComImagemArredondada> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.arredondarBorda ?? BorderRadius.circular(25),
      child: Componentes.imagem.padrao(
        imagem: widget.imagem,
        largura: widget.largura,
        altura: widget.altura,
        ajuste: widget.ajuste,
        alinhamento: widget.alinhamento,
        repetirImagem: widget.repetirImagem,
        corImagem: widget.corImagem,
        cacheLargura: widget.cacheLargura,
        cacheAltura: widget.cacheAltura,
        carregamento: widget.carregamento,
        aoTocar: widget.aoTocar,
      ),
    );
  }
}
