import 'package:noronhaecotech/importes/sistemas/firebase/firebase_auth.dart';
import 'package:noronhaecotech/importes/sistemas/firebase/firebase_dados.dart';
////////////////////////////////////////////////////////////////////////////////
import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Sistemas Firebase Padrão
class $SisFirebasePadrao {
  final _cP = DefaultFirebaseOptions.currentPlatform;

  $SisFirebasePadrao();
  //////////////////////////////////////////////////////////////////////////////
  Future<FirebaseApp> get inicializar => Firebase.initializeApp(options: _cP);
  $SisFirebaseAuth get auth => $SisFirebaseAuth();
  $SisFirebaseDados get dados => $SisFirebaseDados();
}