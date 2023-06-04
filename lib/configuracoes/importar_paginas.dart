import 'package:noronhaecotech/paginas/objetos/carregamento.dart';
////////////////////////////////////////////////////////////////////////////////
import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Paginas
class Paginas {
  Paginas();
  //////////////////////////////////////////////////////////////////////////////
  static Acesso get acesso => const Acesso();
  static Widget get carregamento => const Carregamento();
  static Pagina get rotaLogado => acesso.inicio;
  static Pagina get rotaDeslogado => acesso.login;
  static Pagina get rotaInicial =>
      (Sistemas.firebase.auth.logado) ? rotaLogado : rotaDeslogado;

  // =========================================================================== Lista de Paginas
  static List<Pagina> get _lista => [
        // ------------------------------------------------------------------------- Paginas Publicas
        acesso.login,
        acesso.cadastro,
        // ------------------------------------------------------------------------- Paginas Restritas
        acesso.inicio,
        acesso.recuperarSenha,
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
