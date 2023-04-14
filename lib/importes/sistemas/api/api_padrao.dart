import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class $SisAPI {
  const $SisAPI();
  //////////////////////////////////////////////////////////////////////////////

  // --------------------------------------------------------------------------- API GET Padrão
  Future<dynamic> get({
    required String url,
  }) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return convert.jsonDecode(response.body);
      } else {
        throw response.statusCode.toString();
      }
    } catch (erro) {
      return erro.toString();
    }
  }
}
