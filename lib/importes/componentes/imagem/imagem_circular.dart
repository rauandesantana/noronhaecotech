import 'package:flutter/material.dart';
import 'package:noronhaecotech/importar_componentes.dart';

// ----------------------------------------------------------------------------- Componentes Imagem Arredondada
class $ComImagemCircular extends StatelessWidget {
  final String imagem;
  final double? diametro;
  final BoxFit? ajuste;
  final AlignmentGeometry? alinhamento;
  final ImageRepeat? repetirImagem;
  final Color? corImagem;
  final int? cacheDiametro;
  final ImageLoadingBuilder? carregamento;
  final VoidCallback? aoTocar;
  final BorderRadius? arredondarBorda;

  const $ComImagemCircular({
    required Key? chave,
    required this.imagem,
    required this.diametro,
    required this.ajuste,
    required this.alinhamento,
    required this.repetirImagem,
    required this.corImagem,
    required this.cacheDiametro,
    required this.carregamento,
    required this.aoTocar,
    required this.arredondarBorda,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Componentes.imagem.padrao(
        imagem: imagem,
        largura: diametro,
        altura: diametro,
        ajuste: ajuste,
        alinhamento: alinhamento,
        repetirImagem: repetirImagem,
        corImagem: corImagem,
        cacheLargura: cacheDiametro,
        cacheAltura: cacheDiametro,
        carregamento: carregamento,
        aoTocar: aoTocar,
      ),
    );
  }
}
