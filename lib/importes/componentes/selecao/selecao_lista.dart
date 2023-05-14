import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

class $ComSelecaoLista extends StatefulWidget {
  final List<ObjetoSelecao> listaItens;
  final void Function(int, ObjetoSelecao)? aoTocar;

  const $ComSelecaoLista({
    Key? key,
    required this.listaItens,
    required this.aoTocar,
  }) : super(key: key);

  @override
  State<$ComSelecaoLista> createState() => _$ComSelecaoListaState();
}

class _$ComSelecaoListaState extends State<$ComSelecaoLista> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.listaItens.length,
      separatorBuilder: (context, indice) => const Divider(),
      itemBuilder: (context, indice) => ListTile(
        mouseCursor: (widget.aoTocar != null)
            ? SystemMouseCursors.click
            : MouseCursor.defer,
        onTap: (widget.aoTocar != null)
            ? () => widget.aoTocar!(indice, widget.listaItens[indice])
            : null,
        leading: widget.listaItens[indice].prefixo,
        title: widget.listaItens[indice].titulo,
        subtitle: widget.listaItens[indice].subtitulo,
        trailing: widget.listaItens[indice].sufixo,
      ),
    );
  }
}
