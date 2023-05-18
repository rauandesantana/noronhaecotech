import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

// ----------------------------------------------------------------------------- Componentes Texto Campo Senha
class $ComTextoCampoSenha extends StatefulWidget {
  final bool? habilitado;
  final bool? bloqueado;
  final bool? botaoLimpar;
  final bool? tituloConfirmacao;
  final TextEditingController? controlador;
  final FocusNode? foco;
  final bool? autoFoco;
  final TextInputType? tipoTeclado;
  final TextInputAction? acaoBotaoTeclado;
  final String? textoTitulo;
  final String? textoAjuda;
  final String? textoErro;
  final String? textoDica;
  final String? textoPrefixo;
  final String? textoSufixo;
  final IconData? iconePrefixo;
  final EditableTextContextMenuBuilder? menuTexto;

  const $ComTextoCampoSenha({
    Key? key,
    required this.habilitado,
    required this.bloqueado,
    required this.botaoLimpar,
    required this.tituloConfirmacao,
    required this.controlador,
    required this.foco,
    required this.autoFoco,
    required this.tipoTeclado,
    required this.acaoBotaoTeclado,
    required this.textoTitulo,
    required this.textoAjuda,
    required this.textoErro,
    required this.textoDica,
    required this.textoPrefixo,
    required this.textoSufixo,
    required this.iconePrefixo,
    required this.menuTexto,
  }) : super(key: key);

  @override
  State<$ComTextoCampoSenha> createState() => _$ComTextoCampoSenhaState();
}

class _$ComTextoCampoSenhaState extends State<$ComTextoCampoSenha> {
  @override
  Widget build(BuildContext context) {
    return Componentes.texto.campoPadrao(
      habilitado: widget.habilitado,
      bloqueado: widget.bloqueado,
      ocultarTexto: true,
      botaoLimpar: widget.botaoLimpar,
      controlador: widget.controlador,
      foco: widget.foco,
      autoFoco: widget.autoFoco,
      tipoTeclado: widget.tipoTeclado ?? TextInputType.visiblePassword,
      acaoBotaoTeclado: widget.acaoBotaoTeclado,
      textoTitulo: (widget.textoTitulo != null)
          ? widget.textoTitulo
          : (widget.tituloConfirmacao == true)
              ? Idiomas.of(context).tituloTextoCampoReSenha
              : Idiomas.of(context).tituloTextoCampoSenha,
      textoAjuda: widget.textoAjuda,
      textoErro: widget.textoErro,
      textoDica: widget.textoDica,
      textoPrefixo: widget.textoPrefixo,
      textoSufixo: widget.textoSufixo,
      componentePrefixo: Componentes.icone.padrao(
        iconePrimario: widget.iconePrefixo ?? Icons.password_rounded,
      ),
      menuTexto: widget.menuTexto,
    );
  }
}
