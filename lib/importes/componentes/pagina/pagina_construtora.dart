import 'package:flutter/material.dart';

class $ComPaginaConstrutora extends StatefulWidget {
  final void Function(StateSetter)? estadoInicial;
  final void Function(StateSetter)? estadoMontado;
  final void Function(StateSetter)? estadoDesmontado;
  final void Function(StateSetter)? estadoDescarte;
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
    super.initState();
    (widget.estadoInicial != null) ? widget.estadoInicial!(setState) : null;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => (widget.estadoMontado != null)
          ? widget.estadoMontado!(setState)
          : null,
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    (widget.estadoDesmontado != null)
        ? widget.estadoDesmontado!(setState)
        : null;
  }

  @override
  void dispose() {
    super.dispose();
    (widget.estadoDescarte != null) ? widget.estadoDescarte!(setState) : null;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: widget.construtor,
    );
  }
}
