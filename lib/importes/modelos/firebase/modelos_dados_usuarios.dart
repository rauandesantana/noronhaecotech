import 'package:noronhaecotech/configuracoes/importar_sistemas.dart';
import 'package:noronhaecotech/importes/sistemas/firebase/firebase_dados.dart';

// ----------------------------------------------------------------------------- Coleção Usuário
class DadosUsuarios extends Dados {
  final bool? criarUsuario;
  // =========================================================================== Usuario Dados Principais
  final String? uid;
  final String? imagemPerfil;
  final String? nomeCompleto;
  final String? celular;
  final String? email;
  final String? senha;
  // =========================================================================== Dados Secundários
  final String? nomePublico;

  DadosUsuarios({
    this.criarUsuario,
    required this.uid,
    this.imagemPerfil,
    this.nomeCompleto,
    this.celular,
    this.email,
    this.senha,
    this.nomePublico,
  }) : super(
          criar: criarUsuario,
          id: uid,
          colecao: Sistemas.firebase.dados.instancia.collection("usuarios"),
          objetoSalvar: {
            // ----------------------------------------------------------------- Usuario Dados Principais
            if (criarUsuario == true) "uid": uid,
            if (imagemPerfil != null) "imagemPerfil": imagemPerfil,
            if (nomeCompleto != null) "nomeCompleto": nomeCompleto,
            if (celular != null) "celular": celular,
            if (email != null) "email": email,
            if (senha != null) "senha": senha,
            // ----------------------------------------------------------------- Dados Secundários
            if (nomePublico != null) "nomePublico": nomePublico,
          },
        );
  //////////////////////////////////////////////////////////////////////////////

  @override
  T converterObjeto<T>(Map<String, dynamic> objeto) {
    return DadosUsuarios(
      uid: objeto["uid"],
      imagemPerfil: objeto["imagemPerfil"],
      nomeCompleto: objeto["nomeCompleto"],
      celular: objeto["celular"],
      email: objeto["email"],
      senha: objeto["senha"],
      nomePublico: objeto["nomePublico"],
    ) as T;
  }
}
