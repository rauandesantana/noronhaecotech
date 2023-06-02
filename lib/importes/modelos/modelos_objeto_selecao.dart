import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Objeto Seleção
class ObjetoSelecao {
  final Widget? objeto;
  final Widget? prefixo;
  final Widget? titulo;
  final Widget? subtitulo;
  final Widget? sufixo;

  const ObjetoSelecao({
    required this.objeto,
  })  : prefixo = null,
        titulo = null,
        subtitulo = null,
        sufixo = null;

  const ObjetoSelecao.padrao({
    this.prefixo,
    required this.titulo,
    this.subtitulo,
    this.sufixo,
  }) : objeto = null;
  //////////////////////////////////////////////////////////////////////////////
}
