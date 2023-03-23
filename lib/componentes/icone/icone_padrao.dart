import 'package:flutter/material.dart';

class $CompIconePadrao extends StatefulWidget {
  final IconData icone;
  final double? tamanho;
  final Color? corIcone;

  const $CompIconePadrao({
    Key? key,
    required this.icone,
    required this.tamanho,
    required this.corIcone,
  }) : super(key: key);

  @override
  State<$CompIconePadrao> createState() => _$CompIconePadraoState();
}

class _$CompIconePadraoState extends State<$CompIconePadrao> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.icone,
      size: widget.tamanho,
      color: widget.corIcone,
    );
  }
}
