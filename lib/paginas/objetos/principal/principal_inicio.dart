import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Principal Inicio
class PrincipalInicio extends StatelessWidget {
  const PrincipalInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Componentes.pagina.padrao(
      conteudo: <Widget>[
        // ===================================================================== Escala P
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Componentes.pagina.rolagem(
              conteudo: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Componentes.botao.elevado(
                    aoPrecionar: () => FirebaseAuth.instance.signOut(),
                    titulo: "sair",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
