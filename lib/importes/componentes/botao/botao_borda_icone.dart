import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

// ----------------------------------------------------------------------------- Componentes Botão Borda Icone
class $ComBotaoBordaIcone extends StatefulWidget {
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
  State<$ComBotaoBordaIcone> createState() => _$ComBotaoBordaIconeState();
}

class _$ComBotaoBordaIconeState extends State<$ComBotaoBordaIcone> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: (widget.habilitado == false) ? null : widget.aoPrecionar,
      onLongPress: widget.aoSegurar,
      style: widget.estilo ??
          Estilos.botao.borda(
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
                tamanho: 16,
              ),
        ),
      ),
    );
  }
}
