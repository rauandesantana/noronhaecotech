import 'package:noronhaecotech/configuracoes/importar_tudo.dart';
import 'package:noronhaecotech/importes/sistemas/firebase/firebase_dados.dart';

// ----------------------------------------------------------------------------- Coleção Usuário
class DadosUsuarios extends Dados {
  final bool? criarUsuario;
  // =========================================================================== Usuario Dados Principais
  final String? uid;
  final String? dataCriacao;
  final String? nomePublico;
  final String? email;
  final String? senha;
  // =========================================================================== Dados Secundários
  final String? imagemPerfil;
  final String? nomeCompleto;
  final String? celular;

  DadosUsuarios({
    this.criarUsuario,
    required this.uid,
    this.dataCriacao,
    this.nomePublico,
    this.email,
    this.senha,
    this.imagemPerfil,
    this.nomeCompleto,
    this.celular,
  }) : super(
          criar: criarUsuario,
          id: uid,
          colecao: Sistemas.firebase.dados.instancia.collection("usuarios"),
          objetoSalvar: {
            // ----------------------------------------------------------------- Usuario Dados Principais
            if (criarUsuario != null) "uid": uid,
            if (criarUsuario != null) "dataCriacao": dataCriacao,
            if (nomePublico != null) "nomePublico": nomePublico,
            if (email != null) "email": email,
            if (senha != null) "senha": senha,
            // ----------------------------------------------------------------- Dados Secundários
            if (imagemPerfil != null) "imagemPerfil": imagemPerfil,
            if (nomeCompleto != null) "nomeCompleto": nomeCompleto,
            if (celular != null) "celular": celular,
          },
        );
  //////////////////////////////////////////////////////////////////////////////

  @override
  T converterObjeto<T>(Map<String, dynamic> objeto) {
    return DadosUsuarios(
      uid: objeto["uid"],
      dataCriacao: objeto["dataCriacao"],
      nomePublico: objeto["nomePublico"],
      email: objeto["email"],
      senha: objeto["senha"],
      imagemPerfil: objeto["imagemPerfil"],
      nomeCompleto: objeto["nomeCompleto"],
      celular: objeto["celular"],
    ) as T;
  }
}
