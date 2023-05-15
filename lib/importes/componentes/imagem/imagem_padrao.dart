import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

class $ComImagemPadrao extends StatefulWidget {
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

  const $ComImagemPadrao({
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
  }) : super(key: key);

  @override
  State<$ComImagemPadrao> createState() => _$ComImagemPadraoState();
}

class _$ComImagemPadraoState extends State<$ComImagemPadrao> {
  int tipoImagem = 0;
  bool efeitoToque = false;

  int verificarTipoImagem(String imagem) {
    // ------------------------------------------------------------------------- Se o caminho for Web
    if (imagem.startsWith(RegExp(r"https?://"))) {
      return 1;
    }
    // ------------------------------------------------------------------------- Se o caminho for Asset
    else if (imagem.startsWith("assets/imagens/")) {
      return 2;
    }
    // ------------------------------------------------------------------------- Se Não
    else {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    tipoImagem = verificarTipoImagem(widget.imagem);
  }

  @override
  void didUpdateWidget($ComImagemPadrao oldWidget) {
    super.didUpdateWidget(oldWidget);
    tipoImagem = verificarTipoImagem(widget.imagem);
  }

  @override
  Widget build(BuildContext context) {
    // ------------------------------------------------------------------------- Imagem Indisponível
    Widget imagemIndisponivel = GestureDetector(
      onTap: (widget.aoTocar != null)
          ? () => setState(() => efeitoToque = true)
          : null,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
        opacity: (efeitoToque) ? 0.5 : 1.0,
        onEnd: () => setState(() {
          efeitoToque = false;
          if (widget.aoTocar != null) widget.aoTocar!();
        }),
        child: MouseRegion(
          cursor: (widget.aoTocar != null)
              ? SystemMouseCursors.click
              : MouseCursor.defer,
          child: Image.asset(
            Estilos.imagem.icones.golfinho,
            width: widget.largura,
            height: widget.altura,
            fit: widget.ajuste ?? BoxFit.cover,
            alignment: widget.alinhamento ?? Alignment.center,
            repeat: widget.repetirImagem ?? ImageRepeat.noRepeat,
            color: Theme.of(context).primaryColor,
            cacheWidth: widget.cacheLargura,
            cacheHeight: widget.cacheAltura,
          ),
        ),
      ),
    );

    try {
      switch (tipoImagem) {
        // --------------------------------------------------------------------- Imagem Web
        case 1:
          return GestureDetector(
            onTap: (widget.aoTocar != null)
                ? () => setState(() => efeitoToque = true)
                : null,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear,
              opacity: (efeitoToque) ? 0.5 : 1.0,
              onEnd: () => setState(() {
                efeitoToque = false;
                if (widget.aoTocar != null) widget.aoTocar!();
              }),
              child: MouseRegion(
                cursor: (widget.aoTocar != null)
                    ? SystemMouseCursors.click
                    : MouseCursor.defer,
                child: Image.network(
                  widget.imagem,
                  width: widget.largura,
                  height: widget.altura,
                  fit: widget.ajuste ?? BoxFit.cover,
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
                          final progresso =
                              (total != null) ? (atual / total) : null;
                          return Container(
                            width: widget.largura,
                            height: widget.altura,
                            constraints: const BoxConstraints(
                              maxWidth: 100,
                              maxHeight: 100,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: Center(
                              child: Componentes.carregamento.circular(
                                valor: progresso,
                              ),
                            ),
                          );
                        }
                      },
                ),
              ),
            ),
          );
        // --------------------------------------------------------------------- Imagem Asset
        case 2:
          return GestureDetector(
            onTap: (widget.aoTocar != null)
                ? () => setState(() => efeitoToque = true)
                : null,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear,
              opacity: (efeitoToque) ? 0.5 : 1.0,
              onEnd: () => setState(() {
                efeitoToque = false;
                if (widget.aoTocar != null) widget.aoTocar!();
              }),
              child: MouseRegion(
                cursor: (widget.aoTocar != null)
                    ? SystemMouseCursors.click
                    : MouseCursor.defer,
                child: Image.asset(
                  widget.imagem,
                  width: widget.largura,
                  height: widget.altura,
                  fit: widget.ajuste ?? BoxFit.cover,
                  alignment: widget.alinhamento ?? Alignment.center,
                  repeat: widget.repetirImagem ?? ImageRepeat.noRepeat,
                  color: widget.corImagem,
                  cacheWidth: widget.cacheLargura,
                  cacheHeight: widget.cacheAltura,
                  errorBuilder: (context, erro, dados) => imagemIndisponivel,
                ),
              ),
            ),
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
