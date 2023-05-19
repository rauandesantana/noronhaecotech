import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

// ----------------------------------------------------------------------------- Sistemas Dados Padrao
class $SisDadosPadrao {
  $SisDadosPadrao();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Dados Salvar Chave
  void salvarChave<T>({
    required String chave,
    required T valor,
  }) {
    prefs.then((dados) {
      switch (T) {
        case bool:
          dados.setBool(chave, valor as bool);
          break;
        case int:
          dados.setInt(chave, valor as int);
          break;
        case double:
          dados.setDouble(chave, valor as double);
          break;
        case String:
          dados.setString(chave, valor as String);
          break;
        case List<String>:
          dados.setStringList(chave, valor as List<String>);
      }
    });
  }

  // =========================================================================== Dados Recuperar Chave
  Future<T?> recuperarChave<T>({
    required String chave,
    T? valorPadrao,
  }) async {
    return await prefs.then((dados) {
      switch (T) {
        case bool:
          return dados.getBool(chave) as bool;
        case int:
          return dados.getInt(chave) as int;
        case double:
          return dados.getDouble(chave) as double;
        case String:
          return dados.getString(chave) as String;
        case List<String>:
          return dados.getStringList(chave) as List<String>;
        case dynamic:
          return dados.get(chave) as dynamic;
        default:
          return valorPadrao;
      }
    }).then((valor) {
      return valor ?? valorPadrao;
    }).catchError((erro) {
      return valorPadrao;
    });
  }

  // =========================================================================== Dados Checar Chave
  Future<bool> checarChave({
    required String chave
}) async {
    return await prefs.then((dados) {
      return dados.containsKey(chave);
    });
  }




  // =========================================================================== Dados Deletar Chave
  Future<bool> deletarChave({
    required String chave
  }) async {
    return await prefs.then((dados) {
      return dados.remove(chave);
    });
  }

  // =========================================================================== Dados Limpar
  Future<bool> limpar({
    required String chave
  }) async {
    return await prefs.then((dados) {
      return dados.clear();
    });
  }

}
