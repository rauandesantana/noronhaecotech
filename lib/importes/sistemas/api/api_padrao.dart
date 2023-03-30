import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class $SisAPI {
  const $SisAPI();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- Navegador Padrão
  Future<dynamic> get({
    required String url,
  }) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return convert.jsonDecode(response.body);
      } else {
        throw response.statusCode;
      }
    } catch (erro) {
      return {"erro" : erro};
    }
  }
}
