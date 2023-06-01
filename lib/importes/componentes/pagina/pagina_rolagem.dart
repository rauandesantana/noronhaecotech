import 'package:flutter/material.dart';

class $ComPaginaRolagem extends StatelessWidget {
  final Axis? direcao;
  final bool? reverso;
  final ScrollController? controlador;
  final ScrollPhysics? fisica;
  final Widget? conteudo;

  const $ComPaginaRolagem({
    required Key? chave,
    required this.direcao,
    required this.reverso,
    required this.controlador,
    required this.fisica,
    required this.conteudo,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: direcao ?? Axis.vertical,
      reverse: reverso ?? false,
      controller: controlador,
      physics: fisica,
      child: conteudo,
    );
  }
}
