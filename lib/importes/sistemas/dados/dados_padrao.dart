import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

// ----------------------------------------------------------------------------- Sistemas Dados Padrao
class $SisDadosPadrao {
  $SisDadosPadrao();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Dados Salvar Chave
  Future<bool> salvarChave<T>({
    required String chave,
    required T valor,
  }) async {
    return await prefs.then((dados) async {
      switch (T) {
        case bool:
          return await dados.setBool(chave, valor as bool);
        case int:
          return await dados.setInt(chave, valor as int);
        case double:
          return await dados.setDouble(chave, valor as double);
        case String:
          return await dados.setString(chave, valor as String);
        case const (List<String>):
          return await dados.setStringList(chave, valor as List<String>);
        default:
          if (T.toString().startsWith("Map")) {
            return await _salvarObjeto(
              dados: dados,
              chave: chave,
              valor: valor as Map,
            );
          } else {
            return false;
          }
      }
    }).catchError((erro) {
      return false;
    });
  }

  // =========================================================================== Dados Recuperar Chave
  Future<T> recuperarChave<T>({
    required String chave,
    required T valorPadrao,
  }) async {
    return await prefs.then((dados) {
      switch (T) {
        case bool:
          return dados.getBool(chave);
        case int:
          return dados.getInt(chave);
        case double:
          return dados.getDouble(chave);
        case String:
          return dados.getString(chave);
        case const (List<String>):
          return dados.getStringList(chave);
        default:
          if (T.toString().startsWith("Map")) {
            return _recuperarObjeto(dados: dados, chave: chave);
          } else {
            return valorPadrao;
          }
      }
    }).then((valor) {
      return (valor as T) ?? valorPadrao;
    }).catchError((erro) {
      return valorPadrao;
    });
  }

  // =========================================================================== Dados Checar Chave
  Future<bool> checarChave({required String chave}) async {
    return await prefs.then((dados) {
      return dados.containsKey(chave);
    });
  }

  // =========================================================================== Dados Deletar Chave
  Future<bool> deletarChave({required String chave}) async {
    return await prefs.then((dados) {
      return dados.remove(chave);
    });
  }

  // =========================================================================== Dados Limpar
  Future<bool> limpar() async {
    return await prefs.then((dados) {
      return dados.clear();
    });
  }

  // =========================================================================== Metodo Salvar Objeto
  Future<bool> _salvarObjeto({
    required SharedPreferences dados,
    required String chave,
    required Map valor,
  }) async {
    final List<String> objeto = [];
    valor.forEach((chave, valor) {
      final textoChave = chave.toString();
      final textoTipo = valor.runtimeType.toString();
      final textoValor = valor.toString();
      objeto.add("($textoChave)<$textoTipo>{$textoValor}");
    });
    return await dados.setStringList(chave, objeto);
  }

  // =========================================================================== Metodo Recuperar Objeto
  Map? _recuperarObjeto({
    required SharedPreferences dados,
    required String chave,
  }) {
    final lista = dados.getStringList(chave);
    if (lista == null) return null;
    final regex = RegExp(r'(\(\w+\))(<[a-zA-Z]+>)(\{[\w\W]+\})');
    Map objeto = {};
    int contador = 0;
    for (var item in lista) {
      final resultado = regex.allMatches(item);
      for (var campo in resultado) {
        final g1 = campo[1];
        final g2 = campo[2];
        final g3 = campo[3];
        if (g1 != null && g2 != null && g3 != null) {
          final campoChave = g1.substring(1, g1.length - 1);
          final campoTipo = g2.substring(1, g2.length - 1);
          final campoValor = g3.substring(1, g3.length - 1);
          if (campoTipo.startsWith("String")) {
            objeto.addAll({campoChave: campoValor});
          } else if (campoTipo.startsWith("int")) {
            objeto.addAll({campoChave: int.parse(campoValor)});
          } else if (campoTipo.startsWith("double")) {
            objeto.addAll({campoChave: double.parse(campoValor)});
          } else if (campoTipo.startsWith("bool")) {
            objeto.addAll({campoChave: bool.parse(campoValor)});
          } else if (campoTipo.startsWith("Null")) {
            objeto.addAll({campoChave: null});
          } else {
            continue;
          }
          contador++;
        }
      }
    }
    if (contador != objeto.length) return null;
    return objeto;
  }
}
