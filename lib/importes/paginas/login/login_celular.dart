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
    return Componentes.pagina.padrao(
      conteudo: <Widget>[
        // --------------------------------------------------------------------- Escala P
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ------------------------------------------------------------- Logo Noronha EcoTech
                Componentes.imagem.padrao(
                  imagem: Estilos.imagem.logos.noronhaEcoTech.r512(context),
                  largura: 350,
                  altura: 250,
                ),
                // ------------------------------------------------------------- Campo Celular
                Componentes.texto.campoPadrao(
                  textoTitulo: "Celular",
                  tipoTeclado: TextInputType.phone,
                  acaoBotaoTeclado: TextInputAction.next,
                  componentePrefixo: Componentes.icone.padrao(
                    icone: Icons.phone_android,
                  ),
                ),
                // ------------------------------------------------------------- Espaço
                const Padding(padding: EdgeInsets.only(top: 10)),
                // ------------------------------------------------------------- Campo Senha
                Componentes.texto.campoPadrao(
                  textoTitulo: "Senha",
                  ocultarTexto: true,
                  tipoTeclado: TextInputType.visiblePassword,
                  acaoBotaoTeclado: TextInputAction.go,
                  componentePrefixo: Componentes.icone.padrao(
                    icone: Icons.password,
                  ),
                ),
                // ------------------------------------------------------------- Espaço
                const Padding(padding: EdgeInsets.only(top: 5)),
                Wrap(
                  spacing: 25,
                  runSpacing: 10,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[

                    // --------------------------------------------------------- Botão Entrar
                    Componentes.botao.elevado(
                      aoPrecionar: () => {},
                      titulo: "Entrar",
                    ),
                    // --------------------------------------------------------- Botão Cadastro
                    Componentes.botao.borda(
                      aoPrecionar: () => {},
                      titulo: "Cadastre-se",
                    ),

                  ],
                ),
                // ------------------------------------------------------------- Espaço
                const Padding(padding: EdgeInsets.only(top: 40)),
                // ------------------------------------------------------------- Botão Recuperar Senha
                Componentes.botao.texto(
                  aoPrecionar: () => {},
                  titulo: "Recuperar Senha",
                ),






              ],
            ),
          ),
        ),
        // --------------------------------------------------------------------- Escala M
      ],
    );
  }
}
