import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Pagina
class Pagina {
  final String caminho;
  final WidgetBuilder construtor;
  late Route materialRota;
  final List<String> tags;

  Pagina({
    required this.caminho,
    required this.construtor,
    required this.tags,
  }){
    materialRota = MaterialPageRoute(builder: construtor);
  }
  //////////////////////////////////////////////////////////////////////////////
  static Tags get tag => Tags();
}

// ----------------------------------------------------------------------------- Pagina Marcações
class $PaginaTags {
  $PaginaTags();
  ////////////////////////////////////////////////////////////////////////////// Definir Pagina Tags
  final String publica = "publica";
  final String restrita = "restrita";
  final String auth = "autenticação";
}
