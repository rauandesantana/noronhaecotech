import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';

// ----------------------------------------------------------------------------- Componentes Texto Campo Celular
class $ComTextoCampoCelular extends StatelessWidget {
  final bool? habilitado;
  final bool? bloqueado;
  final bool? botaoLimpar;
  final ControladorCelular controlador;
  final FocusNode? foco;
  final bool? autoFoco;
  final TextInputAction? acaoBotaoTeclado;
  final String? textoTitulo;
  final String? textoAjuda;
  final String? textoErro;
  final String? textoDica;
  final IconData? iconePrefixo;
  final EditableTextContextMenuBuilder? menuTexto;

  const $ComTextoCampoCelular({
    Key? key,
    required this.habilitado,
    required this.bloqueado,
    required this.botaoLimpar,
    required this.controlador,
    required this.foco,
    required this.autoFoco,
    required this.acaoBotaoTeclado,
    required this.textoTitulo,
    required this.textoAjuda,
    required this.textoErro,
    required this.textoDica,
    required this.iconePrefixo,
    required this.menuTexto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode valorFoco = FocusNode();

    return Componentes.pagina.construtora(
      estadoInicial: () {
        if (foco != null) valorFoco = foco!;
        controlador._focoCelular = valorFoco;
        controlador._carregarLista(context);
      },
      construtor: (context, atualizar) {
        return Row(
          children: <Widget>[
            (controlador._pais.id == "#")
                ? Container(width: 0)
                : Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () => controlador._abrirGavetaInferior(
                        context,
                        atualizar,
                      ),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: 70,
                          padding: (Sistemas.dispositivo.info.tipo == "mobile")
                              ? const EdgeInsets.only(
                                  top: 11,
                                  bottom: 11,
                                  left: 10,
                                )
                              : const EdgeInsets.only(
                                  top: 7,
                                  bottom: 7,
                                  left: 10,
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
                                arredondarBorda: BorderRadius.circular(5),
                                imagem: controlador._pais.icone,
                                cacheLargura: 96,
                                cacheAltura: 64,
                                largura: 32,
                                altura: 22,
                              ),
                              Componentes.icone.padrao(
                                iconePrimario: Icons.arrow_drop_down_rounded,
                                corIcone: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: Componentes.texto.campoPadrao(
                habilitado: habilitado,
                bloqueado: bloqueado,
                botaoLimpar: botaoLimpar,
                controlador: controlador,
                foco: valorFoco,
                autoFoco: autoFoco,
                tipoTeclado: TextInputType.phone,
                acaoBotaoTeclado: acaoBotaoTeclado,
                formatacao: (controlador._pais.formato != "+")
                    ? Estilos.texto.formatar(
                        formato: FormatosTexto(
                          valorFormato: controlador._pais.formato,
                          caractereNumero: "_",
                        ),
                      )
                    : null,
                textoTitulo:
                    textoTitulo ?? Idiomas.of(context).tituloTextoCampoCelular,
                textoPrefixo: (controlador._pais.id == "#")
                    ? controlador._pais.ddi
                    : null,
                textoAjuda: textoAjuda,
                textoErro: textoErro,
                textoDica: (controlador._pais.formato != "+")
                    ? textoDica ?? controlador._pais.formato
                    : textoDica,
                componentePrefixo: Componentes.icone.padrao(
                  iconePrimario: iconePrefixo ?? Icons.phone_android_rounded,
                ),
                componenteSufixo: (controlador._pais.id == "#")
                    ? Componentes.botao.icone(
                        aoPrecionar: () => controlador._abrirGavetaInferior(
                          context,
                          atualizar,
                        ),
                        alternarIcone: controlador._gavetaInferior,
                        iconePrimario: Icons.keyboard_double_arrow_up_rounded,
                        iconeSecundario:
                            Icons.keyboard_double_arrow_down_rounded,
                      )
                    : null,
                menuTexto: menuTexto,
              ),
            ),
          ],
        );
      },
    );
  }
}

// ----------------------------------------------------------------------------- Controlador Celular
class ControladorCelular extends TextEditingController {
  final String? valorInicial;
  final List<dynamic> _listaBase = [];
  final List<DDI> _lista = [];
  DDI _pais = DDI.padrao;
  bool _gavetaInferior = false;
  FocusNode? _focoCelular;

