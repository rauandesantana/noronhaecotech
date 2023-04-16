import 'package:flutter/material.dart';

class $ComPaginaConstrutora extends StatefulWidget {
  final void Function(StateSetter) estadoInicial;
  final void Function(StateSetter) estadoDescarte;
  final StatefulWidgetBuilder construtor;

  const $ComPaginaConstrutora({
    Key? key,
    required this.estadoInicial,
    required this.estadoDescarte,
    required this.construtor,
  }) : super(key: key);

  @override
  State<$ComPaginaConstrutora> createState() => _$ComPaginaConstrutoraState();
}

class _$ComPaginaConstrutoraState extends State<$ComPaginaConstrutora> {

  @override
  void initState() {
    super.initState();
    widget.estadoInicial(setState);
  }

  @override
  void dispose() {
    super.dispose();
    widget.estadoDescarte(setState);
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: widget.construtor,
    );
  }
}
