import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Componentes Dialogo Padrão
class $ComDialogoPadrao extends StatefulWidget {
  final VoidCallback? estadoInicial;
  final void Function(StateSetter)? estadoMontado;
  final void Function(StateSetter)? estadoDesmontado;
  final VoidCallback? estadoDescarte;
  final String titulo;
  final StatefulWidgetBuilder conteudo;

  const $ComDialogoPadrao({
    required Key? chave,
    required this.estadoInicial,
    required this.estadoMontado,
    required this.estadoDesmontado,
    required this.estadoDescarte,
    required this.titulo,
    required this.conteudo,
  }) : super(key: chave);

  @override
  State<$ComDialogoPadrao> createState() => _$ComDialogoPadraoState();
}

class _$ComDialogoPadraoState extends State<$ComDialogoPadrao> {
  @override
  void initState() {
    if (widget.estadoInicial != null) widget.estadoInicial!();
    Sistemas.dispositivo.aguardarRenderizacao((duracao) {
      if (widget.estadoMontado != null) widget.estadoMontado!(setState);
    });
    super.initState();
  }

  @override
  void deactivate() {
    if (widget.estadoDesmontado != null) widget.estadoDesmontado!(setState);
    super.deactivate();
  }

  @override
  void dispose() {
    if (widget.estadoDescarte != null) widget.estadoDescarte!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Estilos.cor(context).onBackground,
      insetPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 22.5),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            constraints: const BoxConstraints(
              maxWidth: 600,
              minWidth: 300,
              maxHeight: 800,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                StatefulBuilder(
                  builder: widget.conteudo,
                ),
              ],
            ),
          ),
          Positioned(
            top: -22.5,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 13, 20, 10),
              decoration: BoxDecoration(
                color: Estilos.cor(context).primary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Componentes.texto.padrao(
                texto: widget.titulo,
                estilo: Estilos.texto.titulo(
                  context: context,
                  corTexto: Estilos.cor(context).background,
                  escala: 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
