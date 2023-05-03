import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';

class PrincipalCadastro extends StatefulWidget {
  const PrincipalCadastro({Key? key}) : super(key: key);

  @override
  State<PrincipalCadastro> createState() => _PrincipalCadastroState();
}

class _PrincipalCadastroState extends State<PrincipalCadastro> {
  final campoNome = TextEditingController();
  final campoCelular = ControladorCelular();
  final campoEmail = TextEditingController();
  final campoSenha = TextEditingController();
  final campoReSenha = TextEditingController();
  final focoNome = FocusNode();
  final focoCelular = FocusNode();
  final focoEmail = FocusNode();
  final focoSenha = FocusNode();
  final focoReSenha = FocusNode();

  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    double alturaAtual = alturaTela - MediaQuery.of(context).viewInsets.bottom;
    double escalaLogo = (alturaAtual / alturaTela);

    return Componentes.pagina.padrao(
      conteudo: <Widget>[
        // --------------------------------------------------------------------- Escala P
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
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
                    acaoBotaoCadastrar: () => {},
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
  final TextEditingController campoNome;
  final ControladorCelular campoCelular;
  final TextEditingController campoEmail;
  final TextEditingController campoSenha;
  final TextEditingController campoReSenha;
  final FocusNode focoNome;
  final FocusNode focoCelular;
  final FocusNode focoEmail;
  final FocusNode focoSenha;
  final FocusNode focoReSenha;
  final VoidCallback? acaoBotaoCadastrar;

  const FormularioCadastro({
    Key? key,
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
        Componentes.texto.campoNome(
          acaoBotaoTeclado: TextInputAction.next,
          controlador: campoNome,
          foco: focoNome,
        ),
        // ----------------------------------------------------------- Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        Componentes.texto.campoCelular(
          acaoBotaoTeclado: TextInputAction.next,
          controlador: campoCelular,
          foco: focoCelular,
        ),
        // ----------------------------------------------------------- Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        Componentes.texto.campoEmail(
          acaoBotaoTeclado: TextInputAction.next,
          controlador: campoEmail,
          foco: focoEmail,
        ),
        // ----------------------------------------------------------- Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        Componentes.texto.campoSenha(
          acaoBotaoTeclado: TextInputAction.next,
          controlador: campoSenha,
          foco: focoSenha,
        ),
        // ----------------------------------------------------------- Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        Componentes.texto.campoSenha(
          tituloConfirmacao: true,
          acaoBotaoTeclado: TextInputAction.next,
          controlador: campoReSenha,
          foco: focoReSenha,
        ),
        // ----------------------------------------------------------- Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        Wrap(
          spacing: 25,
          runSpacing: 10,
          textDirection: TextDirection.rtl,
          alignment: WrapAlignment.spaceAround,
          children: <Widget>[
            Componentes.botao.elevado(
              aoPrecionar: () => acaoBotaoCadastrar,
              titulo: Idiomas.of(context).tituloBotaoCadastrar,
            ),
            Componentes.botao.borda(
              aoPrecionar: () => Sistemas.navegador.voltar(context),
              titulo: Idiomas.of(context).tituloBotaoVoltar,
            ),
          ],
        ),
      ],
    );
  }
}
