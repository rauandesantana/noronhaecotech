import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Sistemas Firebase Dados
class $SisFirebaseDados {
  final FirebaseFirestore instancia = FirebaseFirestore.instance;

  $SisFirebaseDados();
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Criar Dados
  Future<bool> salvarDados({required Dados dados}) async {
    if (dados.id == null) return false;
    try {
      final documento = dados.colecao.doc(dados.id);
      final objeto = dados.objetoSalvar;
      if (dados.criar == true) {
        return await documento.set(objeto).then((_) => true);
      } else {
        return await documento.update(objeto).then((_) => true);
      }
    } catch (erro) {
      Sistemas.dispositivo.reportarErro(
        erro: erro,
        local: ["Sistemas", "FirebaseDados"],
        verificacao: "salvarDados",
      );
      return false;
    }
  }

  // =========================================================================== Recuperar Dados
  Future<T?> recuperarDados<T>({required T dadosRecuperar}) async {
    dadosRecuperar as Dados;
    final documento = dadosRecuperar.colecao.doc(dadosRecuperar.id);
    return await documento.get().then((resposta) {
      if (!resposta.exists) return null;
      var dados = resposta.data() as Map<String, dynamic>?;
      if (dados == null) return null;
      return dadosRecuperar.converterObjeto<T>(dados);
    }).catchError((erro) {
      Sistemas.dispositivo.reportarErro(
        erro: erro,
        local: ["Sistemas", "FirebaseDados"],
        verificacao: "recuperarDados",
      );
      return null;
    });
  }

  // =========================================================================== Observar Alterações
  Stream<T> observarAlteracoes<T>({required T dadosRecuperar}) {
    dadosRecuperar as Dados;
    final documento = dadosRecuperar.colecao.doc(dadosRecuperar.id);
    return documento.snapshots().map((resposta) {
      var dados = resposta.data() as Map<String, dynamic>;
      return dadosRecuperar.converterObjeto<T>(dados);
    });
  }

  // =========================================================================== Deletar Dados
  Future<bool> deletarDados({required Dados dados}) async {
    if (dados.id == null) return false;
    final documento = dados.colecao.doc(dados.id);
    return await documento.delete().then((value) {
      return true;
    }).catchError((erro) {
      Sistemas.dispositivo.reportarErro(
        erro: erro,
        local: ["Sistemas", "FirebaseDados"],
        verificacao: "deletarDados",
      );
      return false;
    });
  }
}

// ----------------------------------------------------------------------------- Tipo Dados
abstract class Dados {
  bool? criar;
  String? id;
  CollectionReference colecao;
  Map<String, dynamic> objetoSalvar;
  T converterObjeto<T>(Map<String, dynamic> objeto);

  Dados({
    required this.criar,
    required this.id,
    required this.colecao,
    required this.objetoSalvar,
  });
  //////////////////////////////////////////////////////////////////////////////
}
