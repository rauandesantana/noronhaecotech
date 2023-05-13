import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

class $ComDialogoMensagem extends StatefulWidget {
  final String titulo;
  final String texto;
  final String? tituloBotaoPrimario;
  final String? tituloBotaoSecundario;
  final String? tituloBotaoNeutro;
  final VoidCallback acaoBotaoPrimario;
  final VoidCallback? acaoBotaoSecundario;
  final VoidCallback? acaoBotaoNeutro;

  const $ComDialogoMensagem({
    Key? key,
    required this.titulo,
    required this.texto,
    required this.tituloBotaoPrimario,
    required this.tituloBotaoSecundario,
    required this.tituloBotaoNeutro,
    required this.acaoBotaoPrimario,
    required this.acaoBotaoSecundario,
    required this.acaoBotaoNeutro,
  }) : super(key: key);

  @override
  State<$ComDialogoMensagem> createState() => _$ComDialogoMensagemState();
}

class _$ComDialogoMensagemState extends State<$ComDialogoMensagem> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            constraints: const BoxConstraints(
              maxWidth: 600,
              minWidth: 300,
              maxHeight: 800,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Componentes.texto.padrao(
                  texto: widget.texto,
                  estilo: Estilos.texto.normal(
                    tamanho: 14,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Wrap(
                  alignment: WrapAlignment.spaceAround,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Componentes.botao.elevado(
                      aoPrecionar: widget.acaoBotaoPrimario,
                      titulo: widget.tituloBotaoPrimario ??
                          Idiomas.of(context).tituloBotaoAceitar,
                    ),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    (widget.acaoBotaoSecundario != null)
                        ? Componentes.botao.borda(
                            aoPrecionar: widget.acaoBotaoSecundario,
                            titulo: widget.tituloBotaoSecundario ??
                                Idiomas.of(context).tituloBotaoCancelar,
                          )
                        : const SizedBox(width: 0, height: 0),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    (widget.acaoBotaoNeutro != null)
                        ? Componentes.botao.texto(
                            aoPrecionar: widget.acaoBotaoNeutro,
                            titulo: widget.tituloBotaoNeutro ??
                                Idiomas.of(context).tituloBotaoSaibaMais,
                          )
                        : const SizedBox(width: 0, height: 0),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 13, 20, 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Componentes.texto.padrao(
                texto: widget.titulo,
                estilo: Estilos.texto.titulo(
                  context: context,
                  corTexto: Theme.of(context).scaffoldBackgroundColor,
                  escala: 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
