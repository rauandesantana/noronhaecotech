import 'package:flutter/material.dart';

class $ComIconePadrao extends StatefulWidget {
  final IconData icone;
  final double? tamanho;
  final Color? corIcone;

  const $ComIconePadrao({
    Key? key,
    required this.icone,
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
      widget.icone,
      size: widget.tamanho,
      color: widget.corIcone,
    );
  }
}
