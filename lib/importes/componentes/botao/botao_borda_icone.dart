import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

// ----------------------------------------------------------------------------- Componentes Botão Borda Icone
class $ComBotaoBordaIcone extends StatelessWidget {
  final bool? habilitado;
  final VoidCallback? aoPrecionar;
  final VoidCallback? aoSegurar;
  final ButtonStyle? estilo;
  final FocusNode? foco;
  final bool? autoFoco;
  final MaterialStatesController? controladorEstado;
  final IconData icone;
  final double? tamanhoIcone;
  final String titulo;
  final TextStyle? estiloTitulo;

  const $ComBotaoBordaIcone({
    Key? key,
    required this.habilitado,
    required this.aoPrecionar,
    required this.aoSegurar,
    required this.estilo,
    required this.foco,
    required this.autoFoco,
    required this.controladorEstado,
    required this.icone,
    required this.tamanhoIcone,
    required this.titulo,
    required this.estiloTitulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: (habilitado == false) ? null : aoPrecionar,
      onLongPress: aoSegurar,
      style: estilo ??
          Estilos.botao.borda(
            context: context,
            habilitado: habilitado ?? true,
          ),
      focusNode: foco,
      autofocus: autoFoco ?? false,
      statesController: controladorEstado,
      icon: Componentes.icone.padrao(
        iconePrimario: icone,
        tamanho: tamanhoIcone,
      ),
      label: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Componentes.texto.padrao(
          texto: titulo,
          estilo: estiloTitulo ??
              Estilos.texto.decorativo(
                tamanho: 16,
              ),
        ),
      ),
    );
  }
}
