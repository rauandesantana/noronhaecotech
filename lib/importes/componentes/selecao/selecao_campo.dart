import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Componentes Seleção Campo
class $ComSelecaoCampo extends StatelessWidget {
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
    required Key? chave,
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
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    final bool valorHabilitado = habilitado != false && listaItens.isNotEmpty;

    final InputDecoration estiloPadrao = estilo ??
        Estilos.selecao.campo(
          context: context,
          habilitado: habilitado,
          textoTitulo: textoTitulo ?? Idiomas.current.tituloSelecionar,
          textoAjuda: (valorHabilitado) ? textoAjuda : null,
          textoErro: (valorHabilitado) ? textoErro : null,
          textoDica: (valorHabilitado) ? textoDica : null,
          textoPrefixo: textoPrefixo,
          textoSufixo: textoSufixo,
          componenteExterno: componenteExterno,
          componentePrefixo: componentePrefixo,
          componenteSufixo: componenteSufixo,
        );

    return DropdownButtonFormField<String>(
      focusNode: foco,
      autofocus: autoFoco ?? false,
      decoration: estiloPadrao,
      borderRadius: BorderRadius.circular(15),
      alignment: alinhamento ?? AlignmentDirectional.centerStart,
      onChanged: (valorHabilitado) ? aoMudar : null,
      onTap: aoTocar,
      onSaved: aoSalvar,
      validator: validacao,
      autovalidateMode: modoValidacao,
      menuMaxHeight: alturaMaxMenu,
      selectedItemBuilder: editarLista,
      items: listaItens.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Componentes.texto.padrao(
            texto: item,
            estilo: estiloTexto ??
                Estilos.texto.normal(
                  corTexto: Theme.of(context).primaryColor,
                  negrito: FontWeight.w500,
                  tamanho: 14,
                ),
          ),
        );
      }).toList(),
      value: valor,
    );
  }
}
