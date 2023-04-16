import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

class $ComBotaoElevadoIcone extends StatefulWidget {
  final bool? habilitado;
  final void Function()? aoPrecionar;
  final void Function()? aoSegurar;
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
    required this.icone,
    required this.tamanhoIcone,
    required this.titulo,
    required this.estiloTitulo,
  }) : super(key: key);

  @override
  State<$ComBotaoElevadoIcone> createState() => _$ComBotaoElevadoIconeState();
}

class _$ComBotaoElevadoIconeState extends State<$ComBotaoElevadoIcone> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
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
      icon: Componentes.icone.padrao(
        iconePrimario: widget.icone,
        tamanho: widget.tamanhoIcone,
      ),
      label: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Componentes.texto.padrao(
          texto: widget.titulo,
          estilo: widget.estiloTitulo ??
              Estilos.texto.decorativo(
                corTexto: Theme.of(context).scaffoldBackgroundColor,
                tamanho: 16,
              ),
        ),
      ),
    );
  }
}
