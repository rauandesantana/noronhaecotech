import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Configuração
class Configuracao {
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Definições
  final String tituloApp;
  final bool debugBanner;
  final ThemeData temaClaro;
  final ThemeData temaEscuro;
  final GlobalKey<NavigatorState> chaveNavegador;
  final Rotas rotas;
  final Iterable<Locale> idiomasSuportados;
  final Iterable<LocalizationsDelegate> idiomasDelegar;

  Configuracao({
    required this.tituloApp,
    this.debugBanner = false,
    required this.temaClaro,
    required this.temaEscuro,
    required this.chaveNavegador,
    required this.rotas,
    required this.idiomasSuportados,
    required this.idiomasDelegar,
  }) {
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
    Sistemas.firebase.auth.observadorAutenticacao(
      acaoLogado: (dados) {
        _observadorNavegador.navigator?.pushNamedAndRemoveUntil(
          dados["redirecionar"] ?? Paginas.acesso.principal.inicio.caminho,
          (rota) => false,
          arguments: dados,
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
    final logado = Sistemas.firebase.auth.logado;
    final caminhoAtual = rota.settings.name;
    if (logado == true && caminhoAtual == Paginas.acesso.rotaInicial.caminho) {
      Sistemas.dispositivo.aguardarRenderizacao((duracao) {
        rota.navigator?.pushNamedAndRemoveUntil(
          Paginas.acesso.principal.inicio.caminho,
          (rota) => false,
        );
      });
    } else {
      bool? tagRestrita;
      bool? tagAuth;
      Paginas.tags.forEach((caminho, tags) {
        if (caminho == caminhoAtual) {
          for (var tag in tags) {
            if (tag == Pagina.tag.restrita) tagRestrita = true;
            if (tag == Pagina.tag.auth) tagAuth = true;
          }
        }
      });
      if (logado == false && tagRestrita == true) {
        Sistemas.dispositivo.aguardarRenderizacao((duracao) {
          rota.navigator?.pushNamedAndRemoveUntil(
            Paginas.acesso.login.caminho,
            (rota) => false,
          );
        });
      } else if (logado == true && tagAuth == true) {
        Sistemas.dispositivo.aguardarRenderizacao((duracao) {
          rota.navigator?.pushNamedAndRemoveUntil(
            Paginas.acesso.principal.inicio.caminho,
            (rota) => false,
          );
        });
      }
    }
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
