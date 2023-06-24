import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Componentes Dialogo Mensagem
class $ComDialogoMensagem extends StatelessWidget {
  final String titulo;
  final String texto;
  final String? tituloBotaoPrimario;
  final String? tituloBotaoSecundario;
  final String? tituloBotaoNeutro;
  final VoidCallback acaoBotaoPrimario;
  final VoidCallback? acaoBotaoSecundario;
  final VoidCallback? acaoBotaoNeutro;

  const $ComDialogoMensagem({
    required Key? chave,
    required this.titulo,
    required this.texto,
    required this.tituloBotaoPrimario,
    required this.tituloBotaoSecundario,
    required this.tituloBotaoNeutro,
    required this.acaoBotaoPrimario,
    required this.acaoBotaoSecundario,
    required this.acaoBotaoNeutro,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    return Componentes.dialogo.padrao(
      titulo: titulo,
      conteudo: (context, atualizar) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Componentes.texto.padrao(
              texto: texto,
              estilo: Estilos.texto.normal(tamanho: 14),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Componentes.botao.elevado(
                  aoPrecionar: acaoBotaoPrimario,
                  titulo: tituloBotaoPrimario ?? Idiomas.current.tituloAceitar,
                ),
                const Padding(padding: EdgeInsets.only(left: 10)),
                (acaoBotaoSecundario != null)
                    ? Componentes.botao.borda(
                        aoPrecionar: acaoBotaoSecundario,
                        titulo: tituloBotaoSecundario ??
                            Idiomas.current.tituloCancelar,
                      )
                    : const SizedBox.shrink(),
                const Padding(padding: EdgeInsets.only(left: 10)),
                (acaoBotaoNeutro != null)
                    ? Componentes.botao.texto(
                        aoPrecionar: acaoBotaoNeutro,
                        titulo: tituloBotaoNeutro ??
                            Idiomas.current.tituloSaibaMais,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        );
      },
    );
  }
}
