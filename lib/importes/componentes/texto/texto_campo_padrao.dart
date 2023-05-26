import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

// ----------------------------------------------------------------------------- Componentes Texto Campo Padrão
class $ComTextoCampoPadrao extends StatelessWidget {
  final bool? habilitado;
  final bool? bloqueado;
  final bool? ocultarTexto;
  final bool? botaoLimpar;
  final TextEditingController? controlador;
  final FocusNode? foco;
  final bool? autoFoco;
  final TextInputType? tipoTeclado;
  final TextCapitalization? capitalizacao;
  final TextInputAction? acaoBotaoTeclado;
  final int? linhasMax;
  final int? linhasMin;
  final List<TextInputFormatter>? formatacao;
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
  final void Function(String)? aoMudar;
  final VoidCallback? aoPrecionar;
  final EditableTextContextMenuBuilder? menuTexto;

  const $ComTextoCampoPadrao({
    Key? key,
    required this.habilitado,
    required this.bloqueado,
    required this.ocultarTexto,
    required this.botaoLimpar,
    required this.controlador,
    required this.foco,
    required this.autoFoco,
    required this.tipoTeclado,
    required this.capitalizacao,
    required this.acaoBotaoTeclado,
    required this.linhasMax,
    required this.linhasMin,
    required this.formatacao,
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
    required this.aoMudar,
    required this.aoPrecionar,
    required this.menuTexto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController valorControlador = TextEditingController();
    bool valorOcultarTexto = false;

    Widget? botaoVisualizarTexto(StateSetter atualizar) =>
        (ocultarTexto != true)
            ? componenteSufixo
            : Componentes.botao.icone(
                aoPrecionar: () => atualizar(
                  () => valorOcultarTexto = !valorOcultarTexto,
                ),
                alternarIcone: valorOcultarTexto,
                iconePrimario: Icons.visibility_off_rounded,
                iconeSecundario: Icons.visibility_rounded,
              );

    final Widget? botaoLimparTexto = (valorControlador.text.isEmpty)
        ? null
        : Componentes.botao.icone(
            aoPrecionar: () => valorControlador.clear(),
            iconePrimario: Icons.clear_rounded,
          );

    InputDecoration estiloPadrao(StateSetter atualizar) =>
        estilo ??
        Estilos.texto.campo(
          context: context,
          textoTitulo: textoTitulo,
          textoAjuda: (habilitado == false) ? null : textoAjuda,
          textoErro: (habilitado == false) ? null : textoErro,
          textoDica: (habilitado == false) ? null : textoDica,
          textoPrefixo: textoPrefixo,
          textoSufixo: textoSufixo,
          componenteExterno: componenteExterno,
          componentePrefixo: componentePrefixo,
          componenteSufixo: (botaoLimpar == false)
              ? botaoVisualizarTexto(atualizar)
              : (ocultarTexto != true && componenteSufixo == null)
                  ? botaoLimparTexto
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      textDirection: TextDirection.rtl,
                      children: <Widget>[
                        botaoVisualizarTexto(atualizar) ?? Container(width: 0),
                        botaoLimparTexto ?? Container(width: 0),
                      ],
                    ),
        );

    return Componentes.pagina.construtora(
      construtor: (context, atualizar) {
        return TextFormField(
          enabled: habilitado ?? true,
          readOnly: bloqueado ?? false,
          obscureText: valorOcultarTexto,
          controller: valorControlador,
          focusNode: foco,
          autofocus: autoFoco ?? false,
          decoration: estiloPadrao(atualizar),
          cursorColor: estiloPadrao(atualizar).iconColor,
          cursorRadius: const Radius.circular(1),
          keyboardType: tipoTeclado ?? TextInputType.text,
          textCapitalization: capitalizacao ?? TextCapitalization.none,
          textInputAction: acaoBotaoTeclado ?? TextInputAction.none,
          style: estiloTexto ?? Estilos.texto.normal(tamanho: 16),
          contextMenuBuilder: menuTexto ?? Estilos.texto.menuTexto(),
          maxLines: linhasMax ?? 1,
          minLines: linhasMin,
          inputFormatters: formatacao,
          onTap: aoPrecionar,
        );
      },
    );
  }
}
