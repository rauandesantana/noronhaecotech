import 'package:flutter/material.dart';

class $CompCarregamentoCircular extends StatefulWidget {
  final double? valor;
  final Color? corBarra;
  final double? espessura;

  const $CompCarregamentoCircular({
    Key? key,
    required this.valor,
    required this.corBarra,
    required this.espessura,
  }) : super(key: key);

  @override
  State<$CompCarregamentoCircular> createState() =>
      _$CompCarregamentoCircularState();
}

class _$CompCarregamentoCircularState extends State<$CompCarregamentoCircular> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: widget.valor,
      color: widget.corBarra ?? Theme.of(context).primaryColor,
      strokeWidth: widget.espessura ?? 4.0,
    );
  }
}
