import 'package:noronhaecotech/configuracoes/importar_tudo.dart';
import 'package:noronhaecotech/paginas/paginas_padrao.dart';

typedef AcaoObservardor = void Function(void Function());
typedef Rotas = Map<String, WidgetBuilder>;
typedef Restricoes = Map<String, List<String>>;
typedef Acesso = $PaginasPadrao;
typedef Tags = $PaginaTags;
typedef AcaoRenderizacao = void Function(Duration duracao);
typedef AcaoConexao = void Function(ConnectivityResult);
typedef ConteudoPaginaPadrao = List<Widget> Function(
  BuildContext,
  BoxConstraints,
  Dispositivo,
);
typedef BotaoRecuperarSenha = Widget Function(
  BuildContext context,
  BuildContext contextOriginal,
);
typedef ChecarRestricoesPagina = void Function({
  required String? caminho,
  bool? carregarPagina,
  Object? dados,
  required NavigatorState? navegador,
});
