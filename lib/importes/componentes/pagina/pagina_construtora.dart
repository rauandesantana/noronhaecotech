import 'package:flutter/material.dart';

// ----------------------------------------------------------------------------- Componentes Pagina Construtora
class $ComPaginaConstrutora extends StatefulWidget {
  final VoidCallback? estadoInicial;
  final void Function(StateSetter)? estadoMontado;
  final void Function(StateSetter)? estadoDesmontado;
  final VoidCallback? estadoDescarte;
  final StatefulWidgetBuilder construtor;

  const $ComPaginaConstrutora({
    Key? key,
    required this.estadoInicial,
    required this.estadoMontado,
    required this.estadoDesmontado,
    required this.estadoDescarte,
    required this.construtor,
  }) : super(key: key);

  @override
  State<$ComPaginaConstrutora> createState() => _$ComPaginaConstrutoraState();
}

class _$ComPaginaConstrutoraState extends State<$ComPaginaConstrutora> {
  @override
  void initState() {
    if (widget.estadoInicial != null) widget.estadoInicial!();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.estadoMontado != null) widget.estadoMontado!(setState);
    });
    super.initState();
  }

  @override
  void deactivate() {
    if (widget.estadoDesmontado != null) widget.estadoDesmontado!(setState);
    super.deactivate();
  }

  @override
  void dispose() {
    if (widget.estadoDescarte != null) widget.estadoDescarte!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: widget.construtor,
    );
  }
}
