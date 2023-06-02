import 'package:flutter/cupertino.dart';

// ----------------------------------------------------------------------------- Dialogo Sequencial
class DialogoSequencial {
  final double? largura;
  final double? altura;
  final String? descricao;
  final Widget conteudo;
  final String tituloBotaoPrimario;
  final String? tituloBotaoSecundario;
  final VoidCallback acaoBotaoPrimario;
  final VoidCallback? acaoBotaoSecundario;

  DialogoSequencial({
    this.largura,
    this.altura,
    this.descricao,
    required this.conteudo,
    required this.tituloBotaoPrimario,
    this.tituloBotaoSecundario,
    required this.acaoBotaoPrimario,
    this.acaoBotaoSecundario,
  });
  //////////////////////////////////////////////////////////////////////////////
}
