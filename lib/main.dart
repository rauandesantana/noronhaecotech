import 'package:noronhaecotech/configuracoes/configuracao.dart';
import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

void main() async {
  runApp(Paginas.carregamento);
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    //////////////////////////////////////////////////////////////////////////// Carregar Dependencias
    Idiomas.load(Idiomas.delegate.supportedLocales.first),
    Sistemas.firebase.inicializar,
    //  Future.delayed(const Duration(seconds: 30)),
    ////////////////////////////////////////////////////////////////////////////
  ]).whenComplete(() {
    //////////////////////////////////////////////////////////////////////////// Configuração
    final config = Configuracao(
      tituloApp: "Noronha EcoTech",
      temaClaro: Tema.claro,
      temaEscuro: Tema.escuro,
      chaveNavegador: GlobalKey<NavigatorState>(),
      rotas: Paginas.rotas,
      idiomasSuportados: Idiomas.delegate.supportedLocales,
      idiomasDelegar: const [
        Idiomas.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
    ////////////////////////////////////////////////////////////////////////////
    runApp(config.materialApp);
  });
}
