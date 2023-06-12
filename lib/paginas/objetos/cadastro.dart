import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Cadastro
class Cadastro extends StatefulWidget {
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
  Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  @override
  void initState() {
    Sistemas.dispositivo.aguardarRenderizacao((duracao) {
      final dados = Sistemas.navegador.recuperarDados(context);
      widget.campoEmail.email = dados["email"] ?? widget.campoEmail.email;
      widget.campoSenha.senha = dados["senha"] ?? widget.campoSenha.senha;
    });
    widget.campoNome.instancia.addListener(() => setState(() {}));
    widget.campoCelular.instancia.addListener(() => setState(() {}));
    widget.campoEmail.instancia.addListener(() => setState(() {}));
    widget.campoSenha.instancia.addListener(() => setState(() {}));
    widget.campoReSenha.instancia.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    widget.campoNome.instancia.dispose();
    widget.campoCelular.instancia.dispose();
    widget.campoEmail.instancia.dispose();
    widget.campoSenha.instancia.dispose();
    widget.campoReSenha.instancia.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final alturaTela = MediaQuery.of(context).size.height;
    final alturaAtual = alturaTela - MediaQuery.of(context).viewInsets.bottom;
    final escalaLogo = (alturaAtual / alturaTela);
    final habilitarBotaoCadastrar = (widget.campoNome.nome.isNotEmpty &&
        widget.campoCelular.validarCelular &&
        widget.campoEmail.validarEmail &&
        widget.campoSenha.validarSenha.validar &&
        widget.campoReSenha.validarSenha.validar &&
        widget.campoSenha.senha == widget.campoReSenha.senha);

    // ========================================================================= Ação Botão Cadastrar
    acaoBotaoCadastrar() {
      if (habilitarBotaoCadastrar) {
        Sistemas.firebase.auth.cadastrarEmail(
          context: context,
          email: widget.campoEmail.email,
          senha: widget.campoSenha.senha,
          nomeCompleto: widget.campoNome.nome,
          celular: widget.campoCelular.celular,
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
                  // ----------------------------------------------------------- Logo Noronha EcoTech
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
                  // ----------------------------------------------------------- Espaço
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  // ----------------------------------------------------------- Formulário Cadastro
                  FormularioCadastro(
                    habilitarBotaoCadastrar: habilitarBotaoCadastrar,
                    campoNome: widget.campoNome,
                    campoCelular: widget.campoCelular,
                    campoEmail: widget.campoEmail,
                    campoSenha: widget.campoSenha,
                    campoReSenha: widget.campoReSenha,
                    focoNome: widget.focoNome,
                    focoCelular: widget.focoCelular,
                    focoEmail: widget.focoEmail,
                    focoSenha: widget.focoSenha,
                    focoReSenha: widget.focoReSenha,
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
