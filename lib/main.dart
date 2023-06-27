import 'package:noronhaecotech/configuracoes/configuracao.dart';
import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

void main() {
  usePathUrlStrategy();


  runApp(const MaterialApp(
    home: Teste(),
  ),);


  // runApp(Paginas.carregamento);
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    //////////////////////////////////////////////////////////////////////////// Carregar Dependencias
    Idiomas.load(Idiomas.delegate.supportedLocales.first),
    Sistemas.firebase.inicializar,
    ////////////////////////////////////////////////////////////////////////////
    Future.delayed(const Duration(seconds: 200)),
    Future.delayed(const Duration(seconds: 2)),
  ]).whenComplete(() {
    //////////////////////////////////////////////////////////////////////////// Configuração
    final config = Configuracao(
      tituloApp: "Noronha EcoTech",
      temaClaro: Estilos.tema.claro,
      temaEscuro: Estilos.tema.escuro,
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

class Teste extends StatelessWidget {
  const Teste({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(

          )
        ],
      ),
    );
  }
}
