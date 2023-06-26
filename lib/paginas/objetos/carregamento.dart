import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

class Carregamento extends StatefulWidget {
  const Carregamento({super.key});

  @override
  State<Carregamento> createState() => _CarregamentoState();
}

class _CarregamentoState extends State<Carregamento>
    with SingleTickerProviderStateMixin {
  late AnimationController _controlador;
  final curva = Curves.easeInOutQuart;

  void executarAnimacao() {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () => (!mounted) ? null : _controlador.animateTo(1, curve: curva),
    );
  }

  @override
  void initState() {
    super.initState();
    _controlador = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
      value: 0,
    )..animateTo(1, curve: curva);
    _controlador.addStatusListener((animacao) {
      if (animacao == AnimationStatus.completed) {
        _controlador.reset();
        executarAnimacao();
      }
    });
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "${Idiomas.current.tituloCarregando}...",
      theme: Estilos.tema.claro,
      darkTheme: Estilos.tema.escuro,
      home: Componentes.pagina.padrao(
        conteudo: (context, constraints, dispositivo) {
          return <Widget>[
            Center(
              child: Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                constraints:
                    const BoxConstraints(maxWidth: 200, maxHeight: 200),
                child: AnimatedBuilder(
                  animation: _controlador,
                  builder: (context, conteudo) {
                    return Transform.rotate(
                      angle: _controlador.value * (2.0 * pi),
                      child: conteudo,
                    );
                  },
                  child: Componentes.carregamento.circular(
                    conteudo: Componentes.imagem.padrao(
                      imagem: Estilos.imagem.logos.noronhaEcoTech.r512(context),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
      ),
    );
  }
}
