import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

class $ComPaginaRolagem extends StatelessWidget {
  final Axis? direcao;
  final bool? reverso;
  final bool? ocultarBarra;
  final bool? centralizar;
  final ScrollController? controlador;
  final ScrollPhysics? rolagem;
  final EdgeInsetsGeometry? espacoInterno;
  final Widget? conteudo;

  const $ComPaginaRolagem({
    required Key? chave,
    required this.direcao,
    required this.reverso,
    required this.ocultarBarra,
    required this.centralizar,
    required this.controlador,
    required this.rolagem,
    required this.espacoInterno,
    required this.conteudo,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    final ocultar = !(ocultarBarra ?? false);
    return (centralizar == true)
        ? LayoutBuilder(
            builder: (context, constraints) {
              return ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: ocultar,
                ),
                child: SingleChildScrollView(
                  scrollDirection: direcao ?? Axis.vertical,
                  reverse: reverso ?? false,
                  controller: controlador,
                  physics: rolagem,
                  padding: espacoInterno,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: constraints.maxHeight,
                    ),
                    child: Center(child: conteudo),
                  ),
                ),
              );
            },
          )
        : ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: ocultar,
            ),
            child: SingleChildScrollView(
              scrollDirection: direcao ?? Axis.vertical,
              reverse: reverso ?? false,
              controller: controlador,
              physics: rolagem,
              padding: espacoInterno,
              child: conteudo,
            ),
          );
  }
}
