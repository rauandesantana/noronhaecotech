import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';

// ----------------------------------------------------------------------------- Principal Inicio
class UsuarioRecuperarSenha extends StatelessWidget {
  const UsuarioRecuperarSenha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Componentes.pagina.padrao(
      conteudo: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Componentes.botao.borda(
                aoPrecionar: () => FirebaseAuth.instance.signOut(),
                titulo: "sair",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
