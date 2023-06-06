import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Controlador Celular
class ControladorCelular extends ChangeNotifier {
  late TextEditingController _controlador;
  final String? textoInicial;
  FocusNode? focoCelular;
  final List<DDI> _listaBase = [];
  DDI _pais = DDI.padrao;
  bool _gavetaInferior = false;
  String _buscarGavetaInferior = "";

  ControladorCelular({
    this.textoInicial = "",
  }) {
    _controlador = TextEditingController(text: textoInicial);
  }
  //////////////////////////////////////////////////////////////////////////////
  TextEditingController get instancia => _controlador;
  DDI get pais => _pais;
  bool get gavetaInferior => _gavetaInferior;
  String get celular => _controlador.text;
  set celular(String celular) => _controlador.text = celular;
  TextEditingValue get valor => _controlador.value;
  int get tamanho => _controlador.text.length;
  TextSelection get selecao => _controlador.selection;
  void limpar() => _controlador.clear();

  String get celularCompleto {
    return _pais.ddi + _controlador.text.replaceAll(RegExp(r'\D'), "");
  }

  bool get validarCelular {
    return _pais.regex.hasMatch(_controlador.text);
  }

  void carregarLista(BuildContext context) {
    DDI.carregarJSON().then((json) {
      json.take(json.length).forEach((item) {
        String id = item["id"].toString().toLowerCase();
        String regexTexto = item["regex"] ?? "";
        _listaBase.add(
          DDI(
            id: id,
            nome: (id == "#") ? Idiomas.current.tituloDDIOutro : item["nome"],
            icone: (id == "#")
                ? Estilos.imagem.icones.globoPaises
                : "https://flagcdn.com/w320/$id.png",
            corIcone: (id == "#") ? Theme.of(context).primaryColor : null,
            ddi: item["ddi"],
            formato: item["formato"] ?? "+",
            regex: (regexTexto.isNotEmpty)
                ? RegExp(regexTexto)
                : RegExp(r'^[0-9]{8,}$'),
          ),
        );
      });
    });
  }

  void abrirGavetaInferior(BuildContext context, StateSetter atualizarPais) {
    Sistemas.navegador.abrirGavetaInferior(
      context: context,
      larguraMax: 400,
      estadoGaveta: (estadoAtual) {
        if (!estadoAtual) _buscarGavetaInferior = "";
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
                    textoTitulo: Idiomas.current.tituloBuscar,
                    componentePrefixo: Componentes.icone.padrao(
                      iconePrimario: Icons.search_rounded,
                    ),
                    acaoBotaoTeclado: TextInputAction.search,
                    aoMudar: (texto) => atualizar(() {
                      _buscarGavetaInferior = texto;
                    }),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Componentes.selecao.lista(
              aoTocar: (indice, objeto) {
                atualizarPais(
                  () => _selecionar(
                    context,
                    objeto.objetoOriginal as DDI,
                  ),
                );
              },
              listaItens: _listarPaises(context),
            ),
          ),
        ],
      ),
    );
  }

  List<ObjetoSelecao> _listarPaises(BuildContext context) {
    return _listaBase.where((item) {
      final textoBuscar = _buscarGavetaInferior.toLowerCase();
      if (textoBuscar.isNotEmpty) {
        bool checarID = item.id.toLowerCase().contains(textoBuscar);
        bool checarDDI = item.ddi.startsWith(textoBuscar, 1);
        bool checarNome = item.nome.toLowerCase().contains(textoBuscar);
        bool checarPadrao = item.id == "#";
        return (checarID || checarDDI || checarNome || checarPadrao);
      } else {
        return true;
      }
    }).map((item) {
      return ObjetoSelecao.padrao(
        objetoOriginal: item,
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
    }).toList();
  }

  void _selecionar(BuildContext context, DDI objeto) {
    if (_pais.id != objeto.id) {
      _pais = objeto;
      Navigator.pop(context);
      _controlador.clear();
      focoCelular?.requestFocus();
    }
  }
}
