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

  @override
  void initState() {
    Sistemas.dispositivo.aguardarRenderizacao((duracao) {
      final dados = Sistemas.navegador.recuperarDados(context);
      campoEmail.email = dados["email"] ?? campoEmail.email;
    });
    campoEmail.instancia.addListener(() => setState(() {}));
    campoSenha.instancia.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    campoEmail.instancia.dispose();
    campoSenha.instancia.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final habilitarBotaoEntrar =
        (campoEmail.validarEmail && campoSenha.validarSenha.validar);

    // ========================================================================= Ação Botão Entrar
    acaoBotaoEntrar() {
      if (habilitarBotaoEntrar) {
        Sistemas.firebase.auth.entrarEmail(
          context: context,
          email: campoEmail.email,
          senha: campoSenha.senha,
        );
      }
    }

    // ========================================================================= Ação Botão Cadastrar
    acaoBotaoCadastrar() => Sistemas.navegador.padrao(
          context: context,
          pagina: Paginas.acesso.cadastro,
        );

    // ========================================================================= Ação Botão Recuperar Senha
    acaoBotaoRecuperarSenha() => Sistemas.firebase.auth.recuperarSenha(
          context: context,
          email: campoEmail.email,
        );

    return Componentes.pagina.padrao(
      conteudo: (contexto, constraints, dispositivo) {
        final estadoTeclado = dispositivo.teclado.estado(this.context);
        final alturaTotal = MediaQuery.sizeOf(context).height;
        final escalaLogo = (constraints.maxHeight / alturaTotal);
        return <Widget>[
          // =================================================================== Escala P
          Componentes.pagina.rolagem(
            ocultarBarra: true,
            centralizar: true,
            espacoInterno: const EdgeInsets.symmetric(horizontal: 25),
            rolagem: const NeverScrollableScrollPhysics(),
            conteudo: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                children: <Widget>[
                  // ----------------------------------------------------------- Logo Noronha EcoTech
                  LogoNoronhaEcoTech(escalaLogo: escalaLogo),
                  // ----------------------------------------------------------- Espaço
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  // ----------------------------------------------------------- Formulário Login Padrão
                  FormularioLoginPadrao(
                    habilitarBotaoEntrar: habilitarBotaoEntrar,
                    campoEmail: campoEmail,
                    campoSenha: campoSenha,
                    acaoBotaoEntrar: acaoBotaoEntrar,
                    acaoBotaoCadastrar: acaoBotaoCadastrar,
                    acaoBotaoRecuperarSenha: acaoBotaoRecuperarSenha,
                  ),
                  // ----------------------------------------------------------- Espaço
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  // ----------------------------------------------------------- Botões Login Rápido
                  BotoesLoginRapido(estadoTeclado: estadoTeclado),
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

// ----------------------------------------------------------------------------- Formulário Login Padrão
class FormularioLoginPadrao extends StatelessWidget {
  final bool habilitarBotaoEntrar;
  final ControladorEmail campoEmail;
  final ControladorSenha campoSenha;
  final VoidCallback acaoBotaoEntrar;
  final VoidCallback acaoBotaoCadastrar;
  final VoidCallback acaoBotaoRecuperarSenha;

  const FormularioLoginPadrao({
    Key? key,
    required this.habilitarBotaoEntrar,
    required this.campoEmail,
    required this.campoSenha,
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
        ),
        // ===================================================================== Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        // ===================================================================== Campo Senha
        Componentes.texto.campoSenha(
          autoValidar: true,
          acaoBotaoTeclado: TextInputAction.go,
          controlador: campoSenha,
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

  const BotoesLoginRapido({
    Key? key,
    required this.estadoTeclado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: (estadoTeclado) ? 0 : 105,
      curve: Curves.easeOutCirc,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
        opacity: (estadoTeclado) ? 0.0 : 1.0,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 15),
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 2,
                    color: Estilos.cor(context).primary,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // ========================================================= Botão Google
                    Componentes.imagem.circular(
                      aoTocar: () =>
                          Sistemas.firebase.auth.entrarGoogle(context),
                      imagem: Estilos.imagem.logos.google,
                      ajuste: BoxFit.contain,
                      diametro: 50,
                    ),
                    // ========================================================= Botão Apple
                    Componentes.imagem.circular(
                      aoTocar: () =>
                          Sistemas.firebase.auth.entrarApple(context),
                      imagem: Estilos.imagem.logos.apple,
                      corImagem: Estilos.cor(context).primary,
                      ajuste: BoxFit.contain,
                      diametro: 50,
                    ),
                    // ========================================================= Botão Facebook
                    Componentes.imagem.circular(
                      aoTocar: () =>
                          Sistemas.firebase.auth.entrarFacebook(context),
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
                  bottom: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Estilos.cor(context).primary,
                ),
                // ============================================================= Titulo Login Rápido
                child: Componentes.texto.padrao(
                  texto: Idiomas.current.tituloEntrarCom,
                  estilo: Estilos.texto.decorativo(
                    corTexto: Estilos.cor(context).background,
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
