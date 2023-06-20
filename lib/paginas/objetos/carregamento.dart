import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

class Carregamento extends StatefulWidget {
  const Carregamento({Key? key}) : super(key: key);

  @override
  State<Carregamento> createState() => _CarregamentoState();
}

class _CarregamentoState extends State<Carregamento> {
  bool animacao = true;
  double rot = 0.0;

  void definirAnimacao(bool valor) {
    animacao = valor;
    if (valor) setState(() => rot--);
  }

  @override
  void initState() {
    Sistemas.dispositivo.aguardarRenderizacao(
      (duracao) => Future.delayed(
        const Duration(milliseconds: 500),
        () => definirAnimacao(animacao),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    definirAnimacao(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Estilos.cor(context).onBackground,
      child: Center(
        child: AnimatedRotation(
          duration: const Duration(milliseconds: 2000),
          curve: Curves.easeInOutBack,
          turns: rot,
          onEnd: () => Future.delayed(
            const Duration(milliseconds: 2000),
            () => definirAnimacao(animacao),
          ),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  Estilos.imagem.logos.noronhaEcoTech.r512(context),
                ),
              ),
            ),
            child: Componentes.carregamento.circular(),
          ),
        ),
      ),
    );
  }
}
