import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';

// ----------------------------------------------------------------------------- Principal Inicio
class PrincipalInicio extends StatelessWidget {
  const PrincipalInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Componentes.pagina.padrao(
      conteudo: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Componentes.botao.elevado(
                aoPrecionar: () => FirebaseAuth.instance.signOut(),
                titulo: "sair",
              ),
              Componentes.botao.borda(
                aoPrecionar: () => Sistemas.navegador.voltar(context),
                titulo: "voltar",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
