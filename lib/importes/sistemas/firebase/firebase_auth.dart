import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noronhaecotech/importes/importar_componentes.dart';
import 'package:noronhaecotech/importes/importar_estilos.dart';
import 'package:noronhaecotech/importes/importar_paginas.dart';
import 'package:noronhaecotech/importes/importar_sistemas.dart';

// ----------------------------------------------------------------------------- Sistemas Firebase Auth
class $SisFirebaseAuth {
  final String chaveUsuarioLogado = "usuario_logado";
  final String chaveDadosLogado = "dados_logado";
  final FirebaseAuth instancia = FirebaseAuth.instance;
  final User? usuario = FirebaseAuth.instance.currentUser;
  final bool logado = FirebaseAuth.instance.currentUser != null;

  $SisFirebaseAuth();

  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Auth Observador Autenticado
  void observadorAutenticacao({
    required void Function(Map) acaoLogado,
    required VoidCallback acaoDeslogado,
  }) {
    instancia.authStateChanges().listen((usuario) {
      Sistemas.dados
          .recuperarChave(chave: chaveUsuarioLogado, valorPadrao: false)
          .then((logadoAnterior) {
        final logadoAtual = usuario != null;
        if (logadoAtual != logadoAnterior) {
          Sistemas.dados.salvarChave(
            chave: chaveUsuarioLogado,
            valor: logadoAtual,
          );
          (logadoAtual)
              ? Sistemas.dados.recuperarChave(
                  chave: chaveDadosLogado,
                  valorPadrao: {},
                ).then((dados) {
                  acaoLogado(dados);
                  limparRedirecionamento();
                })
              : acaoDeslogado();
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

  // =========================================================================== Auth Redirecionar Pagina
  Future<bool> redirecionarPagina({
    required Pagina redirecionar,
    Map? valor,
  }) async {
    final valorModificado = (valor == null)
        ? {"redirecionar": redirecionar.caminho}
        : {"redirecionar": redirecionar.caminho, ...valor};
    return await Sistemas.dados
        .salvarChave(chave: chaveDadosLogado, valor: valorModificado)
        .then((dadosSalvos) => dadosSalvos)
        .catchError((erro) => false);
  }

  // =========================================================================== Auth Limpar Redirecionamento
  Future<bool> limparRedirecionamento() async {
    return await Sistemas.dados
        .deletarChave(chave: chaveDadosLogado)
        .then((dadosLimpos) => dadosLimpos)
        .catchError((erro) => false);
  }

  // =========================================================================== Auth Recuperar Senha
  void recuperarSenha({
    required BuildContext context,
    String? email,
  }) {
    final contextOriginal = context;
    Sistemas.navegador.abrirDialogo(
      context: context,
      persistente: true,
      dialogo: Componentes.dialogo.padrao(
        titulo: Idiomas.of(context).tituloRecuperarSenha,
        conteudo: (context, atualizar) {
          return Column(
            children: <Widget>[
              Componentes.texto.padrao(
                texto: Idiomas.of(context).textoEscolhaUmMetodo,
              ),
              // --------------------------------------------------------------- Espaço
              const Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // --------------------------------------------------------- Botão Email
                    Componentes.imagem.arredondada(
                      aoTocar: () {
                        redirecionarPagina(
                          redirecionar: Paginas.acesso.recuperarSenha,
                        ).then((configurado) {
                          if (configurado) {
                            Sistemas.navegador.voltar(context);
                            //////////////////////////////////////////////////// Editar Aqui
                            entrarGoogle(contextOriginal).then((logado) {
                              if (!logado) limparRedirecionamento();
                            });
                            ////////////////////////////////////////////////////
                          } else {
                            // ------------------------------------------------- Mensagem Indisponivel
                            final idiomas = Idiomas.of(context);
                            _exibirMensagemErro(
                              context: context,
                              mensagem:
                                  "${idiomas.tituloEmail} ${idiomas.tituloIndisponivel}",
                            );
                          }
                        });
                      },
                      imagem: Estilos.imagem.icones.email,
                      corImagem: Theme.of(context).primaryColor,
                      arredondarBorda: BorderRadius.circular(15),
                      ajuste: BoxFit.contain,
                      largura: 50,
                      altura: 50,
                    ),
                    // --------------------------------------------------------- Botão Google
                    Componentes.imagem.circular(
                      aoTocar: () {
                        redirecionarPagina(
                          redirecionar: Paginas.acesso.recuperarSenha,
                        ).then((configurado) {
                          if (configurado) {
                            Sistemas.navegador.voltar(context);
                            entrarGoogle(contextOriginal).then((logado) {
                              if (!logado) limparRedirecionamento();
                            });
                          } else {
                            // ------------------------------------------------- Mensagem Indisponivel
                            final idiomas = Idiomas.of(context);
                            _exibirMensagemErro(
                              context: context,
                              mensagem:
                                  "${idiomas.tituloGoogle} ${idiomas.tituloIndisponivel}",
                            );
                          }
                        });
                      },
                      imagem: Estilos.imagem.logos.google,
                      ajuste: BoxFit.contain,
                      diametro: 50,
                    ),
                    // --------------------------------------------------------- Botão Apple
                    Componentes.imagem.circular(
                      aoTocar: () {
                        redirecionarPagina(
                          redirecionar: Paginas.acesso.recuperarSenha,
                        ).then((configurado) {
                          if (configurado) {
                            Sistemas.navegador.voltar(context);
                            entrarApple(contextOriginal).then((logado) {
                              if (!logado) limparRedirecionamento();
                            });
                          } else {
                            // ------------------------------------------------- Mensagem Indisponivel
                            final idiomas = Idiomas.of(context);
                            _exibirMensagemErro(
                              context: context,
                              mensagem:
                                  "${idiomas.tituloApple} ${idiomas.tituloIndisponivel}",
                            );
                          }
                        });
                      },
                      imagem: Estilos.imagem.logos.apple,
                      corImagem: Theme.of(context).primaryColor,
                      ajuste: BoxFit.contain,
                      diametro: 50,
                    ),
                    // --------------------------------------------------------- Botão Facebook
                    Componentes.imagem.circular(
                      aoTocar: () {
                        redirecionarPagina(
                          redirecionar: Paginas.acesso.recuperarSenha,
                        ).then((configurado) {
                          if (configurado) {
                            Sistemas.navegador.voltar(context);
                            entrarFacebook(contextOriginal).then((logado) {
                              if (!logado) limparRedirecionamento();
                            });
                          } else {
                            // ------------------------------------------------- Mensagem Indisponivel
                            final idiomas = Idiomas.of(context);
                            _exibirMensagemErro(
                              context: context,
                              mensagem:
                                  "${idiomas.tituloFacebook} ${idiomas.tituloIndisponivel}",
                            );
                          }
                        });
                      },
                      imagem: Estilos.imagem.logos.facebook,
                      ajuste: BoxFit.contain,
                      diametro: 50,
                    ),
                  ],
                ),
              ),
              // --------------------------------------------------------------- Espaço
              const Padding(padding: EdgeInsets.only(top: 20)),
              // --------------------------------------------------------------- Botão Cancelar
              Componentes.botao.elevado(
                aoPrecionar: () => Sistemas.navegador.voltar(context),
                titulo: Idiomas.of(context).tituloCancelar,
              ),
            ],
          );
        },
      ),
    );
  }

  // =========================================================================== Auth Cadastrar com Email
  Future<bool> cadastrarEmail({
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
        Sistemas.navegador.abrirCarregamento(context);
        return await instancia
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
                _exibirMensagemErro(
                  context: context,
                  mensagem: Idiomas.of(context).textoAuthUsuarioNaoSalvo,
                  voltar: false,
                );
              }
            });
          } else {
            // ----------------------------------------------------------------- Mensagem Auth Falha Cadastro
            _exibirMensagemErro(
              context: context,
              mensagem: Idiomas.of(context).textoAuthFalhaCadastro,
            );
          }
          return usuarioEmail != null;
        }).timeout(const Duration(minutes: 60), onTimeout: () {
          // ------------------------------------------------------------------- Mensagem Auth Expirado
          _exibirMensagemErro(
            context: context,
            mensagem: Idiomas.of(context).textoAuthExpirado,
          );
          return false;
        }).onError((FirebaseAuthException erro, pilha) {
          // ------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
          final textoErro = Idiomas.of(context).textoErroDesconhecido;
          _exibirMensagemErro(
            context: context,
            mensagem: "$textoErro: ${erro.message}",
          );
          return false;
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
        return false;
      }
    });
  }

  // =========================================================================== Auth Entrar com Email
  Future<bool> entrarEmail({
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
        final tituloEmail = Idiomas.of(context).tituloEmail;
        final tituloSenha = Idiomas.of(context).tituloSenha;
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
        return false;
      }
      // ----------------------------------------------------------------------- Entrar Com Email
      else if (listaProvedores.contains(idProvedorEmail)) {
        Sistemas.navegador.abrirCarregamento(context);
        return await instancia
            .signInWithEmailAndPassword(email: email, password: senhaCG)
            .then((credencialUsuario) => credencialUsuario.user)
            .then((usuarioEmail) {
          if (usuarioEmail == null) {
            // ----------------------------------------------------------------- Mensagem Auth Falha Login
            _exibirMensagemErro(
              context: context,
              mensagem: Idiomas.of(context).textoAuthFalhaLogin,
            );
          }
          return usuarioEmail != null;
        }).timeout(const Duration(minutes: 60), onTimeout: () {
          // ------------------------------------------------------------------- Mensagem Auth Expirado
          _exibirMensagemErro(
            context: context,
            mensagem: Idiomas.of(context).textoAuthExpirado,
          );
          return false;
        }).onError((FirebaseAuthException erro, pilha) {
          if (erro.message!.contains("auth/wrong-password")) {
            // ----------------------------------------------------------------- Mensagem Auth Email Campos Inválidos
            _exibirMensagemErro(
              context: context,
              mensagem: Idiomas.of(context).textoAuthEmailCamposInvalidos,
            );
            return false;
          } else {
            // ------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
            final textoErro = Idiomas.of(context).textoErroDesconhecido;
            _exibirMensagemErro(
              context: context,
              mensagem: "$textoErro: ${erro.message}",
            );
            return false;
          }
        });
      } else {
        return false;
      }
    });
  }

  // =========================================================================== Auth Entrar com Google
  Future<bool> entrarGoogle(BuildContext context) async {
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
      return await instancia
          .signInWithProvider(provedorGoogle)
          .then((credencialUsuario) => credencialUsuario.user)
          .then((usuarioGoogle) async {
        if (usuarioGoogle != null) {
          await salvarUsuario(usuarioGoogle).then((usuarioSalvo) {
            if (!usuarioSalvo) {
              // --------------------------------------------------------------- Mensagem Auth Usuario Não Salvo
              _exibirMensagemErro(
                context: context,
                mensagem: Idiomas.of(context).textoAuthUsuarioNaoSalvo,
                voltar: false,
              );
            }
          });
        } else {
          // ------------------------------------------------------------------- Mensagem Auth Falha Login
          _exibirMensagemErro(
            context: context,
            mensagem: Idiomas.of(context).textoAuthFalhaLogin,
          );
        }
        return usuarioGoogle != null;
      }).timeout(const Duration(minutes: 60), onTimeout: () {
        // --------------------------------------------------------------------- Mensagem Auth Expirado
        _exibirMensagemErro(
          context: context,
          mensagem: Idiomas.of(context).textoAuthExpirado,
        );
        return false;
      }).onError((FirebaseAuthException erro, pilha) {
        if (erro.message!.contains("auth/popup-closed-by-user") ||
            erro.code.contains("web-context-canceled")) {
          // ------------------------------------------------------------------- Mensagem Auth Google Fechado
          _exibirMensagemErro(
            context: context,
            mensagem: Idiomas.of(context).textoAuthGoogleFechado,
          );
          return false;
        } else {
          // ------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
          final textoErro = Idiomas.of(context).textoErroDesconhecido;
          _exibirMensagemErro(
            context: context,
            mensagem: "$textoErro: ${erro.message}",
          );
          return false;
        }
      });
    }
    // ------------------------------------------------------------------------- Web
    else if (tipoDispositivo == Dispositivo.tipoWeb) {
      return await instancia
          .signInWithPopup(provedorGoogle)
          .then((credencialUsuario) => credencialUsuario.user)
          .then((usuarioGoogle) async {
        if (usuarioGoogle != null) {
          await salvarUsuario(usuarioGoogle).then((usuarioSalvo) {
            if (!usuarioSalvo) {
              // --------------------------------------------------------------- Mensagem Auth Usuario Não Salvo
              _exibirMensagemErro(
                context: context,
                mensagem: Idiomas.of(context).textoAuthUsuarioNaoSalvo,
                voltar: false,
              );
            }
          });
        } else {
          // ------------------------------------------------------------------- Mensagem Auth Falha Login
          _exibirMensagemErro(
            context: context,
            mensagem: Idiomas.of(context).textoAuthFalhaLogin,
          );
        }
        return usuarioGoogle != null;
      }).timeout(const Duration(minutes: 60), onTimeout: () {
        // --------------------------------------------------------------------- Mensagem Auth Expirado
        _exibirMensagemErro(
          context: context,
          mensagem: Idiomas.of(context).textoAuthExpirado,
        );
        return false;
      }).onError((FirebaseAuthException erro, pilha) {
        if (erro.message!.contains("auth/popup-closed-by-user") ||
            erro.code.contains("web-context-canceled")) {
          // ------------------------------------------------------------------- Mensagem Auth Google Fechado
          _exibirMensagemErro(
            context: context,
            mensagem: Idiomas.of(context).textoAuthGoogleFechado,
          );
          return false;
        } else {
          // ------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
          final textoErro = Idiomas.of(context).textoErroDesconhecido;
          _exibirMensagemErro(
            context: context,
            mensagem: "$textoErro: ${erro.message}",
          );
          return false;
        }
      });
    }
    // ------------------------------------------------------------------------- Outros
    else {
      // ----------------------------------------------------------------------- Mensagem Plataforma Não Suportada
      _exibirMensagemErro(
        context: context,
        mensagem: Idiomas.of(context).textoPlataformaNaoSuportada,
      );
      return false;
    }
  }

  // =========================================================================== Auth Entrar com Apple
  Future<bool> entrarApple(BuildContext context) async {
    // ------------------------------------------------------------------------- Mensagem Indisponivel
    _exibirMensagemErro(
      context: context,
      mensagem: "Apple ${Idiomas.of(context).tituloIndisponivel}",
      corFundoErro: false,
      voltar: false,
    );
    return false;
  }

  // =========================================================================== Auth Entrar com Apple
  Future<bool> entrarFacebook(BuildContext context) async {
    // ------------------------------------------------------------------------- Mensagem Indisponivel
    _exibirMensagemErro(
      context: context,
      mensagem: "Facebook ${Idiomas.of(context).tituloIndisponivel}",
      corFundoErro: false,
      voltar: false,
    );
    return false;
  }

  // =========================================================================== Metodo Exibir Mensagem Erro
  _exibirMensagemErro({
    required BuildContext context,
    required String mensagem,
    bool? voltar,
    bool? corFundoErro,
  }) {
    Sistemas.navegador.abrirMensagem(
      context: context,
      flutuante: true,
      corFundo:
          (corFundoErro == false) ? null : Theme.of(context).colorScheme.error,
      mensagem: mensagem,
      aoVisualizar:
          (voltar != false) ? () => Sistemas.navegador.voltar(context) : null,
    );
  }
}
