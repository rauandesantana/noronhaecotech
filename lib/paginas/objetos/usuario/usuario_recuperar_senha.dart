import 'package:noronhaecotech/configuracoes/importar_tudo.dart';
import 'package:noronhaecotech/importes/modelos/firebase/modelos_codigo_acao.dart';

// ----------------------------------------------------------------------------- Principal Inicio
class UsuarioRecuperarSenha extends StatefulWidget {
  const UsuarioRecuperarSenha({Key? key}) : super(key: key);

  @override
  State<UsuarioRecuperarSenha> createState() => _UsuarioRecuperarSenhaState();
}

class _UsuarioRecuperarSenhaState extends State<UsuarioRecuperarSenha> {
  final campoSenha = ControladorSenha();
  final campoReSenha = ControladorSenha();
  CodigoAcao? codigoAcao;

  @override
  void initState() {
    Sistemas.dispositivo.aguardarRenderizacao((duracao) {
      final dados = Sistemas.navegador.recuperarDados(context);
      codigoAcao = dados["codigoAcao"];
    });

    campoSenha.instancia.addListener(() => setState(() {}));
    campoReSenha.instancia.addListener(() => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    campoSenha.instancia.dispose();
    campoReSenha.instancia.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final habilitarBotaoSalvar = (campoSenha.validarSenha.validar &&
        campoReSenha.validarSenha.validar &&
        campoSenha.senha == campoReSenha.senha);

    // =========================================================================== Ação Botão Cadastrar
    acaoBotaoSalvar() {
          Sistemas.firebase.auth
              .alterarSenha(context: context, senha: campoSenha.senha);
        };

    return Componentes.pagina.padrao(
      conteudo: (context, constraints, dispositivo) {
        return <Widget>[
          // ===================================================================== Escala P
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Componentes.pagina.rolagem(
              conteudo: Column(
                children: <Widget>[
                  // =========================================================== Formulário Alterar Senha
                  FormularioAlterarSenha(
                    habilitarBotaoSalvar: habilitarBotaoSalvar,
                    campoSenha: campoSenha,
                    campoReSenha: campoReSenha,
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
  final bool habilitarBotaoSalvar;
  final ControladorSenha campoSenha;
  final ControladorSenha campoReSenha;
  final VoidCallback acaoBotaoSalvar;

  const FormularioAlterarSenha({
    Key? key,
    required this.habilitarBotaoSalvar,
    required this.campoSenha,
    required this.campoReSenha,
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
        ),
        // ===================================================================== Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        // ===================================================================== Campo ReSenha
        Componentes.texto.campoSenha(
          autoValidar: true,
          tituloConfirmacao: true,
          aoValidar: (reSenha) {
            if (reSenha != campoSenha.senha) {
              return Idiomas.current.textoSenhaNaoCorresponde;
            } else {
              return null;
            }
          },
          acaoBotaoTeclado: TextInputAction.go,
          controlador: campoReSenha,
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
              habilitado: habilitarBotaoSalvar,
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
