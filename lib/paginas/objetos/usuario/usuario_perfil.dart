import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Principal Inicio
class UsuarioPerfil extends StatefulWidget {
  const UsuarioPerfil({Key? key}) : super(key: key);

  @override
  State<UsuarioPerfil> createState() => _UsuarioPerfilState();
}

class _UsuarioPerfilState extends State<UsuarioPerfil> {
  // =========================================================================== Ação Botão Cadastrar
  acaoBotaoSalvar() => {};

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
                  Componentes.botao.texto(
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
