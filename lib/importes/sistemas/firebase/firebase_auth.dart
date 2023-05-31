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
            .then((credencialUsuario) => credencialUsuario.user)
            .then((usuarioEmail) async {
          if (usuarioEmail != null) {
            final dadosUsuario = DadosUsuarios(
              criarUsuario: true,
              uid: usuarioEmail.uid,
              nomeCompleto: nomeCompleto,
              celular: celular,
              email: email,
              senha: senhaCG,
            );
            await Sistemas.firebase.dados
                .salvarDados(dados: dadosUsuario)
                .then((usuarioSalvo) {
              if (!usuarioSalvo) {
                // ------------------------------------------------------------- Mensagem Auth Usuario Não Salvo
                Sistemas.navegador.abrirMensagem(
                  context: context,
                  flutuante: true,
                  corFundo: Theme.of(context).colorScheme.error,
                  mensagem: Idiomas.of(context).textoAuthUsuarioNaoSalvo,
                );
              }
            });
          } else {
            // ----------------------------------------------------------------- Mensagem Auth Falha Cadastro
            Sistemas.navegador.abrirMensagem(
              context: context,
              flutuante: true,
              corFundo: Theme.of(context).colorScheme.error,
              mensagem: Idiomas.of(context).textoAuthFalhaCadastro,
              aoVisualizar: () => Sistemas.navegador.voltar(context),
            );
          }
        }).timeout(const Duration(minutes: 60), onTimeout: () {
          // ------------------------------------------------------------------- Mensagem Auth Expirado
          Sistemas.navegador.abrirMensagem(
            context: context,
            flutuante: true,
            corFundo: Theme.of(context).colorScheme.error,
            mensagem: Idiomas.of(context).textoAuthExpirado,
            aoVisualizar: () => Sistemas.navegador.voltar(context),
          );
        }).onError((FirebaseAuthException erro, pilha) {
          // ------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
          final textoErro = Idiomas.of(context).textoErroDesconhecido;
          Sistemas.navegador.abrirMensagem(
            context: context,
            flutuante: true,
            corFundo: Theme.of(context).colorScheme.error,
            mensagem: "$textoErro: ${erro.message}",
            aoVisualizar: () => Sistemas.navegador.voltar(context),
          );
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
            .then((credencialUsuario) => credencialUsuario.user)
            .then((usuarioEmail) {
          if (usuarioEmail == null) {
            // ----------------------------------------------------------------- Mensagem Auth Falha Login
            Sistemas.navegador.abrirMensagem(
              context: context,
              flutuante: true,
              corFundo: Theme.of(context).colorScheme.error,
              mensagem: Idiomas.of(context).textoAuthFalhaLogin,
              aoVisualizar: () => Sistemas.navegador.voltar(context),
            );
          }
        }).timeout(const Duration(minutes: 60), onTimeout: () {
          // ------------------------------------------------------------------- Mensagem Auth Expirado
          Sistemas.navegador.abrirMensagem(
            context: context,
            flutuante: true,
            corFundo: Theme.of(context).colorScheme.error,
            mensagem: Idiomas.of(context).textoAuthExpirado,
            aoVisualizar: () => Sistemas.navegador.voltar(context),
          );
        }).onError((FirebaseAuthException erro, pilha) {
          if (erro.message!.contains("auth/wrong-password")) {
            // ----------------------------------------------------------------- Mensagem Auth Email Campos Inválidos
            Sistemas.navegador.abrirMensagem(
              context: context,
              flutuante: true,
              corFundo: Theme.of(context).colorScheme.error,
              mensagem: Idiomas.of(context).textoAuthEmailCamposInvalidos,
              aoVisualizar: () => Sistemas.navegador.voltar(context),
            );
          } else {
            // ------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
            final textoErro = Idiomas.of(context).textoErroDesconhecido;
            Sistemas.navegador.abrirMensagem(
              context: context,
              flutuante: true,
              corFundo: Theme.of(context).colorScheme.error,
              mensagem: "$textoErro: ${erro.message}",
              aoVisualizar: () => Sistemas.navegador.voltar(context),
            );
          }
        });
      }
    });
  }

  // =========================================================================== Auth Entrar com Google
  void entrarGoogle(BuildContext context) async {
    Sistemas.navegador.abrirCarregamento(context);
    final provedorGoogle = GoogleAuthProvider();
    final tipoDispositivo = Sistemas.dispositivo.info.tipo;

    Future<bool> salvarUsuario(User? usuarioGoogle) async {
      if (usuarioGoogle == null) return false;
      final emailGoogle = usuarioGoogle.email;
      if (emailGoogle == null) return false;
      return await instancia
          .fetchSignInMethodsForEmail(emailGoogle)
          .then((listaProvedores) async {
        final idProvedorEmail = EmailAuthProvider.PROVIDER_ID;
        if (listaProvedores.contains(idProvedorEmail)) return true;
        final dadosUsuarios = DadosUsuarios(uid: usuarioGoogle.uid);
        return await Sistemas.firebase.dados
            .recuperarDados(dadosRecuperar: dadosUsuarios)
            .then((dadosResposta) async {
          bool respostaSalvarDados = false;
          bool respostaCredencialEmail = false;
          if (dadosResposta == null) {
            respostaSalvarDados = await Sistemas.firebase.dados.salvarDados(
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
          final credencialEmail = EmailAuthProvider.credential(
            email: usuarioGoogle.email!,
            password: (dadosResposta == null)
                ? Sistemas.texto.criptografar(usuarioGoogle.uid)
                : dadosResposta.senha!,
          );
          respostaCredencialEmail = await usuarioGoogle
              .linkWithCredential(credencialEmail)
              .then((credencialUsuario) => credencialUsuario.credential)
              .then((credencial) => credencial?.providerId)
              .then((idProvedor) => idProvedor == idProvedorEmail);
          return respostaSalvarDados && respostaCredencialEmail;
        });
      });
    }

    // ------------------------------------------------------------------------- Mobile
    if (tipoDispositivo == Dispositivo.tipoMobile) {
      await instancia
          .signInWithProvider(provedorGoogle)
          .then((credencialUsuario) => credencialUsuario.user)
          .then((usuarioGoogle) async {
        if (usuarioGoogle != null) {
          await salvarUsuario(usuarioGoogle).then((usuarioSalvo) {
            if (!usuarioSalvo) {
              // --------------------------------------------------------------- Mensagem Auth Usuario Não Salvo
              Sistemas.navegador.abrirMensagem(
                context: context,
                flutuante: true,
                corFundo: Theme.of(context).colorScheme.error,
                mensagem: Idiomas.of(context).textoAuthUsuarioNaoSalvo,
              );
            }
          });
        } else {
          // ------------------------------------------------------------------- Mensagem Auth Falha Login
          Sistemas.navegador.abrirMensagem(
            context: context,
            flutuante: true,
            corFundo: Theme.of(context).colorScheme.error,
            mensagem: Idiomas.of(context).textoAuthFalhaLogin,
            aoVisualizar: () => Sistemas.navegador.voltar(context),
          );
        }
      }).timeout(const Duration(minutes: 60), onTimeout: () {
        // --------------------------------------------------------------------- Mensagem Auth Expirado
        Sistemas.navegador.abrirMensagem(
          context: context,
          flutuante: true,
          corFundo: Theme.of(context).colorScheme.error,
          mensagem: Idiomas.of(context).textoAuthExpirado,
          aoVisualizar: () => Sistemas.navegador.voltar(context),
        );
      }).onError((FirebaseAuthException erro, pilha) {
        if (erro.message!.contains("auth/popup-closed-by-user")) {
          // ------------------------------------------------------------------- Mensagem Auth Google Fechado
          Sistemas.navegador.abrirMensagem(
            context: context,
            flutuante: true,
            corFundo: Theme.of(context).colorScheme.error,
            mensagem: Idiomas.of(context).textoAuthGoogleFechado,
            aoVisualizar: () => Sistemas.navegador.voltar(context),
          );
        } else {
          // ------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
          final textoErro = Idiomas.of(context).textoErroDesconhecido;
          Sistemas.navegador.abrirMensagem(
            context: context,
            flutuante: true,
            corFundo: Theme.of(context).colorScheme.error,
            mensagem: "$textoErro: ${erro.message}",
            aoVisualizar: () => Sistemas.navegador.voltar(context),
          );
        }
      });
    }
    // ------------------------------------------------------------------------- Web
    else if (tipoDispositivo == Dispositivo.tipoWeb) {
      await instancia
          .signInWithPopup(provedorGoogle)
          .then((credencialUsuario) => credencialUsuario.user)
          .then((usuarioGoogle) async {
        if (usuarioGoogle != null) {
          await salvarUsuario(usuarioGoogle).then((usuarioSalvo) {
            if (!usuarioSalvo) {
              // --------------------------------------------------------------- Mensagem Auth Usuario Não Salvo
              Sistemas.navegador.abrirMensagem(
                context: context,
                flutuante: true,
                corFundo: Theme.of(context).colorScheme.error,
                mensagem: Idiomas.of(context).textoAuthUsuarioNaoSalvo,
              );
            }
          });
        } else {
          // ------------------------------------------------------------------- Mensagem Auth Falha Login
          Sistemas.navegador.abrirMensagem(
            context: context,
            flutuante: true,
            corFundo: Theme.of(context).colorScheme.error,
            mensagem: Idiomas.of(context).textoAuthFalhaLogin,
            aoVisualizar: () => Sistemas.navegador.voltar(context),
          );
        }
      }).timeout(const Duration(minutes: 60), onTimeout: () {
        // --------------------------------------------------------------------- Mensagem Auth Expirado
        Sistemas.navegador.abrirMensagem(
          context: context,
          flutuante: true,
          corFundo: Theme.of(context).colorScheme.error,
          mensagem: Idiomas.of(context).textoAuthExpirado,
          aoVisualizar: () => Sistemas.navegador.voltar(context),
        );
      }).onError((FirebaseAuthException erro, pilha) {
        if (erro.message!.contains("auth/popup-closed-by-user")) {
          // ------------------------------------------------------------------- Mensagem Auth Google Fechado
          Sistemas.navegador.abrirMensagem(
            context: context,
            flutuante: true,
            corFundo: Theme.of(context).colorScheme.error,
            mensagem: Idiomas.of(context).textoAuthGoogleFechado,
            aoVisualizar: () => Sistemas.navegador.voltar(context),
          );
        } else {
          // ------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
          final textoErro = Idiomas.of(context).textoErroDesconhecido;
          Sistemas.navegador.abrirMensagem(
            context: context,
            flutuante: true,
            corFundo: Theme.of(context).colorScheme.error,
            mensagem: "$textoErro: ${erro.message}",
            aoVisualizar: () => Sistemas.navegador.voltar(context),
          );
        }
      });
    }
    // ------------------------------------------------------------------------- Outros
    else {
      // ----------------------------------------------------------------------- Mensagem Plataforma Não Suportada
      Sistemas.navegador.abrirMensagem(
        context: context,
        flutuante: true,
        corFundo: Theme.of(context).colorScheme.error,
        mensagem: Idiomas.of(context).textoPlataformaNaoSuportada,
        aoVisualizar: () => Sistemas.navegador.voltar(context),
      );
    }
  }

  // =========================================================================== Auth Entrar com Apple
  Future<void> entrarApple(BuildContext context) async {}

  // =========================================================================== Auth Entrar com Apple
  Future<void> entrarFacebook(BuildContext context) async {}
}
