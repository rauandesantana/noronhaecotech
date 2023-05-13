import 'package:flutter/material.dart';

class $ComGavetaInferior extends StatefulWidget {
  final VoidCallback? estadoInicial;
  final void Function(StateSetter)? estadoMontado;
  final void Function(StateSetter)? estadoDesmontado;
  final VoidCallback? estadoDescarte;
  final void Function(bool)? estadoGaveta;
  final StatefulWidgetBuilder conteudo;

  const $ComGavetaInferior({
    Key? key,
    required this.estadoInicial,
    required this.estadoMontado,
    required this.estadoDesmontado,
    required this.estadoDescarte,
    required this.estadoGaveta,
    required this.conteudo,
  }) : super(key: key);

  @override
  State<$ComGavetaInferior> createState() => _$ComGavetaInferiorState();
}

class _$ComGavetaInferiorState extends State<$ComGavetaInferior> {
  @override
  void initState() {
    super.initState();
    if (widget.estadoInicial != null) widget.estadoInicial!();
    WidgetsBinding.instance.addPostFrameCallback((_) {

      if (widget.estadoMontado != null) widget.estadoMontado!(setState);
      if (widget.estadoGaveta != null) widget.estadoGaveta!(true);
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    if (widget.estadoDesmontado != null) widget.estadoDesmontado!(setState);
    if (widget.estadoGaveta != null) widget.estadoGaveta!(false);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.estadoDescarte != null) widget.estadoDescarte!();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 400,
        maxHeight: MediaQuery.of(context).size.height * 0.489,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(offset: Offset(0, -1), blurRadius: 8),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: StatefulBuilder(
        builder: widget.conteudo,
      ),
    );
  }
}