  DDI get pais => _pais;
  bool get gavetaInferior => _gavetaInferior;

  ControladorCelular({
    this.valorInicial,
  }) : super(text: valorInicial);

  //////////////////////////////////////////////////////////////////////////////

  void _selecionar(BuildContext context, DDI objeto) {
    if (_pais.id != objeto.id) {
      _pais = objeto;
      Navigator.pop(context);
      clear();
      _focoCelular?.requestFocus();
    }
  }

  void _carregarLista(BuildContext context) {
    DDI.carregarJSON().then((json) {
      _listaBase.addAll(json.take(json.length));
      _listar(context);
    });
  }

  void _listar(BuildContext context, {String? buscar}) {
    _lista.clear();
    for (dynamic item in _listaBase) {
      String id = item["code"].toString().toLowerCase();
      if (_validacaoBusca(buscar, item)) {
        _lista.add(
          DDI(
            id: id,
            nome:
                (id == "#") ? Idiomas.of(context).tituloDDIOutro : item["name"],
            icone: (id == "#")
                ? Estilos.imagem.icones.globoPaises
                : "https://flagcdn.com/w320/$id.png",
            corIcone: (id == "#") ? Theme.of(context).primaryColor : null,
            ddi: item["dial_code"],
            formato: item["format"] ?? "_______________",
          ),
        );
      }
    }
  }

  bool _validacaoBusca(String? valor, dynamic item) {
    if (valor != null) {
      String valorBusca = valor.toLowerCase();
      bool id = item["code"].toLowerCase().contains(valorBusca);
      bool ddi = item["dial_code"].contains(valorBusca);
      bool nome = item["name"].toLowerCase().contains(valorBusca);
      return (id || ddi || nome || item["code"] == "#");
    } else {
      return true;
    }
  }

  _abrirGavetaInferior(BuildContext context, StateSetter atualizarPais) {
    Sistemas.navegador.abrirGavetaInferior(
      context: context,
      larguraMax: 400,
      estadoGaveta: (estadoAtual) {
        if (estadoAtual) _listar(context);
        _gavetaInferior = estadoAtual;
        notifyListeners();
      },
      conteudo: (context, atualizar) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: Center(
                    child: Componentes.botao.icone(
                      corIcone: Theme.of(context).scaffoldBackgroundColor,
                      aoPrecionar: () => Sistemas.navegador.voltar(context),
                      iconePrimario: Icons.arrow_back_rounded,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                  child: Componentes.texto.campoPadrao(
                    textoTitulo: Idiomas.of(context).tituloTextoCampoBuscar,
                    componentePrefixo: Componentes.icone.padrao(
                      iconePrimario: Icons.search_rounded,
                    ),
                    acaoBotaoTeclado: TextInputAction.search,
                    aoMudar: (texto) => atualizar(() {
                      if (texto.isNotEmpty) {
                        _listar(context, buscar: texto);
                      } else {
                        _listar(context);
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Componentes.selecao.lista(
              aoTocar: (indice, objeto) {
                atualizarPais(() => _selecionar(context, _lista[indice]));
              },
              listaItens: _lista.map((item) {
                return ObjetoSelecao.padrao(
                  prefixo: Componentes.imagem.arredondada(
                    arredondarBorda: BorderRadius.circular(10),
                    corImagem: item.corIcone,
                    imagem: item.icone,
                    cacheLargura: 150,
                    cacheAltura: 105,
                    largura: 50,
                    altura: 35,
                  ),
                  titulo: Componentes.texto.padrao(
                    estilo: Estilos.texto.titulo(
                      context: context,
                      escala: 4,
                    ),
                    texto: item.nome,
                  ),
                  subtitulo: Componentes.texto.padrao(
                    texto: item.ddi,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
