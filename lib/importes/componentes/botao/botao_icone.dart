import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

class $ComBotaoIcone extends StatefulWidget {
  final bool? habilitado;
  final void Function()? aoPrecionar;
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
  State<$ComBotaoIcone> createState() => _$ComBotaoIconeState();
}

class _$ComBotaoIconeState extends State<$ComBotaoIcone> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (widget.habilitado == false) ? null : widget.aoPrecionar,
      style: widget.estilo,
      iconSize: widget.tamanho ?? 25,
      splashRadius: widget.tamanho ?? 25,
      padding: widget.espacoInterno ?? EdgeInsets.zero,
      alignment: widget.alinhamento ?? Alignment.center,
      color: (widget.corDinamica == true)
          ? null
          : widget.corIcone ?? Theme.of(context).primaryColor,
      focusColor: widget.corFoco ?? Theme.of(context).focusColor,
      hoverColor: widget.corAcima ?? Theme.of(context).hoverColor,
      highlightColor:
      widget.corDestaque ?? Theme.of(context).highlightColor,
      splashColor: widget.corRespingo ?? Theme.of(context).splashColor,
      disabledColor:
      widget.corDesabilitado ?? Theme.of(context).disabledColor,
      focusNode: widget.foco ?? FocusNode(skipTraversal: true),
      autofocus: widget.autoFoco ?? false,
      icon: Componentes.icone.padrao(
        alternarIcone: widget.alternarIcone,
        iconePrimario: widget.iconePrimario,
        iconeSecundario: widget.iconeSecundario,
      ),
    );
  }
}
