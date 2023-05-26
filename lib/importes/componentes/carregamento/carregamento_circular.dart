import 'package:flutter/material.dart';

// ----------------------------------------------------------------------------- Componentes Carregamento Circular
class $ComCarregamentoCircular extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: valor,
      color: corBarra ?? Theme.of(context).primaryColor,
      strokeWidth: espessura ?? 4.0,
    );
  }
}
