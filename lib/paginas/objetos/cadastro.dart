import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Cadastro
class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final campoEmail = ControladorEmail();
  final campoSenha = ControladorSenha();
  final campoReSenha = ControladorSenha();

  @override
  void initState() {
    Sistemas.dispositivo.aguardarRenderizacao((duracao) {
      final dados = Sistemas.navegador.recuperarDados(context);
      campoEmail.email = dados["email"] ?? campoEmail.email;
      campoSenha.senha = dados["senha"] ?? campoSenha.senha;
    });
    campoEmail.instancia.addListener(() => setState(() {}));
    campoSenha.instancia.addListener(() => setState(() {}));
    campoReSenha.instancia.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    campoEmail.instancia.dispose();
    campoSenha.instancia.dispose();
    campoReSenha.instancia.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final habilitarBotaoCadastrar = (campoEmail.validarEmail &&
        campoSenha.validarSenha.validar &&
        campoReSenha.validarSenha.validar &&
        campoSenha.senha == campoReSenha.senha);

    // ========================================================================= Ação Botão Cadastrar
    acaoBotaoCadastrar() {
      if (habilitarBotaoCadastrar) {
        Sistemas.firebase.auth.cadastrarEmail(
          context: context,
          email: campoEmail.email,
          senha: campoSenha.senha,
        );
      }
    }

    return Componentes.pagina.padrao(
      conteudo: (context, constraints, dispositivo) {
        final alturaTotal = MediaQuery.sizeOf(context).height;
        final escalaLogo = (constraints.maxHeight / alturaTotal);
        return <Widget>[
          // =================================================================== Escala P
          Componentes.pagina.rolagem(
            ocultarBarra: true,
            centralizar: true,
            espacoInterno: const EdgeInsets.symmetric(horizontal: 25),
            conteudo: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                children: <Widget>[
                  // ----------------------------------------------------------- Logo Noronha EcoTech
                  LogoNoronhaEcoTech(escalaLogo: escalaLogo),
                  // ----------------------------------------------------------- Espaço
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  // ----------------------------------------------------------- Formulário Cadastro
                  FormularioCadastro(
                    habilitarBotaoCadastrar: habilitarBotaoCadastrar,
                    campoEmail: campoEmail,
                    campoSenha: campoSenha,
                    campoReSenha: campoReSenha,
                    acaoBotaoCadastrar: acaoBotaoCadastrar,
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

// ----------------------------------------------------------------------------- Logo Noronha EcoTech
class LogoNoronhaEcoTech extends StatelessWidget {
  final double escalaLogo;

  const LogoNoronhaEcoTech({
    super.key,
    required this.escalaLogo,
  });

  @override
  Widget build(BuildContext context) {
    const duracao = Duration(milliseconds: 400);
    final ocultar = escalaLogo < 0.6;
    final escala = (ocultar) ? 0.0 : escalaLogo;
    return AnimatedOpacity(
      duration: duracao,
      opacity: (ocultar) ? escala : 1.0,
      child: AnimatedContainer(
        duration: duracao,
        width: 350 * escala,
        height: 200 * escala,
        child: Componentes.imagem.padrao(
          imagem: Estilos.imagem.logos.noronhaEcoTech.r512,
          modoTema: true,
          largura: 350,
          altura: 200,
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------------- Formulário Cadastro
class FormularioCadastro extends StatelessWidget {
  final bool habilitarBotaoCadastrar;
  final ControladorEmail campoEmail;
  final ControladorSenha campoSenha;
  final ControladorSenha campoReSenha;
  final VoidCallback acaoBotaoCadastrar;

  const FormularioCadastro({
    Key? key,
    required this.habilitarBotaoCadastrar,
    required this.campoEmail,
    required this.campoSenha,
    required this.campoReSenha,
    required this.acaoBotaoCadastrar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // ===================================================================== Campo Email
        Componentes.texto.campoEmail(
          autoValidar: true,
          acaoBotaoTeclado: TextInputAction.next,
          controlador: campoEmail,
        ),
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
              habilitado: habilitarBotaoCadastrar,
              aoPrecionar: acaoBotaoCadastrar,
              titulo: Idiomas.current.tituloCadastrar,
            ),
            // ================================================================= Botão Voltar
            Componentes.botao.borda(
              aoPrecionar: () => Sistemas.navegador.voltar(context),
              titulo: Idiomas.current.tituloVoltar,
            ),
          ],
        ),
      ],
    );
  }
}
