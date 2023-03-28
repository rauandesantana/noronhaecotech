import 'package:flutter/material.dart';

class $ComCarregamentoCircular extends StatefulWidget {
  final double? valor;
  final Color? corBarra;
  final double? espessura;

  const $ComCarregamentoCircular({
    Key? key,
    required this.valor,
    required this.corBarra,
    required this.espessura,
  }) : super(key: key);

  @override
  State<$ComCarregamentoCircular> createState() =>
      _$ComCarregamentoCircularState();
}

class _$ComCarregamentoCircularState extends State<$ComCarregamentoCircular> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: widget.valor,
      color: widget.corBarra ?? Theme.of(context).primaryColor,
      strokeWidth: widget.espessura ?? 4.0,
    );
  }
}
