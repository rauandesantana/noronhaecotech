import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

class LoginCelular extends StatefulWidget {
  const LoginCelular({Key? key}) : super(key: key);

  @override
  State<LoginCelular> createState() => _LoginCelularState();
}

class _LoginCelularState extends State<LoginCelular> {
  @override
  Widget build(BuildContext context) {
    return Componentes.pagina.padrao(
      paginaIndisponivel: true,
      conteudo: <Widget>[
        Container(),
      ],
    );
  }
}
