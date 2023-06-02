import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

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
            ],
          ),
        ),
      ],
    );
  }
}
