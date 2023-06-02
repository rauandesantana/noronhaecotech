import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

class $ComPaginaDeslizante extends StatelessWidget {
  final Axis? direcao;
  final bool? reverso;
  final ControladorPagina? controlador;
  final ScrollPhysics? rolagem;
  final void Function(int)? aoMudar;
  final List<Widget> conteudo;

  const $ComPaginaDeslizante({
    required Key? chave,
    required this.direcao,
    required this.reverso,
    required this.controlador,
    required this.rolagem,
    required this.aoMudar,
    required this.conteudo,
  }) : super(key: chave);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: direcao ?? Axis.horizontal,
      reverse: reverso ?? false,
      controller: controlador?.instancia,
      physics: rolagem,
      onPageChanged: (controlador != null) ? (indice) {
        controlador?.indiceAtual = indice;
        if (aoMudar != null) aoMudar!(indice);
      } : null,
      children: conteudo,
    );
  }
}
