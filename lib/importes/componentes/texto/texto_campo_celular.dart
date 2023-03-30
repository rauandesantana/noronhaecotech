import 'package:flutter/material.dart';
import 'package:noronhaecotech/idiomas/arquivos_gerados/l10n.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

class $ComTextoCampoCelular extends StatefulWidget {
  final bool? habilitado;
  final bool? bloqueado;
  final bool? botaoLimpar;
  final TextEditingController controlador;
  final FocusNode? foco;
  final TextInputAction? acaoBotaoTeclado;
  final String? textoTitulo;
  final String? textoAjuda;
  final String? textoErro;
  final String? textoDica;
  final String? textoSufixo;
  final IconData? iconePrefixo;
  final Widget? componenteSufixo;

  const $ComTextoCampoCelular({
    Key? key,
    required this.habilitado,
    required this.bloqueado,
    required this.botaoLimpar,
    required this.controlador,
    required this.foco,
    required this.acaoBotaoTeclado,
    required this.textoTitulo,
    required this.textoAjuda,
    required this.textoErro,
    required this.textoDica,
    required this.textoSufixo,
    required this.iconePrefixo,
    required this.componenteSufixo,
  }) : super(key: key);

  @override
  State<$ComTextoCampoCelular> createState() => _$ComTextoCampoCelularState();
}

class _$ComTextoCampoCelularState extends State<$ComTextoCampoCelular> {
  String? ddi;

  @override
  Widget build(BuildContext context) {
    return Componentes.texto.campoPadrao(
      habilitado: widget.habilitado,
      bloqueado: widget.bloqueado,
      botaoLimpar: widget.botaoLimpar,
      controlador: widget.controlador,
      foco: widget.foco,
      tipoTeclado: TextInputType.phone,
      acaoBotaoTeclado: widget.acaoBotaoTeclado ?? TextInputAction.next,
      formatacao: null,
      textoTitulo:
          widget.textoTitulo ?? Idiomas.of(context).tituloTextoCampoCelular,
      textoAjuda: widget.textoAjuda,
      textoErro: widget.textoErro,
      textoDica: widget.textoDica,
      textoPrefixo: ddi,
      textoSufixo: widget.textoSufixo,
      componenteExterno: null,
      componentePrefixo: Componentes.icone.padrao(
        icone: widget.iconePrefixo ?? Icons.phone_android_rounded,
      ),
      componenteSufixo: widget.componenteSufixo,
    );
  }
}
