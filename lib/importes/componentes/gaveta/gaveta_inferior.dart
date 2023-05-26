import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

// ----------------------------------------------------------------------------- Componentes Gaveta Inferior
class $ComGavetaInferior extends StatelessWidget {
  final VoidCallback? estadoInicial;
  final void Function(StateSetter)? estadoMontado;
  final void Function(Widget)? estadoAlterado;
  final void Function(StateSetter)? estadoDesmontado;
  final VoidCallback? estadoDescarte;
  final void Function(bool)? estadoGaveta;
  final StatefulWidgetBuilder conteudo;

  const $ComGavetaInferior({
    Key? key,
    required this.estadoInicial,
    required this.estadoMontado,
    required this.estadoAlterado,
    required this.estadoDesmontado,
    required this.estadoDescarte,
    required this.estadoGaveta,
    required this.conteudo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Componentes.pagina.construtora(
      estadoInicial: estadoInicial,
      estadoMontado: (estadoMontado == null && estadoGaveta == null)
          ? null
          : (atualizar) {
              if (estadoMontado != null) estadoMontado!(atualizar);
              if (estadoGaveta != null) estadoGaveta!(true);
            },
      estadoAlterado: estadoAlterado,
      estadoDesmontado: (estadoDesmontado == null && estadoGaveta == null)
          ? null
          : (atualizar) {
              if (estadoDesmontado != null) estadoDesmontado!(atualizar);
              if (estadoGaveta != null) estadoGaveta!(false);
            },
      estadoDescarte: estadoDescarte,
      construtor: (context, atualizar) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: const [
              BoxShadow(offset: Offset(0, -1), blurRadius: 8),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: StatefulBuilder(
            builder: conteudo,
          ),
        );
      },
    );
  }
}
