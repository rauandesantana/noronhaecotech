import 'package:noronhaecotech/configuracoes/importar_tudo.dart';
import 'package:noronhaecotech/importes/modelos/firebase/modelos_codigo_acao.dart';

// ----------------------------------------------------------------------------- Configuração
class Configuracao {
  //////////////////////////////////////////////////////////////////////////////
  // =========================================================================== Definições
  final String acaoURL;
  final String tituloApp;
  final bool debugBanner;
  final ThemeData temaClaro;
  final ThemeData temaEscuro;
  final GlobalKey<NavigatorState> chaveNavegador;
  final Rotas rotas;
  final Iterable<Locale> idiomasSuportados;
  final Iterable<LocalizationsDelegate> idiomasDelegar;

  Configuracao({
    required this.acaoURL,
    required this.tituloApp,
    this.debugBanner = false,
    required this.temaClaro,
    required this.temaEscuro,
    required this.chaveNavegador,
    required this.rotas,
    required this.idiomasSuportados,
    required this.idiomasDelegar,
  }) {
    _checarAcaoURL;
    _observarConexao;
    _observarAutenticacao;
  }
  //////////////////////////////////////////////////////////////////////////////
  final RouteObserver<PageRoute> _observadorNavegador = ObservadorNavegador();
  final ComportamentoRolagem _comportamentoRolagem = ComportamentoRolagem();

  MaterialApp get materialApp {
    return MaterialApp(
      title: tituloApp,
      scrollBehavior: _comportamentoRolagem,
      debugShowCheckedModeBanner: debugBanner,
      navigatorKey: chaveNavegador,
      navigatorObservers: [_observadorNavegador],
      initialRoute: Paginas.acesso.rotaInicial.caminho,
      routes: rotas,
      supportedLocales: idiomasSuportados,
      localizationsDelegates: idiomasDelegar,
      theme: temaClaro,
      darkTheme: temaEscuro,
    );
  }

  void get _checarAcaoURL {
    if (acaoURL == "/" || acaoURL.isEmpty) return;
    if (acaoURL.startsWith("/acao?")) {
      final checarAcaoURL = Sistemas.firebase.auth.checarAcaoURL(
        acaoURL: acaoURL.replaceAll("/acao?", ""),
        navegador: _observadorNavegador.navigator,
      );
      checarAcaoURL.then((codigoAcao) {
        if (_observadorNavegador.navigator != null) {
          _observadorNavegador.navigator?.pushNamedAndRemoveUntil(
            Paginas.acesso.usuario.recuperarSenha.caminho,
            (rota) => false,
            arguments: {"codigoAcao": codigoAcao},
          );
        } else {
          Sistemas.dispositivo.aguardarRenderizacao((duracao) {
            _observadorNavegador.navigator?.pushNamedAndRemoveUntil(
              Paginas.acesso.usuario.recuperarSenha.caminho,
              (rota) => false,
              arguments: {"codigoAcao": codigoAcao},
            );
          });
        }
      });
    } else if (Paginas.rotas.containsKey(acaoURL)) {
      Sistemas.dispositivo.aguardarRenderizacao((duracao) {
        _checarRestricoesPagina(
          caminho: acaoURL,
          navegador: _observadorNavegador.navigator,
          carregarPagina: true,
        );
      });
    }
  }

  void get _observarConexao {
    Sistemas.dispositivo.observadorConexao(
      conexoesPermitidas: [
        ConnectivityResult.ethernet,
        ConnectivityResult.wifi,
        ConnectivityResult.mobile
      ],
      acaoConectado: (conexao) {
        final voltar = _observadorNavegador.navigator?.canPop();
        if (voltar == true) _observadorNavegador.navigator?.pop();
      },
      acaoDesconectado: (conexao) {
        final pagina = MaterialPageRoute(builder: (context) => Paginas.offline);
        _observadorNavegador.navigator?.push(pagina);
      },
    );
  }

  void get _observarAutenticacao {
    Sistemas.firebase.auth.observadorAutenticacao(
      acaoLogado: () {
        _observadorNavegador.navigator?.pushNamedAndRemoveUntil(
          Paginas.acesso.principal.inicio.caminho,
          (rota) => false,
        );
      },
      acaoDeslogado: () {
        _observadorNavegador.navigator?.pushNamedAndRemoveUntil(
          Paginas.acesso.login.caminho,
          (rota) => false,
        );
      },
    );
  }
}

class ComportamentoRolagem extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

// ----------------------------------------------------------------------------- Observador Navegador
class ObservadorNavegador extends RouteObserver<PageRoute> {
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Observador
  void _observador(PageRoute rota) {
    final caminhoAtual = rota.settings.name;
    Sistemas.dados.recuperarChave(
      chave: Sistemas.navegador.chaveDadosRedirecionar,
      valorPadrao: {},
    ).then((dados) {
      final String? redirecionar = dados["redirecionar"];
      if (redirecionar != null && caminhoAtual != redirecionar) {
        Sistemas.navegador.limparRedirecionamento();
        _checarRestricoesPagina(
          caminho: redirecionar,
          navegador: rota.navigator,
          carregarPagina: true,
          dados: dados,
        );
      }
    });
    _checarRestricoesPagina(
      caminho: caminhoAtual,
      navegador: rota.navigator,
      dados: rota.settings.arguments,
    );
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _observador(route);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _observador(newRoute);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _observador(previousRoute);
    }
  }
}

void _checarRestricoesPagina({
  required String? caminho,
  required NavigatorState? navegador,
  bool? carregarPagina,
  Object? dados,
}) {
  final dadosMapa = dados as Map<String, dynamic>?;
  final codigoAcao = (dadosMapa)?["codigoAcao"] as CodigoAcao?;
  if (caminho != null && codigoAcao != null) {
    return;
  } else {
    final logado = Sistemas.firebase.auth.logado;
    bool? tagRestrita;
    bool? tagAuth;
    Paginas.tags.forEach((caminhoTags, tags) {
      if (caminhoTags == caminho) {
        for (String tag in tags) {
          if (tag == Pagina.tag.restrita) tagRestrita = true;
          if (tag == Pagina.tag.auth) tagAuth = true;
        }
      }
    });
    if (caminho == null || (logado == false && tagRestrita == true)) {
      Sistemas.dispositivo.aguardarRenderizacao((duracao) {
        navegador?.pushNamedAndRemoveUntil(
          Paginas.acesso.login.caminho,
          (rota) => false,
        );
      });
    } else if (logado == true && tagAuth == true) {
      Sistemas.dispositivo.aguardarRenderizacao((duracao) {
        navegador?.pushNamedAndRemoveUntil(
          Paginas.acesso.principal.inicio.caminho,
          (rota) => false,
        );
      });
    } else if (carregarPagina == true) {
      Sistemas.dispositivo.aguardarRenderizacao((duracao) {
        navegador?.pushNamedAndRemoveUntil(
          caminho,
          (rota) => false,
          arguments: dados,
        );
      });
    }
  }
}
