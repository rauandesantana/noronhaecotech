import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

class $CompBotaoElevado extends StatefulWidget {
  final bool? habilitado;
  final void Function()? aoPrecionar;
  final void Function()? aoSegurar;
  final void Function(bool)? aoPassar;
  final void Function(bool)? aoMudarFoco;
  final ButtonStyle? estilo;
  final FocusNode? foco;
  final bool? autoFoco;
  final MaterialStatesController? controladorEstado;
  final String titulo;
  final TextStyle? estiloTitulo;

  const $CompBotaoElevado({
    Key? key,
    required this.habilitado,
    required this.aoPrecionar,
    required this.aoSegurar,
    required this.aoPassar,
    required this.aoMudarFoco,
    required this.estilo,
    required this.foco,
    required this.autoFoco,
    required this.controladorEstado,
    required this.titulo,
    required this.estiloTitulo,
  }) : super(key: key);

  @override
  State<$CompBotaoElevado> createState() => _$CompBotaoElevadoState();
}

class _$CompBotaoElevadoState extends State<$CompBotaoElevado> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (widget.habilitado == false) ? null : widget.aoPrecionar,
      onLongPress: widget.aoSegurar,
      onHover: widget.aoPassar,
      onFocusChange: widget.aoMudarFoco,
      style: widget.estilo ??
          Estilos.botao.elevado(
            context: context,
            habilitado: widget.habilitado ?? true,
          ),
      focusNode: widget.foco,
      autofocus: widget.autoFoco ?? false,
      statesController: widget.controladorEstado,
      child: Componentes.texto.padrao(
        texto: widget.titulo,
        estilo: widget.estiloTitulo ??
            Estilos.texto.decorativo(
              corTexto: Theme.of(context).scaffoldBackgroundColor,
              tamanho: 16,
            ),
      ),
    );
  }
}
