import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

// ----------------------------------------------------------------------------- Componentes Imagem Arredondada
class $ComImagemArredondada extends StatelessWidget {
  final String imagem;
  final double? largura;
  final double? altura;
  final BoxFit? ajuste;
  final AlignmentGeometry? alinhamento;
  final ImageRepeat? repetirImagem;
  final Color? corImagem;
  final int? cacheLargura;
  final int? cacheAltura;
  final ImageLoadingBuilder? carregamento;
  final VoidCallback? aoTocar;
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
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: arredondarBorda ?? BorderRadius.circular(25),
      child: Componentes.imagem.padrao(
        imagem: imagem,
        largura: largura,
        altura: altura,
        ajuste: ajuste,
        alinhamento: alinhamento,
        repetirImagem: repetirImagem,
        corImagem: corImagem,
        cacheLargura: cacheLargura,
        cacheAltura: cacheAltura,
        carregamento: carregamento,
        aoTocar: aoTocar,
      ),
    );
  }
}
