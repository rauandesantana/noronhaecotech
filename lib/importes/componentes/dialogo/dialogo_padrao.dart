import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

// ----------------------------------------------------------------------------- Componentes Dialogo Padrão
class $ComDialogoPadrao extends StatelessWidget {
  final VoidCallback? estadoInicial;
  final void Function(StateSetter)? estadoMontado;
  final void Function(Widget)? estadoAlterado;
  final void Function(StateSetter)? estadoDesmontado;
  final VoidCallback? estadoDescarte;
  final String titulo;
  final StatefulWidgetBuilder conteudo;

  const $ComDialogoPadrao({
    Key? key,
    required this.estadoInicial,
    required this.estadoMontado,
    required this.estadoAlterado,
    required this.estadoDesmontado,
    required this.estadoDescarte,
    required this.titulo,
    required this.conteudo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Componentes.pagina.construtora(
      estadoInicial: estadoInicial,
      estadoMontado: estadoMontado,
      estadoAlterado: estadoAlterado,
      estadoDesmontado: estadoDesmontado,
      estadoDescarte: estadoDescarte,
      construtor: (context, atualizar) {
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
                      builder: conteudo,
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
                    texto: titulo,
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
      },
    );
  }
}
