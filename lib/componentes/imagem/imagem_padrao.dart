import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

class $ComponentesImagemPadrao extends StatefulWidget {
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

  const $ComponentesImagemPadrao({
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
  }) : super(key: key);

  @override
  State<$ComponentesImagemPadrao> createState() =>
      _$ComponentesImagemPadraoState();
}

class _$ComponentesImagemPadraoState extends State<$ComponentesImagemPadrao> {
  int tipoImagem = 0;

  @override
  void initState() {
    super.initState();
    // ------------------------------------------------------------------------- Se o caminho for Web
    if (widget.imagem.startsWith(RegExp(r"https?://"))) {
      tipoImagem = 1;
    }
    // ------------------------------------------------------------------------- Se o caminho for Asset
    else if (widget.imagem.startsWith("assets/imagens/")) {
      tipoImagem = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ------------------------------------------------------------------------- Imagem Indisponível
    Widget imagemIndisponivel = Image.asset(
      "assets/imagens/icones/golfinho.png",
      width: widget.largura,
      height: widget.altura,
      fit: widget.ajuste,
      alignment: widget.alinhamento ?? Alignment.center,
      repeat: widget.repetirImagem ?? ImageRepeat.noRepeat,
      color: Theme.of(context).primaryColor,
      cacheWidth: widget.cacheLargura,
      cacheHeight: widget.cacheAltura,
    );

    try {
      switch (tipoImagem) {
        // --------------------------------------------------------------------- Imagem Web
        case 1:
          return Image.network(
            widget.imagem,
            width: widget.largura,
            height: widget.altura,
            fit: widget.ajuste,
            alignment: widget.alinhamento ?? Alignment.center,
            repeat: widget.repetirImagem ?? ImageRepeat.noRepeat,
            color: widget.corImagem,
            cacheWidth: widget.cacheLargura,
            cacheHeight: widget.cacheAltura,
            errorBuilder: (context, erro, dados) => imagemIndisponivel,
            loadingBuilder: widget.carregamento ??
                (context, imagem, dados) {
                  if (dados == null) {
                    return imagem;
                  } else {
                    final total = dados.expectedTotalBytes;
                    final atual = dados.cumulativeBytesLoaded;
                    final progresso = (total != null) ? (atual / total) : null;
                    return SizedBox(
                      width: widget.largura,
                      height: widget.altura,
                      child: Center(
                        child: Componentes.carregamento.circular(
                          valor: progresso,
                        ),
                      ),
                    );
                  }
                },
          );
        // --------------------------------------------------------------------- Imagem Asset
        case 2:
          return Image.asset(
            widget.imagem,
            width: widget.largura,
            height: widget.altura,
            fit: widget.ajuste,
            alignment: widget.alinhamento ?? Alignment.center,
            repeat: widget.repetirImagem ?? ImageRepeat.noRepeat,
            color: widget.corImagem,
            cacheWidth: widget.cacheLargura,
            cacheHeight: widget.cacheAltura,
            errorBuilder: (context, erro, dados) => imagemIndisponivel,
          );
        // --------------------------------------------------------------------- Não Identificado
        default:
          throw "Indisponível";
      }
    } catch (erro) {
      // ----------------------------------------------------------------------- Retorno em caso de Erro
      return imagemIndisponivel;
    }
  }
}
