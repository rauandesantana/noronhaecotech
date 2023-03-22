import 'package:flutter/material.dart';

class $ComponentesCarregamentoCircular extends StatefulWidget {
  final double? valor;
  final Color? corBarra;
  final double? espessura;
  const $ComponentesCarregamentoCircular({
    Key? key,
    required this.valor,
    required this.corBarra,
    required this.espessura,
  }) : super(key: key);

  @override
  State<$ComponentesCarregamentoCircular> createState() =>
      _$ComponentesCarregamentoCircularState();
}

class _$ComponentesCarregamentoCircularState
    extends State<$ComponentesCarregamentoCircular> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: widget.valor,
      color: widget.corBarra ?? Theme.of(context).primaryColor,
      strokeWidth: widget.espessura ?? 4.0,
    );
  }
}
