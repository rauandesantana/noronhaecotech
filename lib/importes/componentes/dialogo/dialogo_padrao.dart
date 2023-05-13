import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

class $ComDialogoPadrao extends StatefulWidget {
  final VoidCallback? estadoInicial;
  final void Function(StateSetter)? estadoMontado;
  final void Function(StateSetter)? estadoDesmontado;
  final VoidCallback? estadoDescarte;
  final String titulo;
  final StatefulWidgetBuilder conteudo;

  const $ComDialogoPadrao({
    Key? key,
    required this.estadoInicial,
    required this.estadoMontado,
    required this.estadoDesmontado,
    required this.estadoDescarte,
    required this.titulo,
    required this.conteudo,
  }) : super(key: key);

  @override
  State<$ComDialogoPadrao> createState() => _$ComDialogoPadraoState();
}

class _$ComDialogoPadraoState extends State<$ComDialogoPadrao> {
  @override
  void initState() {
    super.initState();
    if (widget.estadoInicial != null) widget.estadoInicial!();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.estadoMontado != null) widget.estadoMontado!(setState);
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    if (widget.estadoDesmontado != null) widget.estadoDesmontado!(setState);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.estadoDescarte != null) widget.estadoDescarte!();
  }

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
                StatefulBuilder(
                  builder: widget.conteudo,
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
