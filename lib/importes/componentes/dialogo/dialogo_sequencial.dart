import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

class $ComDialogoSequencial extends StatelessWidget {
  final double? larguraPadrao;
  final double? alturaPadrao;
  final ControladorPagina controlador;
  final void Function(int, int)? aoMudar;
  final ScrollPhysics? rolagem;
  final Axis? direcao;
  final bool? reverso;
  final String titulo;
  final List<DialogoSequencial> dialogoSequencial;

  const $ComDialogoSequencial({
    required Key? chave,
    required this.larguraPadrao,
    required this.alturaPadrao,
    required this.controlador,
    required this.aoMudar,
    required this.rolagem,
    required this.direcao,
    required this.reverso,
    required this.titulo,
    required this.dialogoSequencial,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    final indisponivel = Idiomas.current.tituloIndisponivel;
    final conteudo = dialogoSequencial.map((item) => item.conteudo).toList();
    int indiceAtual = controlador.indiceAtual;

    return Componentes.dialogo.padrao(
      titulo: titulo,
      conteudo: (context, atualizar) {
        final objeto = dialogoSequencial[indiceAtual];
        final tituloPriValido = objeto.tituloBotaoPrimario != null;
        final acaoPriValido = objeto.acaoBotaoPrimario != null;
        final exibirBotaoPrimario = tituloPriValido && acaoPriValido;

        final tituloSecValido = objeto.tituloBotaoSecundario != null;
        final acaoSecValido = objeto.acaoBotaoSecundario != null;
        final exibirBotaoSecundario = tituloSecValido && acaoSecValido;

        return Column(
          children: <Widget>[
            Visibility(
              visible: objeto.descricao != null,
              child: Componentes.texto.padrao(
                texto: objeto.descricao ?? indisponivel,
                estilo: Estilos.texto.normal(tamanho: 14),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: objeto.largura ?? larguraPadrao ?? 300,
                maxHeight: objeto.altura ?? alturaPadrao ?? 150,
              ),
              child: Componentes.pagina.deslizante(
                controlador: controlador,
                aoMudar: (indice) {
                  if (aoMudar != null) {
                    aoMudar!(
                      indice,
                      dialogoSequencial.length - 1,
                    );
                  }
                  atualizar(() => indiceAtual = indice);
                },
                rolagem: rolagem ?? const NeverScrollableScrollPhysics(),
                direcao: direcao ?? Axis.horizontal,
                reverso: reverso,
                conteudo: conteudo,
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: objeto.largura ?? larguraPadrao ?? 300,
                maxHeight: objeto.altura ?? alturaPadrao ?? 150,
              ),
              child: Row(
                mainAxisAlignment:
                    (exibirBotaoPrimario && exibirBotaoSecundario)
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.center,
                children: <Widget>[
                  (exibirBotaoSecundario)
                      ? Componentes.botao.borda(
                          aoPrecionar: objeto.acaoBotaoSecundario,
                          titulo: objeto.tituloBotaoSecundario ?? indisponivel,
                        )
                      : const SizedBox(width: 0, height: 0),
                  (exibirBotaoPrimario)
                      ? Componentes.botao.elevado(
                          aoPrecionar: objeto.acaoBotaoPrimario,
                          titulo: objeto.tituloBotaoPrimario ?? indisponivel,
                        )
                      : const SizedBox(width: 0, height: 0),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
