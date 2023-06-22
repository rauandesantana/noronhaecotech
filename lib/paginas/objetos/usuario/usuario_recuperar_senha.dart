import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Principal Inicio
class UsuarioRecuperarSenha extends StatelessWidget {
  UsuarioRecuperarSenha({Key? key}) : super(key: key);
  final campoSenha = ControladorSenha();
  final campoReSenha = ControladorSenha();
  final focoSenha = FocusNode();
  final focoReSenha = FocusNode();

  // =========================================================================== Ação Botão Cadastrar
  acaoBotaoSalvar() => {};

  @override
  Widget build(BuildContext context) {
    return Componentes.pagina.padrao(
      conteudo: (context, constraints, estadoTeclado) {
        return <Widget>[
          // ===================================================================== Escala P
          Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Componentes.pagina.rolagem(
              conteudo: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // =========================================================== Formulário Alterar Senha
                  FormularioAlterarSenha(
                    campoSenha: campoSenha,
                    campoReSenha: campoReSenha,
                    focoSenha: focoSenha,
                    focoReSenha: focoReSenha,
                    acaoBotaoSalvar: acaoBotaoSalvar,
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

// ----------------------------------------------------------------------------- Formulario Alterar Senha
class FormularioAlterarSenha extends StatelessWidget {
  final ControladorSenha campoSenha;
  final ControladorSenha campoReSenha;
  final FocusNode focoSenha;
  final FocusNode focoReSenha;
  final VoidCallback acaoBotaoSalvar;

  const FormularioAlterarSenha({
    Key? key,
    required this.campoSenha,
    required this.campoReSenha,
    required this.focoSenha,
    required this.focoReSenha,
    required this.acaoBotaoSalvar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // ===================================================================== Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        // ===================================================================== Campo Senha
        Componentes.texto.campoSenha(
          autoValidar: true,
          acaoBotaoTeclado: TextInputAction.next,
          controlador: campoSenha,
          foco: focoSenha,
        ),
        // ===================================================================== Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        // ===================================================================== Campo ReSenha
        Componentes.texto.campoSenha(
          autoValidar: true,
          tituloConfirmacao: true,
          acaoBotaoTeclado: TextInputAction.next,
          controlador: campoReSenha,
          foco: focoReSenha,
        ),
        // ===================================================================== Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        Wrap(
          spacing: 25,
          runSpacing: 10,
          textDirection: TextDirection.rtl,
          alignment: WrapAlignment.spaceAround,
          children: <Widget>[
            // ================================================================= Botão Cadastrar
            Componentes.botao.elevado(
              aoPrecionar: acaoBotaoSalvar,
              titulo: Idiomas.current.tituloSalvar,
            ),
            // ================================================================= Botão Voltar
            Componentes.botao.borda(
              aoPrecionar: () => Sistemas.navegador.padrao(
                context: context,
                pagina: Paginas.acesso.usuario.perfil,
                fecharTodas: true,
              ),
              titulo: Idiomas.current.tituloVoltar,
            ),
          ],
        ),
      ],
    );
  }
}
