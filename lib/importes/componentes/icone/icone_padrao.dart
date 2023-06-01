import 'package:flutter/material.dart';

// ----------------------------------------------------------------------------- Componentes Icone Padrão
class $ComIconePadrao extends StatelessWidget {
  final bool? alternarIcone;
  final IconData iconePrimario;
  final IconData? iconeSecundario;
  final double? tamanho;
  final Color? corIcone;

  const $ComIconePadrao({
    required Key? chave,
    required this.alternarIcone,
    required this.iconePrimario,
    required this.iconeSecundario,
    required this.tamanho,
    required this.corIcone,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    return Icon(
      (alternarIcone == true)
          ? iconeSecundario ?? iconePrimario
          : iconePrimario,
      size: tamanho,
      color: corIcone,
    );
  }
}
