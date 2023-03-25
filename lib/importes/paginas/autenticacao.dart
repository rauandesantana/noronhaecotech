import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';

class Autenticacao extends StatefulWidget {
  const Autenticacao({Key? key}) : super(key: key);

  @override
  State<Autenticacao> createState() => _AutenticacaoState();
}

class _AutenticacaoState extends State<Autenticacao> {
  @override
  void initState() {
    super.initState();
    // ------------------------------------------------------------------------- Autenticação Usuário
    Future.delayed(
      const Duration(seconds: 2),
      () => Sistemas.navegador.padrao(
        context: context,
        pagina: "/login",
        fecharAnterior: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
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
    );
  }
}
