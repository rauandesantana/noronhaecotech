import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Login
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final campoEmail = ControladorEmail();
  final campoSenha = ControladorSenha();
  final focoEmail = FocusNode();
  final focoSenha = FocusNode();

  @override
  void initState() {
    Sistemas.dispositivo.aguardarRenderizacao((p0) {
      final dados = Sistemas.navegador.recuperarDados(context);
      campoEmail.email = dados["email"] ?? campoEmail.email;
    });
    campoEmail.instancia.addListener(() => setState(() {}));
    campoSenha.instancia.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    campoEmail.instancia.removeListener(() {});
    campoSenha.instancia.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final estadoTeclado = Sistemas.dispositivo.estadoTeclado(context);
    final alturaTela = MediaQuery.of(context).size.height;
    final alturaAtual = alturaTela - MediaQuery.of(context).viewInsets.bottom;
    final escalaLogo = (alturaAtual / alturaTela);
    final habilitarBotaoEntrar =
        (campoEmail.validarEmail && campoSenha.validarSenha.validar);

    // =========================================================================== Ação Botão Entrar
    acaoBotaoEntrar() {
      if (habilitarBotaoEntrar) {
        Sistemas.firebase.auth.entrarEmail(
          context: context,
          email: campoEmail.email,
          senha: campoSenha.senha,
        );
      }
    }

    // =========================================================================== Ação Botão Cadastrar
    acaoBotaoCadastrar() => Sistemas.navegador.padrao(
          context: context,
          pagina: Paginas.acesso.cadastro,
        );

    // =========================================================================== Ação Botão Recuperar Senha
    acaoBotaoRecuperarSenha() => Sistemas.firebase.auth.recuperarSenha(
          context: context,
          email: (campoEmail.validarEmail) ? campoEmail.email : null,
        );

    // =========================================================================== Ação Botão Google
    acaoBotaoGoogle() => Sistemas.firebase.auth.entrarGoogle(context);

    // =========================================================================== Ação Botão Apple
    acaoBotaoApple() => Sistemas.firebase.auth.entrarApple(context);

    // =========================================================================== Ação Botão Facebook
    acaoBotaoFacebook() => Sistemas.firebase.auth.entrarFacebook(context);

    return Componentes.pagina.padrao(
      conteudo: <Widget>[
        // ===================================================================== Escala P
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Componentes.pagina.rolagem(
              rolagem: const NeverScrollableScrollPhysics(),
              conteudo: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // =========================================================== Espaço
                  AnimatedPadding(
                    duration: const Duration(milliseconds: 100),
                    padding: (estadoTeclado)
                        ? const EdgeInsets.only(top: 140)
                        : EdgeInsets.zero,
                  ),
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
                  // =========================================================== Formulário Login Padrão
                  FormularioLoginPadrao(
                    habilitarBotaoEntrar: habilitarBotaoEntrar,
                    campoEmail: campoEmail,
                    campoSenha: campoSenha,
                    focoEmail: focoEmail,
                    focoSenha: focoSenha,
                    acaoBotaoEntrar: acaoBotaoEntrar,
                    acaoBotaoCadastrar: acaoBotaoCadastrar,
                    acaoBotaoRecuperarSenha: acaoBotaoRecuperarSenha,
                  ),
                  // =========================================================== Espaço
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  // =========================================================== Espaço
                  AnimatedPadding(
                    duration: const Duration(milliseconds: 400),
                    padding: (estadoTeclado)
                        ? const EdgeInsets.only(top: 100)
                        : EdgeInsets.zero,
                  ),
                  // =========================================================== Botões Login Rápido
                  BotoesLoginRapido(
                    estadoTeclado: estadoTeclado,
                    acaoBotaoGoogle: acaoBotaoGoogle,
                    acaoBotaoApple: acaoBotaoApple,
                    acaoBotaoFacebook: acaoBotaoFacebook,
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

// ----------------------------------------------------------------------------- Formulário Login Padrão
class FormularioLoginPadrao extends StatelessWidget {
  final bool habilitarBotaoEntrar;
  final ControladorEmail campoEmail;
  final ControladorSenha campoSenha;
  final FocusNode focoEmail;
  final FocusNode focoSenha;
  final VoidCallback acaoBotaoEntrar;
  final VoidCallback acaoBotaoCadastrar;
  final VoidCallback acaoBotaoRecuperarSenha;

  const FormularioLoginPadrao({
    Key? key,
    required this.habilitarBotaoEntrar,
    required this.campoEmail,
    required this.campoSenha,
    required this.focoEmail,
    required this.focoSenha,
    required this.acaoBotaoEntrar,
    required this.acaoBotaoCadastrar,
    required this.acaoBotaoRecuperarSenha,
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
          foco: focoEmail,
        ),
        // ===================================================================== Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        // ===================================================================== Campo Senha
        Componentes.texto.campoSenha(
          autoValidar: true,
          acaoBotaoTeclado: TextInputAction.go,
          controlador: campoSenha,
          foco: focoSenha,
        ),
        // ===================================================================== Espaço
        const Padding(padding: EdgeInsets.only(top: 5)),
        Wrap(
          spacing: 25,
          runSpacing: 10,
          textDirection: TextDirection.rtl,
          alignment: WrapAlignment.spaceAround,
          children: <Widget>[
            // ================================================================= Botão Entrar
            Componentes.botao.elevado(
              habilitado: habilitarBotaoEntrar,
              aoPrecionar: acaoBotaoEntrar,
              titulo: Idiomas.current.tituloEntrar,
            ),
            // ================================================================= Botão Cadastrar
            Componentes.botao.borda(
              aoPrecionar: acaoBotaoCadastrar,
              titulo: Idiomas.current.tituloCadastrar,
            ),
          ],
        ),
        // ===================================================================== Espaço
        const Padding(padding: EdgeInsets.only(top: 30)),
        // ===================================================================== Botão Recuperar Senha
        Componentes.botao.texto(
          aoPrecionar: acaoBotaoRecuperarSenha,
          titulo: Idiomas.current.tituloRecuperarSenha,
        ),
      ],
    );
  }
}

// ----------------------------------------------------------------------------- Botões Login Rápido
class BotoesLoginRapido extends StatelessWidget {
  final bool estadoTeclado;
  final VoidCallback? acaoBotaoGoogle;
  final VoidCallback? acaoBotaoApple;
  final VoidCallback? acaoBotaoFacebook;

  const BotoesLoginRapido({
    Key? key,
    required this.estadoTeclado,
    required this.acaoBotaoGoogle,
    required this.acaoBotaoApple,
    required this.acaoBotaoFacebook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: (estadoTeclado) ? 0 : 100,
      curve: Curves.easeOutCirc,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
        opacity: (estadoTeclado) ? 0.0 : 1.0,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 15),
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // ========================================================= Botão Google
                    Componentes.imagem.circular(
                      aoTocar: acaoBotaoGoogle,
                      imagem: Estilos.imagem.logos.google,
                      ajuste: BoxFit.contain,
                      diametro: 50,
                    ),
                    // ========================================================= Botão Apple
                    Componentes.imagem.circular(
                      aoTocar: acaoBotaoApple,
                      imagem: Estilos.imagem.logos.apple,
                      corImagem: Theme.of(context).primaryColor,
                      ajuste: BoxFit.contain,
                      diametro: 50,
                    ),
                    // ========================================================= Botão Facebook
                    Componentes.imagem.circular(
                      aoTocar: acaoBotaoFacebook,
                      imagem: Estilos.imagem.logos.facebook,
                      ajuste: BoxFit.contain,
                      diametro: 50,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 7,
                  bottom: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                // ============================================================= Titulo Login Rápido
                child: Componentes.texto.padrao(
                  texto: Idiomas.current.tituloEntrarCom,
                  estilo: Estilos.texto.decorativo(
                    corTexto: Theme.of(context).scaffoldBackgroundColor,
                    tamanho: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
