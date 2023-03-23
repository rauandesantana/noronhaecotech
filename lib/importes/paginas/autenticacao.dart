import 'package:flutter/material.dart';
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
      const Duration(seconds: 5),
          () => Sistemas.navegador.padrao(
        context: context,
        pagina: "/login",
        fecharAnterior: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
