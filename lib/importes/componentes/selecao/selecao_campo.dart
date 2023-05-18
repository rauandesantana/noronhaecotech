import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

// ----------------------------------------------------------------------------- Componentes Seleção Campo
class $ComSelecaoCampo extends StatefulWidget {
  final bool? habilitado;
  final FocusNode? foco;
  final bool? autoFoco;
  final AutovalidateMode? modoValidacao;
  final void Function(String?) aoMudar;
  final VoidCallback? aoTocar;
  final void Function(String?)? aoSalvar;
  final String? Function(String?)? validacao;
  final InputDecoration? estilo;
  final TextStyle? estiloTexto;
  final String? textoTitulo;
  final String? textoAjuda;
  final String? textoErro;
  final String? textoDica;
  final String? textoPrefixo;
  final String? textoSufixo;
  final Widget? componenteExterno;
  final Widget? componentePrefixo;
  final Widget? componenteSufixo;
  final AlignmentGeometry? alinhamento;
  final double? alturaMaxMenu;
  final List<Widget> Function(BuildContext)? editarLista;
  final List<String> listaItens;
  final dynamic valor;

  const $ComSelecaoCampo({
    Key? key,
    required this.habilitado,
    required this.foco,
    required this.autoFoco,
    required this.modoValidacao,
    required this.aoMudar,
    required this.aoTocar,
    required this.aoSalvar,
    required this.validacao,
    required this.estilo,
    required this.estiloTexto,
    required this.textoTitulo,
    required this.textoAjuda,
    required this.textoErro,
    required this.textoDica,
    required this.textoPrefixo,
    required this.textoSufixo,
    required this.componenteExterno,
    required this.componentePrefixo,
    required this.componenteSufixo,
    required this.alinhamento,
    required this.alturaMaxMenu,
    required this.editarLista,
    required this.listaItens,
    required this.valor,
  }) : super(key: key);

  @override
  State<$ComSelecaoCampo> createState() => _$ComSelecaoCampoState();
}

class _$ComSelecaoCampoState extends State<$ComSelecaoCampo> {
  @override
  Widget build(BuildContext context) {
    final bool habilitado =
        widget.habilitado != false && widget.listaItens.isNotEmpty;

    final InputDecoration estiloPadrao = widget.estilo ??
        Estilos.selecao.campo(
          context: context,
          habilitado: habilitado,
          textoTitulo: widget.textoTitulo ??
              Idiomas.of(context).tituloTextoCampoSelecionar,
          textoAjuda: (habilitado) ? widget.textoAjuda : null,
          textoErro: (habilitado) ? widget.textoErro : null,
          textoDica: (habilitado) ? widget.textoDica : null,
          textoPrefixo: widget.textoPrefixo,
          textoSufixo: widget.textoSufixo,
          componenteExterno: widget.componenteExterno,
          componentePrefixo: widget.componentePrefixo,
          componenteSufixo: widget.componenteSufixo,
        );

    return DropdownButtonFormField<String>(
      focusNode: widget.foco,
      autofocus: widget.autoFoco ?? false,
      decoration: estiloPadrao,
      borderRadius: BorderRadius.circular(15),
      alignment: widget.alinhamento ?? AlignmentDirectional.centerStart,
      onChanged: (habilitado) ? widget.aoMudar : null,
      onTap: widget.aoTocar,
      onSaved: widget.aoSalvar,
      validator: widget.validacao,
      autovalidateMode: widget.modoValidacao,
      menuMaxHeight: widget.alturaMaxMenu,
      selectedItemBuilder: widget.editarLista,
      items: widget.listaItens.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Componentes.texto.padrao(
            texto: item,
            estilo: widget.estiloTexto ??
                Estilos.texto.normal(
                  corTexto: Theme.of(context).primaryColor,
                  negrito: FontWeight.w500,
                  tamanho: 14,
                ),
          ),
        );
      }).toList(),
      value: widget.valor,
    );
  }
}
