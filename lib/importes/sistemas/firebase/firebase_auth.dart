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
  void cadastrarEmail({
    required BuildContext context,
    required String nomeCompleto,
    required String celular,
    required String email,
    required String senha,
  }) async {
    final senhaCG = Sistemas.texto.criptografar(senha);
    await instancia
        .fetchSignInMethodsForEmail(email)
        .then((listaProvedores) async {
      // ----------------------------------------------------------------------- Conta Inexistente
      if (listaProvedores.isEmpty) {
        Sistemas.navegador.abrirCarregamento(context);
        await instancia
            .createUserWithEmailAndPassword(email: email, password: senhaCG)
            .then((credencial) async {
          await Sistemas.firebase.dados.salvarDados(
            dados: DadosUsuarios(
              criarUsuario: true,
              uid: credencial.user?.uid,
              nomeCompleto: nomeCompleto,
              celular: celular,
              email: email,
              senha: senhaCG,
            ),
          );
        }).onError((erro, stack) {
          Sistemas.navegador.voltar(context);
          ////////////////////////////////////////////////////////////////////// Erro
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
      }
    });
  }

  // =========================================================================== Auth Entrar com Email
  Future<void> entrarEmail({
    required BuildContext context,
    required String email,
    required String senha,
  }) async {
    final senhaCG = Sistemas.texto.criptografar(senha);
    await instancia
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
      }
      // ----------------------------------------------------------------------- Entrar Com Email
      else if (listaProvedores.contains(idProvedorEmail)) {
        Sistemas.navegador.abrirCarregamento(context);
        await instancia
            .signInWithEmailAndPassword(email: email, password: senhaCG)
            .then((credencial) {})
            .onError((erro, stack) {
          Sistemas.navegador.voltar(context);
          ////////////////////////////////////////////////////////////////////// Erro
        });
      }
    });
  }

  // =========================================================================== Auth Entrar com Google
  Future<void> entrarGoogle(BuildContext context) async {
    Sistemas.navegador.abrirCarregamento(context);
    final provedorGoogle = GoogleAuthProvider();
    final tipoDispositivo = Sistemas.dispositivo.info.tipo;
    habilitarProvedorEmail(User usuarioGoogle) async {
      final emailGoogle = usuarioGoogle.email;
      if (emailGoogle != null) {
        await instancia
            .fetchSignInMethodsForEmail(emailGoogle)
            .then((listaProvedores) async {
          final idProvedorEmail = EmailAuthProvider.PROVIDER_ID;
          if (!listaProvedores.contains(idProvedorEmail)) {
            final dadosUsuarios = DadosUsuarios(uid: usuarioGoogle.uid);
            await Sistemas.firebase.dados
                .recuperarDados(dadosRecuperar: dadosUsuarios)
                .then((dadosResposta) async {
              if (dadosResposta == null) {
                await Sistemas.firebase.dados.salvarDados(
                  dados: DadosUsuarios(
                    criarUsuario: true,
                    uid: usuarioGoogle.uid,
                    nomeCompleto: usuarioGoogle.displayName,
                    celular: usuarioGoogle.phoneNumber,
                    email: usuarioGoogle.email,
                    senha: Sistemas.texto.criptografar(usuarioGoogle.uid),
                  ),
                );
              }
              await usuarioGoogle.linkWithCredential(
                EmailAuthProvider.credential(
                  email: usuarioGoogle.email!,
                  password: (dadosResposta == null)
                      ? Sistemas.texto.criptografar(usuarioGoogle.uid)
                      : dadosResposta.senha!,
                ),
              );
            });
          }
        });
      }
    }

    // ------------------------------------------------------------------------- Mobile
    if (tipoDispositivo == Dispositivo.tipoMobile) {
      await instancia
          .signInWithProvider(provedorGoogle)
          .then((credencial) => habilitarProvedorEmail(credencial.user!))
          .onError((erro, stack) {
        Sistemas.navegador.voltar(context);
        //////////////////////////////////////////////////////////////////////// Erro
      });
    }
    // ------------------------------------------------------------------------- Web
    else if (tipoDispositivo == Dispositivo.tipoWeb) {
      await instancia
          .signInWithPopup(provedorGoogle)
          .then((credencial) => habilitarProvedorEmail(credencial.user!))
          .onError((erro, stack) {
        Sistemas.navegador.voltar(context);
        //////////////////////////////////////////////////////////////////////// Erro
      });
    }
    // ------------------------------------------------------------------------- Outros
    else {
      ////////////////////////////////////////////////////////////////////////// Erro
    }
  }
}
