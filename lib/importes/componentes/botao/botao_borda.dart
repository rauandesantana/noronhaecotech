import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

// ----------------------------------------------------------------------------- Componentes Botão Borda
class $ComBotaoBorda extends StatelessWidget {
  final bool? habilitado;
  final VoidCallback? aoPrecionar;
  final VoidCallback? aoSegurar;
  final void Function(bool)? aoPassar;
  final void Function(bool)? aoMudarFoco;
  final ButtonStyle? estilo;
  final FocusNode? foco;
  final bool? autoFoco;
  final MaterialStatesController? controladorEstado;
  final String titulo;
  final TextStyle? estiloTitulo;

  const $ComBotaoBorda({
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
    required this.titulo,
    required this.estiloTitulo,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (habilitado == false) ? null : aoPrecionar,
      onLongPress: aoSegurar,
      onHover: aoPassar,
      onFocusChange: aoMudarFoco,
      style: estilo ??
          Estilos.botao.borda(
            context: context,
            habilitado: habilitado ?? true,
          ),
      focusNode: foco,
      autofocus: autoFoco ?? false,
      statesController: controladorEstado,
      child: Padding(
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
