import 'package:flutter/material.dart';

class $ComPaginaDeslizante extends StatelessWidget {
  final Axis? direcao;
  final bool? reverso;
  final PageController? controlador;
  final ScrollPhysics? fisica;
  final void Function(int)? aoMudar;
  final List<Widget> conteudo;

  const $ComPaginaDeslizante({
    required Key? chave,
    required this.direcao,
    required this.reverso,
    required this.controlador,
    required this.fisica,
    required this.aoMudar,
    required this.conteudo,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: direcao ?? Axis.horizontal,
      reverse: reverso ?? false,
      controller: controlador,
      physics: fisica,
      onPageChanged: aoMudar,
      children: conteudo,
    );
  }
}
