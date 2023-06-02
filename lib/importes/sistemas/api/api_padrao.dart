import 'package:noronhaecotech/configuracoes/importar_tudo.dart';
final http = Client();

// ----------------------------------------------------------------------------- Sistemas API Padrão
class $SisAPIPadrao {
  $SisAPIPadrao();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== API GET Padrão
  Future<dynamic> get({
    required String url,
  }) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw response.statusCode.toString();
      }
    } catch (erro) {
      return erro.toString();
    }
  }
}
