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
  final focoNome = FocusNode();
  final focoCelular = FocusNode();
  final focoEmail = FocusNode();
  final focoSenha = FocusNode();
  final focoReSenha = FocusNode();

  @override
  void initState() {
    Sistemas.dispositivo.aguardarRenderizacao((p0) {
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
    campoNome.instancia.removeListener(() {});
    campoCelular.instancia.removeListener(() {});
    campoEmail.instancia.removeListener(() {});
    campoSenha.instancia.removeListener(() {});
    campoReSenha.instancia.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final alturaTela = MediaQuery.of(context).size.height;
    final alturaAtual = alturaTela - MediaQuery.of(context).viewInsets.bottom;
    final escalaLogo = (alturaAtual / alturaTela);
    final habilitarBotaoCadastrar = (campoNome.nome.isNotEmpty &&
        campoCelular.validarCelular &&
        campoEmail.validarEmail &&
        campoSenha.validarSenha.validar &&
        campoReSenha.validarSenha.validar &&
        campoSenha.senha == campoReSenha.senha);

    // =========================================================================== Ação Botão Cadastrar
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
                  // =========================================================== Logo Noronha EcoTech
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    width: 350 * escalaLogo,
                    height: 200 * escalaLogo,
                    child: Componentes.imagem.padrao(
                      imagem: Estilos.imagem.logos.noronhaEcoTech.r512(context),
                      largura: 350,
                      altura: 200,
                    ),
                  ),
                  // =========================================================== Espaço
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  // =========================================================== Formulário Cadastro
                  FormularioCadastro(
                    habilitarBotaoCadastrar: habilitarBotaoCadastrar,
                    campoNome: campoNome,
                    campoCelular: campoCelular,
                    campoEmail: campoEmail,
                    campoSenha: campoSenha,
                    campoReSenha: campoReSenha,
                    focoNome: focoNome,
                    focoCelular: focoCelular,
                    focoEmail: focoEmail,
                    focoSenha: focoSenha,
                    focoReSenha: focoReSenha,
                    acaoBotaoCadastrar: acaoBotaoCadastrar,
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

// ----------------------------------------------------------------------------- Formulário Cadastro
class FormularioCadastro extends StatelessWidget {
  final bool habilitarBotaoCadastrar;
  final ControladorNome campoNome;
  final ControladorCelular campoCelular;
  final ControladorEmail campoEmail;
  final ControladorSenha campoSenha;
  final ControladorSenha campoReSenha;
  final FocusNode focoNome;
  final FocusNode focoCelular;
  final FocusNode focoEmail;
  final FocusNode focoSenha;
  final FocusNode focoReSenha;
  final VoidCallback acaoBotaoCadastrar;

  const FormularioCadastro({
    Key? key,
    required this.habilitarBotaoCadastrar,
    required this.campoNome,
    required this.campoCelular,
    required this.campoEmail,
    required this.campoSenha,
    required this.campoReSenha,
    required this.focoNome,
    required this.focoCelular,
    required this.focoEmail,
    required this.focoSenha,
    required this.focoReSenha,
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
          foco: focoNome,
        ),
        // ===================================================================== Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        // ===================================================================== Campo Celular
        Componentes.texto.campoCelular(
          autoValidar: true,
          acaoBotaoTeclado: TextInputAction.next,
          controlador: campoCelular,
          foco: focoCelular,
        ),
        // ===================================================================== Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        // ===================================================================== Campo Email
        Componentes.texto.campoEmail(
          autoValidar: true,
          acaoBotaoTeclado: TextInputAction.next,
          controlador: campoEmail,
          foco: focoEmail,
        ),
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
          aoValidar: (reSenha) {
            if (reSenha != campoSenha.senha) {
              return Idiomas.current.textoSenhaNaoCorresponde;
            } else {
              return null;
            }
          },
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
