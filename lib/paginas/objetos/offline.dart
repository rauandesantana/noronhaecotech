import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Offline
class Offline extends StatelessWidget {
  const Offline({super.key});

  @override
  Widget build(BuildContext context) {
    return Componentes.pagina.padrao(
      botaoPaginaIndisponivel: false,
      tituloPaginaIndisponivel: Idiomas.current.tituloSemInternet,
      conteudo: [],
    );
  }
}