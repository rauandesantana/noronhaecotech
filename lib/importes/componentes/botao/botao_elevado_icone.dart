import 'package:flutter/material.dart';
import 'package:noronhaecotech/importar_componentes.dart';
import 'package:noronhaecotech/importar_estilos.dart';

// ----------------------------------------------------------------------------- Componentes Botão Elevado Icone
class $ComBotaoElevadoIcone extends StatelessWidget {
  final bool? habilitado;
  final VoidCallback? aoPrecionar;
  final VoidCallback? aoSegurar;
  final void Function(bool)? aoPassar;
  final void Function(bool)? aoMudarFoco;
  final ButtonStyle? estilo;
  final FocusNode? foco;
  final bool? autoFoco;
  final MaterialStatesController? controladorEstado;
  final IconData icone;
  final double? tamanhoIcone;
  final String titulo;
  final TextStyle? estiloTitulo;

  const $ComBotaoElevadoIcone({
    required Key? chave,
    required this.habilitado,
    required this.aoPrecionar,
    required this.aoSegurar,
    required this.aoPassar,
    required this.aoMudarFoco,
    required this.estilo,
    required this.foco,
    required this.autoFoco,
    required this.controladorEstado,
    required this.icone,
    required this.tamanhoIcone,
    required this.titulo,
    required this.estiloTitulo,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: (habilitado == false) ? null : aoPrecionar,
      onLongPress: aoSegurar,
      onHover: aoPassar,
      onFocusChange: aoMudarFoco,
      style: estilo ??
          Estilos.botao.elevado(
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
                corTexto: Theme.of(context).scaffoldBackgroundColor,
                tamanho: 16,
              ),
        ),
      ),
    );
  }
}
