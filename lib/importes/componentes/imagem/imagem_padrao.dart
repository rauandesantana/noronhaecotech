import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Componentes Imagem Padrão
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
    required Key? chave,
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
  }) : super(key: chave);

  @override
  State<$ComImagemPadrao> createState() => _$ComImagemPadraoState();
}

class _$ComImagemPadraoState extends State<$ComImagemPadrao> {
  int tipoImagem = 0;
  bool efeitoToque = false;

  int verificarTipoImagem(String imagem) {
    if (imagem.startsWith(RegExp(r"https?://"))) {
      return 1;
    } else if (imagem.startsWith("assets/imagens/")) {
      return 2;
    } else {
      return 0;
    }
  }

  @override
  void initState() {
    tipoImagem = verificarTipoImagem(widget.imagem);
    super.initState();
  }

  @override
  void didUpdateWidget($ComImagemPadrao oldWidget) {
    tipoImagem = verificarTipoImagem(widget.imagem);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    late Widget imagemRetorno;
    final Widget imagemIndisponivel = Image.asset(
      Estilos.imagem.icones.golfinho,
      width: widget.largura,
      height: widget.altura,
      fit: widget.ajuste ?? BoxFit.cover,
      alignment: widget.alinhamento ?? Alignment.center,
      repeat: widget.repetirImagem ?? ImageRepeat.noRepeat,
      color: Theme.of(context).primaryColor,
      cacheWidth: widget.cacheLargura,
      cacheHeight: widget.cacheAltura,
    );

    final Widget imagemExterna = Image.network(
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
              final progresso = (total != null) ? (atual / total) : null;
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
    );

    final Widget imagemInterna = Image.asset(
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
    );

    try {
      switch (tipoImagem) {
        case 1:
          imagemRetorno = imagemExterna;
          break;
        case 2:
          imagemRetorno = imagemInterna;
          break;
        default:
          throw "Indisponível";
      }
    } catch (erro) {
      imagemRetorno = imagemIndisponivel;
    }

    return GestureDetector(
      onTap: (widget.aoTocar == null)
          ? null
          : () {
              setState(() => efeitoToque = true);
              widget.aoTocar!();
            },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
        opacity: (efeitoToque) ? 0.5 : 1.0,
        onEnd: () => setState(() => efeitoToque = false),
        child: MouseRegion(
          cursor: (widget.aoTocar == null)
              ? MouseCursor.defer
              : SystemMouseCursors.click,
          child: imagemRetorno,
        ),
      ),
    );
  }
}
