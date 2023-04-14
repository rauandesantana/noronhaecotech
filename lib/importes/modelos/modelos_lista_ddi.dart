import 'package:flutter/services.dart';
import 'dart:convert' as convert;

class DDI {
  String id;
  String nome;
  String icone;
  String ddi;
  String formato;

  DDI({
    required this.id,
    required this.nome,
    required this.icone,
    required this.ddi,
    required this.formato,
  });
}

class ListaDDI {
  static Future<List<DDI>> carregarListaDDI() async {
    List<DDI> lista = [];
    final String arquivoJsonDDI = await rootBundle.loadString("assets/json/ddi.json");
    List listaDDI = convert.jsonDecode(arquivoJsonDDI) as List;
    for (var pais in listaDDI) {
      String id = pais["code"].toString().toLowerCase();
      lista.add(
        DDI(
          id: id,
          nome: pais["name"],
          icone: "https://flagcdn.com/w320/$id.png",
          ddi: pais["dial_code"],
          formato: pais["format"] ?? "###############",
        ),
      );
    }
    return lista;
  }
}
