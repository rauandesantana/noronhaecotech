import 'package:flutter/material.dart';

class ObjetoSelecao {
  final Widget? prefixo;
  final Widget titulo;
  final Widget? sufixo;
  final Widget? subtitulo;

  const ObjetoSelecao({
    this.prefixo,
    required this.titulo,
    this.subtitulo,
    this.sufixo,
  });
}
