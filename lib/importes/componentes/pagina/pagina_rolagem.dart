import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

class $ComPaginaRolagem extends StatelessWidget {
  final Axis? direcao;
  final bool? reverso;
  final bool? ocultarBarra;
  final ScrollController? controlador;
  final ScrollPhysics? rolagem;
  final Widget? conteudo;

  const $ComPaginaRolagem({
    required Key? chave,
    required this.direcao,
    required this.reverso,
    required this.ocultarBarra,
    required this.controlador,
    required this.rolagem,
    required this.conteudo,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    final ocultar = !(ocultarBarra ?? false);
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: ocultar),
      child: SingleChildScrollView(
        scrollDirection: direcao ?? Axis.vertical,
        reverse: reverso ?? false,
        controller: controlador,
        physics: rolagem,
        child: conteudo,
      ),
    );
  }
}
