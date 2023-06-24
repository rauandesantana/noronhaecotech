import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Cadastro
class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final campoNome = ControladorNome();
  final campoCelular = ControladorCelular();
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
    campoNome.instancia.addListener(() => setState(() {}));
    campoCelular.instancia.addListener(() => setState(() {}));
    campoEmail.instancia.addListener(() => setState(() {}));
    campoSenha.instancia.addListener(() => setState(() {}));
    campoReSenha.instancia.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    campoNome.instancia.dispose();
    campoCelular.instancia.dispose();
    campoEmail.instancia.dispose();
    campoSenha.instancia.dispose();
    campoReSenha.instancia.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final habilitarBotaoCadastrar = (campoNome.nome.isNotEmpty &&
        campoCelular.validarCelular &&
        campoEmail.validarEmail &&
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
          nomeCompleto: campoNome.nome,
          celular: campoCelular.celular,
        );
      }
    }

    return Componentes.pagina.padrao(
      conteudo: (context, constraints, estadoTeclado) {
        final alturaTotal = MediaQuery.sizeOf(context).height;
        final escalaLogo = (constraints.maxHeight / alturaTotal);
        return <Widget>[
          // =================================================================== Escala P
          SizedBox.expand(
            child: Center(
              child: Componentes.pagina.rolagem(
                ocultarBarra: true,
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
                        campoNome: campoNome,
                        campoCelular: campoCelular,
                        campoEmail: campoEmail,
                        campoSenha: campoSenha,
                        campoReSenha: campoReSenha,
                        acaoBotaoCadastrar: acaoBotaoCadastrar,
                      ),
                    ],
                  ),
                ),
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
    final tipo = Sistemas.dispositivo.info.tipo;
    final web = tipo == Dispositivo.tipoWeb && escalaLogo < 1.0;
    double escala = (web || escalaLogo < 0.6) ? 0 : escalaLogo;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: 350 * escala,
      height: 200 * escala,
      child: Componentes.imagem.padrao(
        imagem: Estilos.imagem.logos.noronhaEcoTech.r512(context),
        largura: 350,
        altura: 200,
      ),
    );
  }
}

// ----------------------------------------------------------------------------- Formulário Cadastro
class FormularioCadastro extends StatelessWidget {
  final bool habilitarBotaoCadastrar;
  final ControladorNome campoNome;
  final ControladorCelular campoCelular;
  final ControladorEmail campoEmail;
  final ControladorSenha campoSenha;
  final ControladorSenha campoReSenha;
  final VoidCallback acaoBotaoCadastrar;

  const FormularioCadastro({
    Key? key,
    required this.habilitarBotaoCadastrar,
    required this.campoNome,
    required this.campoCelular,
    required this.campoEmail,
    required this.campoSenha,
    required this.campoReSenha,
    required this.acaoBotaoCadastrar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // ===================================================================== Campo Nome
        Componentes.texto.campoNome(
          autoValidar: true,
          tituloNomeCompleto: true,
          acaoBotaoTeclado: TextInputAction.next,
          controlador: campoNome,
        ),
        // ===================================================================== Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        // ===================================================================== Campo Celular
        Componentes.texto.campoCelular(
          autoValidar: true,
          acaoBotaoTeclado: TextInputAction.next,
          controlador: campoCelular,
        ),
        // ===================================================================== Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
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
