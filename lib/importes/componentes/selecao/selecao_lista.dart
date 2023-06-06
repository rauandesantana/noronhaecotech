import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Componentes Seleção Lista
class $ComSelecaoLista extends StatelessWidget {
  final List<ObjetoSelecao> listaItens;
  final void Function(int, ObjetoSelecao)? aoTocar;

  const $ComSelecaoLista({
    required Key? chave,
    required this.listaItens,
    required this.aoTocar,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: listaItens.length,
      separatorBuilder: (context, indice) => const Divider(),
      itemBuilder: (context, indice) => (listaItens[indice].objeto == null)
          ? ListTile(
              mouseCursor: (aoTocar != null)
                  ? SystemMouseCursors.click
                  : MouseCursor.defer,
              onTap: (aoTocar != null)
                  ? () => aoTocar!(indice, listaItens[indice])
                  : null,
              leading: listaItens[indice].prefixo,
              title: listaItens[indice].titulo ??
                  Componentes.texto.padrao(
                    texto: Idiomas.current.tituloIndisponivel,
                  ),
              subtitle: listaItens[indice].subtitulo,
              trailing: listaItens[indice].sufixo,
            )
          : listaItens[indice].objeto,
    );
  }
}
