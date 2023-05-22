import 'package:firebase_core/firebase_core.dart';
import 'package:noronhaecotech/firebase_options.dart';
import 'package:noronhaecotech/importes/sistemas/firebase/firebase_auth.dart';

// ----------------------------------------------------------------------------- Sistemas Firebase Padrão
class $SisFirebasePadrao {
  final _cP = DefaultFirebaseOptions.currentPlatform;

  $SisFirebasePadrao();
  //////////////////////////////////////////////////////////////////////////////
  Future<FirebaseApp> get inicializar => Firebase.initializeApp(options: _cP);
  $SisFirebaseAuth get auth => $SisFirebaseAuth();
}