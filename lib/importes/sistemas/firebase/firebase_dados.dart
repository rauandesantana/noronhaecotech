import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noronhaecotech/importes/modelos/firebase/modelos_dados_usuarios.dart';

// ----------------------------------------------------------------------------- Sistemas Firebase Dados
class $SisFirebaseDados {
  final FirebaseFirestore instancia = FirebaseFirestore.instance;

  $SisFirebaseDados();
  //////////////////////////////////////////////////////////////////////////////

  void salvarDados({
    required CollectionReference colecao,
    required DadosUsuarios dadosUsuarios,
}) {
    final documento = colecao.doc();
    documento.set(data);


  }



}