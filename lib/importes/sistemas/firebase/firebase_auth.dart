import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noronhaecotech/importar_componentes.dart';
import 'package:noronhaecotech/importar_estilos.dart';
import 'package:noronhaecotech/importar_paginas.dart';
import 'package:noronhaecotech/importar_sistemas.dart';

typedef BotaoRecuperarSenha = Widget Function(
  BuildContext context,
  BuildContext contextOriginal,
);

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
    int etapaAtual = 0;
    final controladorDeslizante = PageController(initialPage: etapaAtual);
    void proximaEtapa(bool proxima) {
      Sistemas.dispositivo.fecharTeclado();
      if (proxima) {
        controladorDeslizante.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInCirc,
        );
      } else {
        controladorDeslizante.previousPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInCirc,
        );
      }
    }

    // ------------------------------------------------------------------------- Botão Email
    Widget botaoEmail(
      BuildContext context,
      BuildContext contextOriginal,
    ) =>
        Componentes.imagem.arredondada(
          aoTocar: () => proximaEtapa(true),
          imagem: Estilos.imagem.icones.email,
          corImagem: Theme.of(context).primaryColor,
          arredondarBorda: BorderRadius.circular(15),
          ajuste: BoxFit.contain,
          largura: 50,
          altura: 50,
        );

    // ------------------------------------------------------------------------- Botão Google
    Widget botaoGoogle(
      BuildContext context,
      BuildContext contextOriginal,
    ) =>
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
                // ------------------------------------------------------------- Mensagem Indisponivel
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
        );

    // ------------------------------------------------------------------------- Botão Apple
    Widget botaoApple(
      BuildContext context,
      BuildContext contextOriginal,
    ) =>
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
                // ------------------------------------------------------------- Mensagem Indisponivel
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
        );

    // ------------------------------------------------------------------------- Botão Facebook
    Widget botaoFacebook(
      BuildContext context,
      BuildContext contextOriginal,
    ) =>
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
                // ------------------------------------------------------------- Mensagem Indisponivel
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
        );

    _dialogoRecuperarEmail(
      contextOriginal: context,
      etapaAtual: etapaAtual,
      controladorDeslizante: controladorDeslizante,
      proximaEtapa: proximaEtapa,
      email: email,
      botaoGoogle: botaoGoogle,
      botaoApple: botaoApple,
      botaoFacebook: botaoFacebook,
      botaoEmail: botaoEmail,
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
  void _exibirMensagemErro({
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

  // =========================================================================== Metodo Exibir Mensagem Erro
  void _dialogoRecuperarEmail({
    required BuildContext contextOriginal,
    required int etapaAtual,
    required PageController controladorDeslizante,
    required void Function(bool proxima) proximaEtapa,
    required String? email,
    required BotaoRecuperarSenha botaoGoogle,
    required BotaoRecuperarSenha botaoApple,
    required BotaoRecuperarSenha botaoFacebook,
    required BotaoRecuperarSenha botaoEmail,
  }) {
    final campoEmail = TextEditingController(text: email);
    final focoEmail = FocusNode();
    Sistemas.navegador.abrirDialogo(
      context: contextOriginal,
      persistente: true,
      dialogo: Componentes.dialogo.padrao(
        titulo: Idiomas.of(contextOriginal).tituloRecuperarSenha,
        conteudo: (context, atualizar) {
          String textoLegenda = Idiomas.of(context).textoEscolhaUmMetodo;
          String tituloBotaoPrimario = Idiomas.of(context).tituloProximo;

          return Column(
            children: <Widget>[
              // --------------------------------------------------------------- Texto
              Componentes.texto.padrao(
                texto: textoLegenda,
                estilo: Estilos.texto.normal(tamanho: 14),
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 300, maxHeight: 90),
                child: Componentes.pagina.deslizante(
                  fisica: const NeverScrollableScrollPhysics(),
                  controlador: controladorDeslizante,
                  aoMudar: (etapa) => atualizar(() {
                    etapaAtual = etapa;
                    if (etapa == 0) {
                      textoLegenda = Idiomas.of(context).textoEscolhaUmMetodo;
                    }
                  }),
                  conteudo: <Widget>[
                    // --------------------------------------------------------- Etapa 0
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        botaoGoogle(context, contextOriginal),
                        botaoApple(context, contextOriginal),
                        botaoFacebook(context, contextOriginal),
                        botaoEmail(context, contextOriginal),
                      ],
                    ),
                    // --------------------------------------------------------- Etapa 1
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.center,
                      child: Componentes.texto.campoEmail(
                        controlador: campoEmail,
                        foco: focoEmail,
                      ),
                    ),
                    // --------------------------------------------------------- Etapa 2
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.center,
                      child: Componentes.texto.padrao(texto: "Etapa2"),
                    ),
                  ],
                ),
              ),
              (etapaAtual != 0)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // ----------------------------------------------------- Botão Secundario
                        Componentes.botao.elevado(
                          aoPrecionar: () => proximaEtapa(false),
                          titulo: Idiomas.of(context).tituloVoltar,
                        ),
                        // ----------------------------------------------------- Botão Primario
                        Componentes.botao.elevado(
                          aoPrecionar: () {
                            proximaEtapa(true);
                          },
                          titulo: tituloBotaoPrimario,
                        ),
                      ],
                    )
                  // ----------------------------------------------------------- Botão Unitario
                  : Componentes.botao.elevado(
                      aoPrecionar: () => Sistemas.navegador.voltar(context),
                      titulo: Idiomas.of(context).tituloCancelar,
                    ),
            ],
          );
        },
      ),
    );
  }
}
