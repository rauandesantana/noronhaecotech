import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';

class LoginCelular extends StatefulWidget {
  const LoginCelular({Key? key}) : super(key: key);

  @override
  State<LoginCelular> createState() => _LoginCelularState();
}

class _LoginCelularState extends State<LoginCelular> {
  final campoCelular = ControladorCelular();
  final campoSenha = TextEditingController();
  final focoCelular = FocusNode();
  final focoSenha = FocusNode();

  @override
  Widget build(BuildContext context) {
    bool? estadoTeclado = Sistemas.teclado.estado(context);
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
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ----------------------------------------------------------- Espaço
                  const Padding(padding: EdgeInsets.only(top: 60)),
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
                  // ----------------------------------------------------------- Formulário Login Celular
                  FormularioLoginCelular(
                    campoCelular: campoCelular,
                    campoSenha: campoSenha,
                    focoCelular: focoCelular,
                    focoSenha: focoSenha,
                    acaoBotaoEntrar: () => {},
                    acaoBotaoCadastrar: () => {},
                    acaoBotaoRecuperarSenha: () => {},
                  ),
                  // ----------------------------------------------------------- Espaço
                  Padding(
                    padding: (estadoTeclado)
                        ? EdgeInsets.zero
                        : const EdgeInsets.only(top: 40),
                  ),
                  // ----------------------------------------------------------- Botões Login Rápido
                  BotoesLoginRapido(
                    estadoTeclado: estadoTeclado,
                    acaoBotaoGoogle: () => {},
                    acaoBotaoApple: () => {},
                    acaoBotaoFacebook: () => {},
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

// ----------------------------------------------------------------------------- Formulário Login Celular
class FormularioLoginCelular extends StatelessWidget {
  final ControladorCelular campoCelular;
  final TextEditingController campoSenha;
  final FocusNode focoCelular;
  final FocusNode focoSenha;
  final void Function()? acaoBotaoEntrar;
  final void Function()? acaoBotaoCadastrar;
  final void Function()? acaoBotaoRecuperarSenha;

  const FormularioLoginCelular({
    Key? key,
    required this.campoCelular,
    required this.campoSenha,
    required this.focoCelular,
    required this.focoSenha,
    required this.acaoBotaoEntrar,
    required this.acaoBotaoCadastrar,
    required this.acaoBotaoRecuperarSenha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // --------------------------------------------------------------------- Campo Celular
        Componentes.texto.campoCelular(
          acaoBotaoTeclado: TextInputAction.next,
          controlador: campoCelular,
          foco: focoCelular,
        ),
        // --------------------------------------------------------------------- Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        // --------------------------------------------------------------------- Campo Senha
        Componentes.texto.campoSenha(
          acaoBotaoTeclado: TextInputAction.go,
          controlador: campoSenha,
          foco: focoSenha,
        ),
        // --------------------------------------------------------------------- Espaço
        const Padding(padding: EdgeInsets.only(top: 5)),
        Wrap(
          spacing: 25,
          runSpacing: 10,
          textDirection: TextDirection.rtl,
          alignment: WrapAlignment.spaceAround,
          children: <Widget>[
            // ----------------------------------------------------------------- Botão Entrar
            Componentes.botao.elevado(
              aoPrecionar: acaoBotaoEntrar,
              titulo: Idiomas.of(context).tituloBotaoEntrar,
            ),
            // ----------------------------------------------------------------- Botão Cadastrar
            Componentes.botao.borda(
              aoPrecionar: acaoBotaoCadastrar,
              titulo: Idiomas.of(context).tituloBotaoCadastrar,
            ),
          ],
        ),
        // --------------------------------------------------------------------- Espaço
        const Padding(padding: EdgeInsets.only(top: 30)),
        // --------------------------------------------------------------------- Botão Recuperar Senha
        Componentes.botao.texto(
          aoPrecionar: acaoBotaoRecuperarSenha,
          titulo: Idiomas.of(context).tituloBotaoRecuperarSenha,
        ),
      ],
    );
  }
}

// ----------------------------------------------------------------------------- Botões Login Rápido
class BotoesLoginRapido extends StatelessWidget {
  final bool estadoTeclado;
  final void Function()? acaoBotaoGoogle;
  final void Function()? acaoBotaoApple;
  final void Function()? acaoBotaoFacebook;

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
        duration: const Duration(milliseconds: 50),
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
                    // ----------------------------------------------------------- Botão Google
                    ClipOval(
                      child: Componentes.imagem.padrao(
                        aoTocar: acaoBotaoGoogle,
                        imagem: Estilos.imagem.logos.google,
                        ajuste: BoxFit.contain,
                        largura: 50,
                        altura: 50,
                      ),
                    ),
                    // ----------------------------------------------------------- Botão Apple
                    ClipOval(
                      child: Componentes.imagem.padrao(
                        aoTocar: acaoBotaoApple,
                        imagem: Estilos.imagem.logos.apple,
                        corImagem: Theme.of(context).primaryColor,
                        ajuste: BoxFit.contain,
                        largura: 50,
                        altura: 50,
                      ),
                    ),
                    // ----------------------------------------------------------- Botão Facebook
                    ClipOval(
                      child: Componentes.imagem.padrao(
                        aoTocar: acaoBotaoFacebook,
                        imagem: Estilos.imagem.logos.facebook,
                        ajuste: BoxFit.contain,
                        largura: 50,
                        altura: 50,
                      ),
                    )
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
                // --------------------------------------------------------------- Titulo Login Rápido
                child: Componentes.texto.padrao(
                  texto: Idiomas.of(context).tituloBotoesLoginRapido,
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
