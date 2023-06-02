import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Controlador Celular
class ControladorCelular extends TextEditingController {
  final String? valorInicial;
  final List<dynamic> _listaBase = [];
  final List<DDI> _lista = [];
  DDI _pais = DDI.padrao;
  bool _gavetaInferior = false;
  FocusNode? focoCelular;

  DDI get pais => _pais;
  bool get gavetaInferior => _gavetaInferior;

  ControladorCelular({
    this.valorInicial,
  }) : super(text: valorInicial);

  void _selecionar(BuildContext context, DDI objeto) {
    if (_pais.id != objeto.id) {
      _pais = objeto;
      Navigator.pop(context);
      clear();
      focoCelular?.requestFocus();
    }
  }

  void carregarLista(BuildContext context) {
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

  abrirGavetaInferior(BuildContext context, StateSetter atualizarPais) {
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
                    ),
                  ),
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
                    textoTitulo: Idiomas.of(context).tituloBuscar,
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
