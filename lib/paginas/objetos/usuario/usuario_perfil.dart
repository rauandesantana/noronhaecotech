import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Principal Inicio
class UsuarioPerfil extends StatelessWidget {
  const UsuarioPerfil({Key? key}) : super(key: key);

  // =========================================================================== Ação Botão Cadastrar
  acaoBotaoSalvar() => {};

  @override
  Widget build(BuildContext context) {
    return Componentes.pagina.padrao(
      conteudo: (context, constraints, estadoTeclado) {
        return <Widget>[
          // =================================================================== Escala P
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Componentes.pagina.rolagem(
              conteudo: Column(
                children: <Widget>[
                  Componentes.botao.borda(
                    aoPrecionar: () => FirebaseAuth.instance.signOut(),
                    titulo: "sair",
                  ),
                ],
              ),
            ),
          ),
        ];
      },
    );
  }
}
