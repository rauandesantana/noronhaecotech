import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

class PrincipalInicio extends StatefulWidget {
  const PrincipalInicio({Key? key}) : super(key: key);

  @override
  State<PrincipalInicio> createState() => _PrincipalInicioState();
}

class _PrincipalInicioState extends State<PrincipalInicio> {
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
