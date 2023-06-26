import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

class RotaInicial extends StatefulWidget {
  const RotaInicial({super.key});

  @override
  State<RotaInicial> createState() => _RotaInicialState();
}

class _RotaInicialState extends State<RotaInicial> {

  @override
  Widget build(BuildContext context) {
    return Componentes.pagina.padrao(
      conteudo: (context, constraints, dispositivo) {
        return <Widget>[
          SizedBox.expand(
            child: Column(
              children: <Widget>[
                Componentes.imagem.padrao(
                  imagem: Estilos.imagem.logos.noronhaEcoTech.r512,
                  modoTema: true,
                ),

                Componentes.texto.padrao(
                  texto: "teste: ${dispositivo.plataforma}",
                ),
                Componentes.texto.padrao(
                  texto: "teste: ${dispositivo.tipo}",
                ),

                Componentes.botao.elevado(
                  aoPrecionar: () => Sistemas.navegador.padrao(
                    context: context,
                    fecharTodas: true,
                    pagina: Paginas.acesso.login,
                  ),
                  titulo: "entrar",
                ),
              ],
            ),
          ),
        ];
      },
    );
  }
}
