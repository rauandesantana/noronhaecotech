import 'package:flutter/services.dart';
import 'dart:convert' as convert;

class DDI {
  String id;
  String nome;
  String icone;
  Color? corIcone;
  String ddi;
  String formato;

  DDI({
    required this.id,
    required this.nome,
    required this.icone,
    required this.corIcone,
    required this.ddi,
    required this.formato,
  });

  static DDI get padrao => DDI(
        id: "br",
        nome: "Brasil",
        icone: "https://flagcdn.com/w320/br.png",
        corIcone: null,
        ddi: "+55",
        formato: "(##) #####-####",
      );

  static Future<List<dynamic>> carregarJSON() async {
    final String arquivoJsonDDI =
        await rootBundle.loadString("assets/json/ddi.json");
    List lista = convert.jsonDecode(arquivoJsonDDI) as List<dynamic>;
    return lista;
  }
}
