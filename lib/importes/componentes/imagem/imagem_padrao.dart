import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

// ----------------------------------------------------------------------------- Componentes Imagem Padrão
class $ComImagemPadrao extends StatelessWidget {
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
  Widget build(BuildContext context) {
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

    Widget imagemIndisponivel(StateSetter atualizar) => GestureDetector(
          onTap: (aoTocar != null)
              ? () => atualizar(() => efeitoToque = true)
              : null,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            curve: Curves.linear,
            opacity: (efeitoToque) ? 0.5 : 1.0,
            onEnd: () => atualizar(() {
              efeitoToque = false;
              if (aoTocar != null) aoTocar!();
            }),
            child: MouseRegion(
              cursor: (aoTocar != null)
                  ? SystemMouseCursors.click
                  : MouseCursor.defer,
              child: Image.asset(
                Estilos.imagem.icones.golfinho,
                width: largura,
                height: altura,
                fit: ajuste ?? BoxFit.cover,
                alignment: alinhamento ?? Alignment.center,
                repeat: repetirImagem ?? ImageRepeat.noRepeat,
                color: Theme.of(context).primaryColor,
                cacheWidth: cacheLargura,
                cacheHeight: cacheAltura,
              ),
            ),
          ),
        );

    Widget imagemExterna(StateSetter atualizar) => GestureDetector(
          onTap: (aoTocar != null)
              ? () => atualizar(() => efeitoToque = true)
              : null,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            curve: Curves.linear,
            opacity: (efeitoToque) ? 0.5 : 1.0,
            onEnd: () => atualizar(() {
              efeitoToque = false;
              if (aoTocar != null) aoTocar!();
            }),
            child: MouseRegion(
              cursor: (aoTocar != null)
                  ? SystemMouseCursors.click
                  : MouseCursor.defer,
              child: Image.network(
                imagem,
                width: largura,
                height: altura,
                fit: ajuste ?? BoxFit.cover,
                alignment: alinhamento ?? Alignment.center,
                repeat: repetirImagem ?? ImageRepeat.noRepeat,
                color: corImagem,
                cacheWidth: cacheLargura,
                cacheHeight: cacheAltura,
                errorBuilder: (context, erro, dados) {
                  return imagemIndisponivel(atualizar);
                },
                loadingBuilder: carregamento ??
                    (context, imagem, dados) {
                      if (dados == null) {
                        return imagem;
                      } else {
                        final total = dados.expectedTotalBytes;
                        final atual = dados.cumulativeBytesLoaded;
                        final progresso =
                            (total != null) ? (atual / total) : null;
                        return Container(
                          width: largura,
                          height: altura,
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

    Widget imagemInterna(StateSetter atualizar) => GestureDetector(
          onTap: (aoTocar != null)
              ? () => atualizar(() => efeitoToque = true)
              : null,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            curve: Curves.linear,
            opacity: (efeitoToque) ? 0.5 : 1.0,
            onEnd: () => atualizar(() {
              efeitoToque = false;
              if (aoTocar != null) aoTocar!();
            }),
            child: MouseRegion(
              cursor: (aoTocar != null)
                  ? SystemMouseCursors.click
                  : MouseCursor.defer,
              child: Image.asset(
                imagem,
                width: largura,
                height: altura,
                fit: ajuste ?? BoxFit.cover,
                alignment: alinhamento ?? Alignment.center,
                repeat: repetirImagem ?? ImageRepeat.noRepeat,
                color: corImagem,
                cacheWidth: cacheLargura,
                cacheHeight: cacheAltura,
                errorBuilder: (context, erro, dados) {
                  return imagemIndisponivel(atualizar);
                },
              ),
            ),
          ),
        );

    return Componentes.pagina.construtora(
      estadoInicial: () => tipoImagem = verificarTipoImagem(imagem),
      estadoAlterado: (objeto) => tipoImagem = verificarTipoImagem(imagem),
      construtor: (context, atualizar) {
        try {
          switch (tipoImagem) {
            case 1:
              return imagemExterna(atualizar);
            case 2:
              return imagemInterna(atualizar);
            default:
              throw "Indisponível";
          }
        } catch (erro) {
          return imagemIndisponivel(atualizar);
        }
      },
    );
  }
}
