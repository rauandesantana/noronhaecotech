import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';

// ----------------------------------------------------------------------------- Sistemas Firebase Auth
class $SisFirebaseAuth {
  final String chaveLogado = "usuario_logado";
  final FirebaseAuth instancia = FirebaseAuth.instance;
  final User? usuario = FirebaseAuth.instance.currentUser;
  final bool logado = FirebaseAuth.instance.currentUser != null;

  $SisFirebaseAuth();

  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Observador Autenticado
  void observadorAutenticacao({
    required VoidCallback acaoLogado,
    required VoidCallback acaoDeslogado,
  }) {
    instancia.authStateChanges().listen((usuario) {
      Sistemas.dados
          .recuperarChave(chave: chaveLogado, valorPadrao: false)
          .then((logadoAnterior) {
        final logadoAtual = usuario != null;
        if (logadoAtual != logadoAnterior) {
          Sistemas.dados.salvarChave(
            chave: chaveLogado,
            valor: logadoAtual,
          );
          (logadoAtual) ? acaoLogado() : acaoDeslogado();
        }
      });
    });
  }

  // =========================================================================== Checar Autenticação
  void checarAutenticacao({
    required VoidCallback acaoLogado,
    VoidCallback? acaoDeslogado,
  }) {
    (logado)
        ? acaoLogado()
        : (acaoDeslogado != null)
            ? acaoDeslogado()
            : null;
  }

  // =========================================================================== Entrar com Email
  Future<String?> entrarEmail({
    required BuildContext context,
    required String email,
    required String senha,
  }) async {
    final tituloEmail = Idiomas.of(context).tituloTextoCampoEmail;
    final tituloSenha = Idiomas.of(context).tituloTextoCampoSenha;
    final senhaOculta = senha.replaceAll(RegExp(r'.'), "*");

    return await instancia
        .fetchSignInMethodsForEmail(email)
        .then((listaProvedores) async {
      final idProvedorEmail = EmailAuthProvider.PROVIDER_ID;
      final contemProvedorEmail = listaProvedores.contains(idProvedorEmail);
      if (listaProvedores.isEmpty) {
        Sistemas.navegador.abrirDialogo(
          context: context,
          persistente: true,
          dialogo: Componentes.dialogo.mensagem(
            titulo: "Conta Não Encontrada",
            texto: "Deseja se cadastrar usando esse E-mail e Senha?\n\n"
                "$tituloEmail: $email\n"
                "$tituloSenha: $senhaOculta",
            acaoBotaoPrimario: () => Sistemas.navegador.voltar(context),
          ),
        );
        return null;
      } else if (contemProvedorEmail) {
        return await instancia
            .signInWithEmailAndPassword(email: email, password: senha)
            .then((credencial) => credencial.user?.uid)
            .catchError((erro) => erro.toString());
      } else {
        print("asdasdasd");
        return null;
      }
    });
  }
}
