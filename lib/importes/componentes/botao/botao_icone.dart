import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

// ----------------------------------------------------------------------------- Componentes Botão Icone
class $ComBotaoIcone extends StatelessWidget {
  final bool? habilitado;
  final VoidCallback? aoPrecionar;
  final ButtonStyle? estilo;
  final double? tamanho;
  final EdgeInsetsGeometry? espacoInterno;
  final AlignmentGeometry? alinhamento;
  final bool? corDinamica;
  final Color? corIcone;
  final Color? corFoco;
  final Color? corAcima;
  final Color? corDestaque;
  final Color? corRespingo;
  final Color? corDesabilitado;
  final FocusNode? foco;
  final bool? autoFoco;
  final bool? alternarIcone;
  final IconData iconePrimario;
  final IconData? iconeSecundario;

  const $ComBotaoIcone({
    Key? key,
    required this.habilitado,
    required this.aoPrecionar,
    required this.estilo,
    required this.tamanho,
    required this.espacoInterno,
    required this.alinhamento,
    required this.corDinamica,
    required this.corIcone,
    required this.corFoco,
    required this.corAcima,
    required this.corDestaque,
    required this.corRespingo,
    required this.corDesabilitado,
    required this.foco,
    required this.autoFoco,
    required this.alternarIcone,
    required this.iconePrimario,
    required this.iconeSecundario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (habilitado == false) ? null : aoPrecionar,
      style: estilo,
      iconSize: tamanho ?? 25,
      splashRadius: tamanho ?? 25,
      padding: espacoInterno ?? EdgeInsets.zero,
      alignment: alinhamento ?? Alignment.center,
      color: (corDinamica == true)
          ? null
          : corIcone ?? Theme.of(context).primaryColor,
      focusColor: corFoco ?? Theme.of(context).focusColor,
      hoverColor: corAcima ?? Theme.of(context).hoverColor,
      highlightColor: corDestaque ?? Theme.of(context).highlightColor,
      splashColor: corRespingo ?? Theme.of(context).splashColor,
      disabledColor: corDesabilitado ?? Theme.of(context).disabledColor,
      focusNode: foco ?? FocusNode(skipTraversal: true),
      autofocus: autoFoco ?? false,
      icon: Componentes.icone.padrao(
        alternarIcone: alternarIcone,
        iconePrimario: iconePrimario,
        iconeSecundario: iconeSecundario,
      ),
    );
  }
}
