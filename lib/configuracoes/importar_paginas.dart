import 'package:noronhaecotech/paginas/objetos/carregamento.dart';
import 'package:noronhaecotech/paginas/objetos/offline.dart';
////////////////////////////////////////////////////////////////////////////////
import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Paginas
class Paginas {
  Paginas();
  //////////////////////////////////////////////////////////////////////////////
  static Acesso get acesso => const Acesso();
  static Widget get carregamento => const Carregamento();
  static Widget get offline => const Offline();
  static Pagina get rotaLogado => acesso.principal.inicio;
  static Pagina get rotaDeslogado => acesso.login;
  static Pagina get rotaInicial => acesso.rotaInicial;

  // =========================================================================== Lista de Paginas
  static List<Pagina> get _lista => [
        // ------------------------------------------------------------------------- Paginas Publicas
        acesso.rotaInicial,
        acesso.login,
        acesso.cadastro,
        // ------------------------------------------------------------------------- Paginas Restritas
        acesso.principal.inicio,
        acesso.usuario.recuperarSenha,
        acesso.usuario.perfil,
      ];

  // =========================================================================== Restrições
  static Restricoes get tags {
    return {for (var pagina in _lista) pagina.caminho: pagina.tags};
  }

  // =========================================================================== Rotas
  static Rotas get rotas {
    return {for (var pagina in _lista) pagina.caminho: pagina.construtor};
  }
}
