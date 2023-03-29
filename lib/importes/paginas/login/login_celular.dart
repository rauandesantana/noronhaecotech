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
  final campoCelular = TextEditingController();
  final campoSenha = TextEditingController();
  final focoCelular = FocusNode();
  final focoSenha = FocusNode();
  bool efeitoBotaoGoogle = false;
  bool efeitoBotaoApple = false;
  bool efeitoBotaoFacebook = false;

  @override
  Widget build(BuildContext context) {
    bool? estadoTeclado = Sistemas.teclado.estado(context);
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // ----------------------------------------------------------- Espaço
                  const Padding(padding: EdgeInsets.only(top: 60)),
                  // ----------------------------------------------------------- Logo Noronha EcoTech
                  Componentes.imagem.padrao(
                    imagem: Estilos.imagem.logos.noronhaEcoTech.r512(context),
                    largura: 350,
                    altura: 250,
                  ),
                  // ----------------------------------------------------------- Formulário Login Celular
                  FormularioLoginCelular(
                    campoCelular: campoCelular,
                    campoSenha: campoSenha,
                    focoCelular: focoCelular,
                    focoSenha: focoSenha,
                  ),
                  // ----------------------------------------------------------- Espaço
                  const Padding(padding: EdgeInsets.only(top: 40)),
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
        // --------------------------------------------------------------------- Escala P
        Container(),
      ],
    );
  }
}

// ----------------------------------------------------------------------------- Formulário Login Celular
class FormularioLoginCelular extends StatelessWidget {
  final TextEditingController campoCelular;
  final TextEditingController campoSenha;
  final FocusNode focoCelular;
  final FocusNode focoSenha;
  const FormularioLoginCelular({
    Key? key,
    required this.campoCelular,
    required this.campoSenha,
    required this.focoCelular,
    required this.focoSenha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // --------------------------------------------------------------------- Campo Celular
        Componentes.texto.campoPadrao(
          textoTitulo: "Celular",
          controlador: campoCelular,
          foco: focoCelular,
          tipoTeclado: TextInputType.phone,
          acaoBotaoTeclado: TextInputAction.next,
          componentePrefixo: Componentes.icone.padrao(
            icone: Icons.phone_android_rounded,
          ),
        ),
        // --------------------------------------------------------------------- Espaço
        const Padding(padding: EdgeInsets.only(top: 10)),
        // --------------------------------------------------------------------- Campo Senha
        Componentes.texto.campoPadrao(
          textoTitulo: "Senha",
          controlador: campoSenha,
          foco: focoSenha,
          ocultarTexto: true,
          tipoTeclado: TextInputType.visiblePassword,
          acaoBotaoTeclado: TextInputAction.go,
          componentePrefixo: Componentes.icone.padrao(
            icone: Icons.password_rounded,
          ),
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
              aoPrecionar: () => {},
              titulo: "Entrar",
            ),
            // ----------------------------------------------------------------- Botão Cadastro
            Componentes.botao.borda(
              aoPrecionar: () => {},
              titulo: "Cadastre-se",
            ),
          ],
        ),
        // --------------------------------------------------------------------- Espaço
        const Padding(padding: EdgeInsets.only(top: 30)),
        // --------------------------------------------------------------------- Botão Recuperar Senha
        Componentes.botao.texto(
          aoPrecionar: () => {},
          titulo: "Recuperar Senha",
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
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 50),
      curve: Curves.linear,
      opacity: (estadoTeclado) ? 0.0 : 1.0,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutCirc,
              height: (estadoTeclado) ? 0 : 100,
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
                  Componentes.imagem.padrao(
                    aoTocar: acaoBotaoGoogle,
                    imagem: Estilos.imagem.logos.google,
                    ajuste: BoxFit.contain,
                    largura: 50,
                    altura: 50,
                  ),
                  // ----------------------------------------------------------- Botão Apple
                  Componentes.imagem.padrao(
                    aoTocar: acaoBotaoApple,
                    imagem: Estilos.imagem.logos.apple,
                    corImagem: Theme.of(context).primaryColor,
                    ajuste: BoxFit.contain,
                    largura: 50,
                    altura: 50,
                  ),
                  // ----------------------------------------------------------- Botão Facebook

                  Componentes.imagem.padrao(
                    aoTocar: acaoBotaoFacebook,
                    imagem: Estilos.imagem.logos.facebook,
                    ajuste: BoxFit.contain,
                    largura: 50,
                    altura: 50,
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
                texto: "Entrar com",
                estilo: Estilos.texto.decorativo(
                  corTexto: Theme.of(context).scaffoldBackgroundColor,
                  tamanho: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
