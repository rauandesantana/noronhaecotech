import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';

class $ComTextoCampoCelular extends StatefulWidget {
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
  State<$ComTextoCampoCelular> createState() => _$ComTextoCampoCelularState();
}

class _$ComTextoCampoCelularState extends State<$ComTextoCampoCelular> {
  FocusNode foco = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.foco != null) foco = widget.foco!;
    widget.controlador._focoCelular = foco;
    widget.controlador._carregarLista(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        (widget.controlador.pais.id == "#")
            ? Container(width: 0)
            : Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () => widget.controlador._abrirGavetaInferior(
                    context,
                    setState,
                  ),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      width: 70,
                      padding: (Dispositivo.info.tipo == "mobile")
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
                            imagem: widget.controlador.pais.icone,
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
            habilitado: widget.habilitado,
            bloqueado: widget.bloqueado,
            botaoLimpar: widget.botaoLimpar,
            controlador: widget.controlador,
            foco: foco,
            autoFoco: widget.autoFoco,
            tipoTeclado: TextInputType.phone,
            acaoBotaoTeclado: widget.acaoBotaoTeclado,
            formatacao: (widget.controlador.pais.formato != "+")
                ? Estilos.texto.formatar(
                    formato: FormatosTexto(
                      valorFormato: widget.controlador.pais.formato,
                      caractereNumero: "_",
                    ),
                  )
                : null,
            textoTitulo: widget.textoTitulo ??
                Idiomas.of(context).tituloTextoCampoCelular,
            textoPrefixo: (widget.controlador.pais.id == "#")
                ? widget.controlador.pais.ddi
                : null,
            textoAjuda: widget.textoAjuda,
            textoErro: widget.textoErro,
            textoDica: (widget.controlador.pais.formato != "+")
                ? widget.textoDica ?? widget.controlador.pais.formato
                : widget.textoDica,
            componentePrefixo: Componentes.icone.padrao(
              iconePrimario: widget.iconePrefixo ?? Icons.phone_android_rounded,
            ),
            componenteSufixo: (widget.controlador.pais.id == "#")
                ? Componentes.botao.icone(
                    aoPrecionar: () => widget.controlador._abrirGavetaInferior(
                      context,
                      setState,
                    ),
                    alternarIcone: widget.controlador.gavetaInferior,
                    iconePrimario: Icons.keyboard_double_arrow_up_rounded,
                    iconeSecundario: Icons.keyboard_double_arrow_down_rounded,
                  )
                : null,
            menuTexto: widget.menuTexto,
          ),
        ),
      ],
    );
  }
}

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
      estadoGaveta: (estadoAtual) {
        if (estadoAtual) _listar(context);
        _gavetaInferior = estadoAtual;
        notifyListeners();
      },
      conteudo: (context, atualizar) => Column(
        children: <Widget>[
          // ------------------------------------------------------------------- Campo Buscar
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
                      aoPrecionar: () => Navigator.pop(context),
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
          // ------------------------------------------------------------------- Lista DDI Países
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, indice) => ListTile(
                onTap: () => atualizarPais(() {
                  _selecionar(context, _lista[indice]);
                }),
                leading: Componentes.imagem.arredondada(
                  arredondarBorda: BorderRadius.circular(10),
                  corImagem: _lista[indice].corIcone,
                  imagem: _lista[indice].icone,
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
                  texto: _lista[indice].nome,
                ),
                subtitle: Componentes.texto.padrao(
                  texto: _lista[indice].ddi,
                ),
              ),
              separatorBuilder: (context, indice) => const Divider(),
              itemCount: _lista.length,
            ),
          ),
        ],
      ),
    );
  }
}
