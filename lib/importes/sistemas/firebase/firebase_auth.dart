import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

// ----------------------------------------------------------------------------- Sistemas Firebase Auth
class $SisFirebaseAuth {
  final String chaveUsuarioLogado = "usuario_logado";
  final String chaveDadosLogado = "dados_logado";
  final FirebaseAuth instancia = FirebaseAuth.instance;
  final User? usuario = FirebaseAuth.instance.currentUser;
  final bool logado = FirebaseAuth.instance.currentUser != null;

  $SisFirebaseAuth() {
    Sistemas.dispositivo.aguardarRenderizacao((p0) {
      final authIdioma = FirebaseAuth.instance.languageCode;
      final idiomaAtual = Idiomas.current.idioma;
      if (authIdioma != idiomaAtual) definirLinguagem;
    });
  }
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

  Future<void> get definirLinguagem {
    final linguagem = Idiomas.current.idioma;
    return instancia.setLanguageCode(linguagem);
  }

  // =========================================================================== Auth Recuperar Senha
  void recuperarSenha({
    required BuildContext context,
    String? email,
  }) {
    final contextOriginal = context;
    final pagina = ControladorPagina(indiceInicial: 0);
    final campoEmail = ControladorEmail(textoInicial: email);
    final focoEmail = FocusNode();

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
                final tituloGoogle = Idiomas.current.tituloGoogle;
                final indisponivel = Idiomas.current.tituloIndisponivel;
                _exibirMensagemErro(
                  context: context,
                  mensagem: "$tituloGoogle $indisponivel",
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
                final tituloApple = Idiomas.current.tituloApple;
                final indisponivel = Idiomas.current.tituloIndisponivel;
                _exibirMensagemErro(
                  context: context,
                  mensagem: "$tituloApple $indisponivel",
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
                final tituloFacebook = Idiomas.current.tituloFacebook;
                final indisponivel = Idiomas.current.tituloIndisponivel;
                _exibirMensagemErro(
                  context: context,
                  mensagem: "$tituloFacebook $indisponivel",
                );
              }
            });
          },
          imagem: Estilos.imagem.logos.facebook,
          ajuste: BoxFit.contain,
          diametro: 50,
        );

    // ------------------------------------------------------------------------- Botão Email
    Widget botaoEmail(
      BuildContext context,
      BuildContext contextOriginal,
    ) =>
        Componentes.imagem.arredondada(
          aoTocar: () => pagina.alterarIndice(1),
          imagem: Estilos.imagem.icones.email,
          corImagem: Theme.of(context).primaryColor,
          arredondarBorda: BorderRadius.circular(15),
          ajuste: BoxFit.contain,
          largura: 50,
          altura: 50,
        );

    Sistemas.navegador.abrirDialogo(
      context: context,
      persistente: true,
      dialogo: Componentes.dialogo.sequencial(
        larguraPadrao: 350,
        alturaPadrao: 80,
        controlador: pagina,
        titulo: Idiomas.current.tituloRecuperarSenha,
        aoMudar: (indice, indiceFinal) {
          print("rauan: $indice | $indiceFinal");
          if (indice == indiceFinal) {
            instancia
                .sendPasswordResetEmail(email: campoEmail.email)
                .then((value) {
              // --------------------------------------------------------------- Mensagem Email Enviado
              _exibirMensagemErro(
                context: context,
                mensagem: Idiomas.current.textoConclusaoRecuperacaoSenha,
                corFundoErro: false,
              );
            }).onError((error, stackTrace) {
              // --------------------------------------------------------------- Mensagem Indisponivel
              final tituloEmail = Idiomas.current.tituloEmail;
              final indisponivel = Idiomas.current.tituloIndisponivel;
              _exibirMensagemErro(
                context: context,
                mensagem: "$tituloEmail $indisponivel",
              );
            });
          }
        },
        dialogoSequencial: <DialogoSequencial>[
          // ------------------------------------------------------------------- Etapa 0
          DialogoSequencial(
            conteudo: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                botaoGoogle(context, contextOriginal),
                botaoApple(context, contextOriginal),
                botaoFacebook(context, contextOriginal),
                botaoEmail(context, contextOriginal),
              ],
            ),
            descricao: Idiomas.current.textoEscolhaUmMetodo,
            tituloBotaoPrimario: Idiomas.current.tituloCancelar,
            acaoBotaoPrimario: () => Sistemas.navegador.voltar(context),
          ),
          // ------------------------------------------------------------------- Etapa 1
          DialogoSequencial(
            conteudo: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              child: Componentes.texto.campoEmail(
                controlador: campoEmail,
                foco: focoEmail,
              ),
            ),
            descricao: Idiomas.current.textoInformarEmail,
            tituloBotaoPrimario: Idiomas.current.tituloProximo,
            acaoBotaoPrimario: () {
              final validarEmail = campoEmail.validarEmail;
              if (validarEmail) pagina.proximoIndice();
            },
            tituloBotaoSecundario: Idiomas.current.tituloVoltar,
            acaoBotaoSecundario: () => pagina.retrocederIndice(),
          ),

          // ------------------------------------------------------------------- Etapa 2
          DialogoSequencial(
            conteudo: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              child: Componentes.carregamento.circular(),
            ),
            descricao: Idiomas.current.tituloCarregando,
          ),
        ],
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
                  mensagem: Idiomas.current.textoAuthUsuarioNaoSalvo,
                  voltar: false,
                );
              }
            });
          } else {
            // ----------------------------------------------------------------- Mensagem Auth Falha Cadastro
            _exibirMensagemErro(
              context: context,
              mensagem: Idiomas.current.textoAuthFalhaCadastro,
            );
          }
          return usuarioEmail != null;
        }).timeout(const Duration(minutes: 60), onTimeout: () {
          // ------------------------------------------------------------------- Mensagem Auth Expirado
          _exibirMensagemErro(
            context: context,
            mensagem: Idiomas.current.textoAuthExpirado,
          );
          return false;
        }).onError((FirebaseAuthException erro, pilha) {
          // ------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
          final textoErro = Idiomas.current.textoErroDesconhecido;
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
            titulo: Idiomas.current.tituloContaEncontrada,
            texto: Idiomas.current.textoContaEncontrada,
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
        final tituloEmail = Idiomas.current.tituloEmail;
        final tituloSenha = Idiomas.current.tituloSenha;
        final senhaOculta = senha.replaceAll(RegExp(r'.'), "*");
        Sistemas.navegador.abrirDialogo(
          context: context,
          persistente: true,
          dialogo: Componentes.dialogo.mensagem(
            titulo: Idiomas.current.tituloContaNaoEncontrada,
            texto: "${Idiomas.current.textoContaNaoEncontrada}\n\n"
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
              mensagem: Idiomas.current.textoAuthFalhaLogin,
            );
          }
          return usuarioEmail != null;
        }).timeout(const Duration(minutes: 60), onTimeout: () {
          // ------------------------------------------------------------------- Mensagem Auth Expirado
          _exibirMensagemErro(
            context: context,
            mensagem: Idiomas.current.textoAuthExpirado,
          );
          return false;
        }).onError((FirebaseAuthException erro, pilha) {
          if (erro.message!.contains("auth/wrong-password")) {
            // ----------------------------------------------------------------- Mensagem Auth Email Campos Inválidos
            _exibirMensagemErro(
              context: context,
              mensagem: Idiomas.current.textoAuthEmailCamposInvalidos,
            );
            return false;
          } else {
            // ------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
            final textoErro = Idiomas.current.textoErroDesconhecido;
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
                mensagem: Idiomas.current.textoAuthUsuarioNaoSalvo,
                voltar: false,
              );
            }
          });
        } else {
          // ------------------------------------------------------------------- Mensagem Auth Falha Login
          _exibirMensagemErro(
            context: context,
            mensagem: Idiomas.current.textoAuthFalhaLogin,
          );
        }
        return usuarioGoogle != null;
      }).timeout(const Duration(minutes: 60), onTimeout: () {
        // --------------------------------------------------------------------- Mensagem Auth Expirado
        _exibirMensagemErro(
          context: context,
          mensagem: Idiomas.current.textoAuthExpirado,
        );
        return false;
      }).onError((FirebaseAuthException erro, pilha) {
        if (erro.message!.contains("auth/popup-closed-by-user") ||
            erro.code.contains("web-context-canceled")) {
          // ------------------------------------------------------------------- Mensagem Auth Google Fechado
          _exibirMensagemErro(
            context: context,
            mensagem: Idiomas.current.textoAuthGoogleFechado,
          );
          return false;
        } else {
          // ------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
          final textoErro = Idiomas.current.textoErroDesconhecido;
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
                mensagem: Idiomas.current.textoAuthUsuarioNaoSalvo,
                voltar: false,
              );
            }
          });
        } else {
          // ------------------------------------------------------------------- Mensagem Auth Falha Login
          _exibirMensagemErro(
            context: context,
            mensagem: Idiomas.current.textoAuthFalhaLogin,
          );
        }
        return usuarioGoogle != null;
      }).timeout(const Duration(minutes: 60), onTimeout: () {
        // --------------------------------------------------------------------- Mensagem Auth Expirado
        _exibirMensagemErro(
          context: context,
          mensagem: Idiomas.current.textoAuthExpirado,
        );
        return false;
      }).onError((FirebaseAuthException erro, pilha) {
        if (erro.message!.contains("auth/popup-closed-by-user") ||
            erro.code.contains("web-context-canceled")) {
          // ------------------------------------------------------------------- Mensagem Auth Google Fechado
          _exibirMensagemErro(
            context: context,
            mensagem: Idiomas.current.textoAuthGoogleFechado,
          );
          return false;
        } else {
          // ------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
          final textoErro = Idiomas.current.textoErroDesconhecido;
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
        mensagem: Idiomas.current.textoPlataformaNaoSuportada,
      );
      return false;
    }
  }

  // =========================================================================== Auth Entrar com Apple
  Future<bool> entrarApple(BuildContext context) async {
    // ------------------------------------------------------------------------- Mensagem Indisponivel
    _exibirMensagemErro(
      context: context,
      mensagem: "Apple ${Idiomas.current.tituloIndisponivel}",
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
      mensagem: "Facebook ${Idiomas.current.tituloIndisponivel}",
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
}
