import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- DDI
class DDI {
  final String id;
  final String nome;
  final String icone;
  final Color? corIcone;
  final String ddi;
  final String formato;
  final RegExp regex;

  const DDI({
    required this.id,
    required this.nome,
    required this.icone,
    required this.corIcone,
    required this.ddi,
    required this.formato,
    required this.regex,
  });
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== DDI Padrão
  static DDI get padrao => DDI(
        id: "br",
        nome: "Brasil",
        icone: "https://flagcdn.com/w320/br.png",
        corIcone: null,
        ddi: "+55",
        formato: "(__) _____-____",
        regex: RegExp(r'^[(][0-9]{2}[)] [0-9]{5}-[0-9]{4}$'),
      );

  // =========================================================================== DDI Carregar Json
  static Future<List<dynamic>> carregarJSON() async {
    final String arquivoJsonDDI =
        await rootBundle.loadString("assets/json/ddi.json");
    List lista = jsonDecode(arquivoJsonDDI) as List<dynamic>;
    return lista;
  }
}
