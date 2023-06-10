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
          dados["redirecionar"] ?? Paginas.rotaLogado.caminho,
          (rota) => false,
          arguments: dados,
        );
      },
      acaoDeslogado: () {
        _observadorNavegador.navigator?.pushNamedAndRemoveUntil(
          Paginas.rotaDeslogado.caminho,
          (rota) => false,
        );
      },
    );
  }
  //////////////////////////////////////////////////////////////////////////////
  final RouteObserver<PageRoute> _observadorNavegador = ObservadorNavegador();
  final ComportamentoRolagem _comportamentoRolagem = ComportamentoRolagem();
  Pagina get rotaInicial => Paginas.rotaInicial;

  MaterialApp get materialApp {
    return MaterialApp(
      title: tituloApp,
      scrollBehavior: _comportamentoRolagem,
      debugShowCheckedModeBanner: debugBanner,
      navigatorKey: chaveNavegador,
      navigatorObservers: [_observadorNavegador],
      initialRoute: rotaInicial.caminho,
      routes: rotas,
      supportedLocales: idiomasSuportados,
      localizationsDelegates: idiomasDelegar,
      theme: temaClaro,
      darkTheme: temaEscuro,
    );
  }
}

// ----------------------------------------------------------------------------- Tema
class Tema {
  const Tema();
  //////////////////////////////////////////////////////////////////////////////
  // =========================================================================== Tema Claro
  static ThemeData get claro {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        backgroundColor: Colors.grey.shade100,
        cardColor: Colors.blue.shade100,
        primarySwatch: Colors.blue,
        accentColor: Colors.blue.shade300,
        errorColor: Colors.red,
      ),
    );
  }

  // =========================================================================== Tema Escuro
  static ThemeData get escuro {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        backgroundColor: Colors.grey.shade900,
        cardColor: Colors.grey.shade800,
        primarySwatch: Colors.grey,
        accentColor: Colors.grey.shade800,
        errorColor: Colors.red,
      ),
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
    bool? tagRestrita;
    bool? tagAuth;
    Paginas.tags.forEach((caminho, tags) {
      if (caminho == rota.settings.name) {
        for (var tag in tags) {
          if (tag == Pagina.tag.restrita) tagRestrita = true;
          if (tag == Pagina.tag.auth) tagAuth = true;
        }
      }
    });
    if (logado == false && tagRestrita == true) {
      Sistemas.dispositivo.aguardarRenderizacao((duracao) {
        rota.navigator?.pushNamedAndRemoveUntil(
          Paginas.rotaDeslogado.caminho,
          (rota) => false,
        );
      });
    } else if (logado == true && tagAuth == true) {
      Sistemas.dispositivo.aguardarRenderizacao((duracao) {
        rota.navigator?.pushNamedAndRemoveUntil(
          Paginas.rotaLogado.caminho,
          (rota) => false,
        );
      });
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
