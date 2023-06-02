import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

class $ComDialogoSequencial extends StatelessWidget {
  final double? larguraPadrao;
  final double? alturaPadrao;
  final ControladorPagina controlador;
  final void Function(int)? aoMudar;
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
    final indisponivel = Idiomas.of(context).tituloIndisponivel;
    final conteudo = dialogoSequencial.map((item) => item.conteudo).toList();
    int indiceAtual = controlador.indiceAtual;

    return Componentes.dialogo.padrao(
      titulo: titulo,
      conteudo: (context, atualizar) {
        final objeto = dialogoSequencial[indiceAtual];
        final tituloSecValido = objeto.tituloBotaoSecundario != null;
        final acaoSecValido = objeto.tituloBotaoSecundario != null;
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
                  if (aoMudar != null) aoMudar!(indice);
                  atualizar(() => indiceAtual = indice);
                },
                rolagem: rolagem ?? const NeverScrollableScrollPhysics(),
                direcao: direcao ?? Axis.horizontal,
                reverso: reverso,
                conteudo: conteudo,
              ),
            ),
            (exibirBotaoSecundario)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Componentes.botao.elevado(
                        aoPrecionar: objeto.acaoBotaoSecundario,
                        titulo: objeto.tituloBotaoSecundario ?? indisponivel,
                      ),
                      Componentes.botao.elevado(
                        aoPrecionar: objeto.acaoBotaoPrimario,
                        titulo: objeto.tituloBotaoPrimario,
                      ),
                    ],
                  )
                : Componentes.botao.elevado(
                    aoPrecionar: objeto.acaoBotaoPrimario,
                    titulo: objeto.tituloBotaoPrimario,
                  ),
          ],
        );
      },
    );
  }
}
