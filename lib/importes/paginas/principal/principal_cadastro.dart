import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

class PrincipalCadastro extends StatefulWidget {
  const PrincipalCadastro({Key? key}) : super(key: key);

  @override
  State<PrincipalCadastro> createState() => _PrincipalCadastroState();
}

class _PrincipalCadastroState extends State<PrincipalCadastro> {
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
