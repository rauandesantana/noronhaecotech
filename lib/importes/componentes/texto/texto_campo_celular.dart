import 'package:flutter/material.dart';
import 'package:noronhaecotech/idiomas/arquivos_gerados/l10n.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';

class $ComTextoCampoCelular extends StatefulWidget {
  final bool? habilitado;
  final bool? bloqueado;
  final bool? botaoLimpar;
  final TextEditingController? controlador;
  final FocusNode? foco;
  final TextInputAction? acaoBotaoTeclado;
  final String? textoTitulo;
  final String? textoAjuda;
  final String? textoErro;
  final String? textoDica;
  final String? textoSufixo;
  final IconData? iconePrefixo;
  final Widget? componenteSufixo;
  final void Function(DDI) valorDDI;

  const $ComTextoCampoCelular({
    Key? key,
    required this.habilitado,
    required this.bloqueado,
    required this.botaoLimpar,
    required this.controlador,
    required this.foco,
    required this.acaoBotaoTeclado,
    required this.textoTitulo,
    required this.textoAjuda,
    required this.textoErro,
    required this.textoDica,
    required this.textoSufixo,
    required this.iconePrefixo,
    required this.componenteSufixo,
    required this.valorDDI,
  }) : super(key: key);

  @override
  State<$ComTextoCampoCelular> createState() => _$ComTextoCampoCelularState();
}

class _$ComTextoCampoCelularState extends State<$ComTextoCampoCelular> {
  bool gavetaAberta = false;
  List<DDI> listaDDI = [];
  DDI ddiSelecionado = DDI(
    id: "br",
    nome: "Brasil",
    icone: "https://flagcdn.com/w320/br.png",
    ddi: "+55",
    formato: "(##) #####-####",
  );

  @override
  void initState() {
    super.initState();
    gavetaAberta = false;
    ListaDDI.carregarListaDDI().then((lista) => listaDDI = lista);
    widget.valorDDI(ddiSelecionado);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // --------------------------------------------------------------------- Campo Seleção
        GestureDetector(
          onTap: () => abrirGavetaInferior(),
          child: Container(
            width: 70,
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Componentes.imagem.arredondada(
                  largura: 32,
                  altura: 22,
                  cacheLargura: 96,
                  cacheAltura: 64,
                  arredondarBorda: BorderRadius.circular(5),
                  imagem: ddiSelecionado.icone,
                ),
                Componentes.icone.padrao(
                  icone: Icons.arrow_drop_down_rounded,
                ),
              ],
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: 10)),
        // --------------------------------------------------------------------- Campo Texto
        Expanded(
          child: Componentes.texto.campoPadrao(
              habilitado: widget.habilitado,
              bloqueado: widget.bloqueado,
              botaoLimpar: widget.botaoLimpar,
              controlador: widget.controlador,
              foco: widget.foco,
              tipoTeclado: TextInputType.phone,
              acaoBotaoTeclado: widget.acaoBotaoTeclado,
              formatacao: null,
              textoTitulo: widget.textoTitulo ??
                  Idiomas.of(context).tituloTextoCampoCelular,
              textoAjuda: widget.textoAjuda,
              textoErro: widget.textoErro,
              textoDica: widget.textoDica,
              textoPrefixo: ddiSelecionado.ddi,
              textoSufixo: widget.textoSufixo,
              componentePrefixo: Componentes.icone.padrao(
                icone: widget.iconePrefixo ?? Icons.phone_android_rounded,
              ),
              componenteSufixo: widget.componenteSufixo,
              aoPrecionar: () {
                if (gavetaAberta == true && Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              }),
        ),
      ],
    );
  }

  // --------------------------------------------------------------------------- Gaveta Inferior
  PersistentBottomSheetController abrirGavetaInferior() {
    ListaDDI.carregarListaDDI().then((lista) => listaDDI = lista);
    primaryFocus?.unfocus(disposition: UnfocusDisposition.scope);
    return Scaffold.of(context).showBottomSheet(
      (context) => Componentes.pagina.construtora(
        estadoInicial: (atualizar) => gavetaAberta = true,
        estadoDescarte: (atualizar) => gavetaAberta = false,
        construtor: (context, atualizar) {
          return Container(
            constraints: const BoxConstraints(maxHeight: 395),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: const [
                BoxShadow(offset: Offset(0, -1), blurRadius: 8),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: <Widget>[
                // ------------------------------------------------------------- Campo Buscar
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Componentes.texto.campoPadrao(
                    textoTitulo: "Buscar",
                    componentePrefixo: Componentes.icone.padrao(
                      icone: Icons.search_rounded,
                    ),
                    acaoBotaoTeclado: TextInputAction.search,
                    aoMudar: (texto) => atualizar(() {
                      if (texto.isNotEmpty) {
                        ListaDDI.buscarListaDDI(texto).then(
                          (lista) => listaDDI = lista,
                        );
                      } else {
                        ListaDDI.carregarListaDDI().then(
                          (lista) => listaDDI = lista,
                        );
                      }
                    }),
                  ),
                ),
                // ------------------------------------------------------------- Lista DDI Países
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, indice) => ListTile(
                      onTap: () {
                        setState(() {
                          ddiSelecionado = listaDDI[indice];
                          Navigator.pop(context);
                          widget.foco?.requestFocus();
                        });
                      },
                      leading: Componentes.imagem.arredondada(
                        arredondarBorda: BorderRadius.circular(10),
                        imagem: listaDDI[indice].icone,
                        cacheLargura: 150,
                        cacheAltura: 105,
                        largura: 50,
                        altura: 35,
                      ),
                      title: Componentes.texto.padrao(
                        estilo: Estilos.texto.titulo(
                          context: context,
                          escala: 4,
                        ),
                        texto: listaDDI[indice].nome,
                      ),
                      subtitle: Componentes.texto.padrao(
                        texto: listaDDI[indice].ddi,
                      ),
                    ),
                    separatorBuilder: (context, indice) => const Divider(),
                    itemCount: listaDDI.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
