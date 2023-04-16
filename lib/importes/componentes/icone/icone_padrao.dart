import 'package:flutter/material.dart';

class $ComIconePadrao extends StatefulWidget {
  final bool? alternarIcone;
  final IconData iconePrimario;
  final IconData? iconeSecundario;
  final double? tamanho;
  final Color? corIcone;

  const $ComIconePadrao({
    Key? key,
    required this.alternarIcone,
    required this.iconePrimario,
    required this.iconeSecundario,
    required this.tamanho,
    required this.corIcone,
  }) : super(key: key);

  @override
  State<$ComIconePadrao> createState() => _$ComIconePadraoState();
}

class _$ComIconePadraoState extends State<$ComIconePadrao> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      (widget.alternarIcone == true)
          ? widget.iconeSecundario ?? widget.iconePrimario
          : widget.iconePrimario,
      size: widget.tamanho,
      color: widget.corIcone,
    );
  }
}
