import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

class LoginRapido extends StatefulWidget {
  const LoginRapido({Key? key}) : super(key: key);

  @override
  State<LoginRapido> createState() => _LoginRapidoState();
}

class _LoginRapidoState extends State<LoginRapido> {
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
