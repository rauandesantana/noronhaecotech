import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_paginas.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';

// ----------------------------------------------------------------------------- Sistemas Firebase Auth
class $SisFirebaseAuth {
  final String chaveLogado = "usuario_logado";
  final FirebaseAuth instancia = FirebaseAuth.instance;
  final User? usuario = FirebaseAuth.instance.currentUser;
  final bool logado = FirebaseAuth.instance.currentUser != null;

  $SisFirebaseAuth();

  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Auth Observador Autenticado
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

  // =========================================================================== Auth Checar Autenticação
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

  // =========================================================================== Auth Cadastrar com Email
  Future<String?> cadastrarEmail({
    required BuildContext context,
    required String nomeCompleto,
    required String celular,
    required String email,
    required String senha,
  }) async {
    final senhaCG = Sistemas.texto.criptografar(senha);
    return await instancia
        .fetchSignInMethodsForEmail(email)
        .then((listaProvedores) async {
      // ----------------------------------------------------------------------- Conta Inexistente
      if (listaProvedores.isEmpty) {
        Sistemas.navegador.abrirCarregamento(context: context);
        return await instancia
            .createUserWithEmailAndPassword(
          email: email,
          password: senhaCG,
        )
            .then((credencial) async {
          Sistemas.firebase.dados.salvarDados(
            dados: DadosUsuarios(
              criarUsuario: true,
              uid: credencial.user?.uid,
              nomeCompleto: nomeCompleto,
              celular: celular,
              email: email,
              senha: senhaCG,
            ),
          );
          return credencial.user?.uid;
        }).catchError((erro) {
          Sistemas.navegador.voltar(context);
          return erro.toString();
        });
      }
      // ----------------------------------------------------------------------- Conta Existente
      else {
        Sistemas.navegador.abrirDialogo(
          context: context,
          persistente: true,
          dialogo: Componentes.dialogo.mensagem(
            titulo: Idiomas.of(context).tituloContaEncontrada,
            texto: Idiomas.of(context).textoContaEncontrada,
            acaoBotaoPrimario: () {
              Sistemas.navegador.padrao(
                context: context,
                pagina: Paginas.acesso.login,
                fecharTodas: true,
                dados: {"email": email},
              );
            },
            acaoBotaoSecundario: () => Sistemas.navegador.voltar(context),
          ),
        );
        return null;
      }
    }).catchError((erro) => erro.toString());
  }

  // =========================================================================== Auth Entrar com Email
  Future<String?> entrarEmail({
    required BuildContext context,
    required String email,
    required String senha,
  }) async {
    final senhaCG = Sistemas.texto.criptografar(senha);
    return await instancia
        .fetchSignInMethodsForEmail(email)
        .then((listaProvedores) async {
      final idProvedorEmail = EmailAuthProvider.PROVIDER_ID;
      // ----------------------------------------------------------------------- Conta Inexistente
      if (listaProvedores.isEmpty) {
        final tituloEmail = Idiomas.of(context).tituloTextoCampoEmail;
        final tituloSenha = Idiomas.of(context).tituloTextoCampoSenha;
        final senhaOculta = senha.replaceAll(RegExp(r'.'), "*");
        Sistemas.navegador.abrirDialogo(
          context: context,
          persistente: true,
          dialogo: Componentes.dialogo.mensagem(
            titulo: Idiomas.of(context).tituloContaNaoEncontrada,
            texto: "${Idiomas.of(context).textoContaNaoEncontrada}\n\n"
                "$tituloEmail: $email\n"
                "$tituloSenha: $senhaOculta",
            acaoBotaoPrimario: () {
              Sistemas.navegador.padrao(
                context: context,
                pagina: Paginas.acesso.cadastro,
                fecharAnterior: true,
                dados: {"email": email, "senha": senha},
              );
            },
            acaoBotaoSecundario: () => Sistemas.navegador.voltar(context),
          ),
        );
        return null;
      }
      // ----------------------------------------------------------------------- Entrar Com Email
      else if (listaProvedores.contains(idProvedorEmail)) {
        Sistemas.navegador.abrirCarregamento(context: context);
        return await instancia
            .signInWithEmailAndPassword(email: email, password: senhaCG)
            .then((credencial) => credencial.user?.uid)
            .catchError((erro) {
          Sistemas.navegador.voltar(context);
          return erro.toString();
        });
      }
      // ----------------------------------------------------------------------- Adicionar Provedor Email
      else {
        print("asdasdasd");
        return null;
      }
    }).catchError((erro) => erro.toString());
  }

  // =========================================================================== Auth Entrar com Google
  Future<String?> entrarGoogle() async {
    final provedorGoogle = GoogleAuthProvider();
    final tipoDispositivo = Sistemas.dispositivo.info.tipo;
    habilitarProvedorEmail(User? usuario) {}
    // ------------------------------------------------------------------------- Mobile
    if (tipoDispositivo == Dispositivo.tipoMobile) {
      return await instancia.signInWithProvider(provedorGoogle).then(
        (credencial) {
          habilitarProvedorEmail(credencial.user);
          return credencial.user?.uid;
        },
      ).catchError((erro) => erro.toString());
    }
    // ------------------------------------------------------------------------- Web
    else if (tipoDispositivo == Dispositivo.tipoWeb) {
      return await instancia.signInWithPopup(provedorGoogle).then(
        (credencial) {
          habilitarProvedorEmail(credencial.user);
          return credencial.user?.uid;
        },
      ).catchError((erro) => erro.toString());
    }
    // ------------------------------------------------------------------------- Outros
    else {
      return null;
    }
  }
}
