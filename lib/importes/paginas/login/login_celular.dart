import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

class LoginCelular extends StatefulWidget {
  const LoginCelular({Key? key}) : super(key: key);

  @override
  State<LoginCelular> createState() => _LoginCelularState();
}

class _LoginCelularState extends State<LoginCelular> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Componentes.pagina.padrao(
          conteudo: <Widget>[
            // ----------------------------------------------------------------- Escala P
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ----------------------------------------------------------- Logo Noronha EcoTech
                  Componentes.imagem.padrao(
                    imagem: Estilos.imagem.logos.noronhaEcoTech.r512(context),
                    largura: 350,
                    altura: 250,
                  ),

                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    textDirection: TextDirection.rtl,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceAround,
                    runAlignment: WrapAlignment.spaceAround,
                    children: <Widget>[
                      // ------------------------------------------------------- Botão Entrar
                      Componentes.botao.elevado(
                        aoPrecionar: () => {},
                        titulo: "Entrar",
                      ),
                      // ------------------------------------------------------- Botão Cadastro
                      Componentes.botao.borda(
                        aoPrecionar: () => {},
                        titulo: "Cadastrar-se",
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // ------------------------------------------------------- Botão Recuperar Senha
                      Componentes.botao.texto(
                        aoPrecionar: () => {},
                        titulo: "Recuperar Senha",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
