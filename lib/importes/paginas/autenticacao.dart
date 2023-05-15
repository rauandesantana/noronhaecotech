import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

class Autenticacao extends StatefulWidget {
  const Autenticacao({Key? key}) : super(key: key);

  @override
  State<Autenticacao> createState() => _AutenticacaoState();
}

class _AutenticacaoState extends State<Autenticacao> {
  bool animacao = false;
  double rot = 0.0;

  void definirAnimacao(bool valor) {
    if (valor) setState(() => rot--);
    animacao = valor;
  }

  @override
  void initState() {
    super.initState();
    // ------------------------------------------------------------------------- Iniciar Animação
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future.delayed(
        const Duration(milliseconds: 500),
        () => definirAnimacao(true),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    definirAnimacao(false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
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
