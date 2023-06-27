import 'package:noronhaecotech/configuracoes/importar_tudo.dart';

const String codigoErroAuth = "codigoErroAuth";

// ----------------------------------------------------------------------------- Sistemas Firebase Auth
class $SisFirebaseAuth {
  final String chaveUsuarioLogado = "usuario_logado";
  final FirebaseAuth instancia = FirebaseAuth.instance;
  final User? usuario = FirebaseAuth.instance.currentUser;
  final bool logado = FirebaseAuth.instance.currentUser != null;

  $SisFirebaseAuth() {
    Sistemas.dispositivo.aguardarRenderizacao((duracao) {
      final idiomaAtual = Idiomas.current.idioma;
      final authIdioma = FirebaseAuth.instance.languageCode;
      if (authIdioma != idiomaAtual) definirLinguagem;
    });
  }
  //////////////////////////////////////////////////////////////////////////////

  // =========================================================================== Auth Observador Autenticado
  void observadorAutenticacao({
    required VoidCallback acaoLogado,
    required VoidCallback acaoDeslogado,
  }) {
    Sistemas.dispositivo.aguardarRenderizacao((duracao) {
      instancia.authStateChanges().listen((usuario) {
        Sistemas.dados
            .recuperarChave(chave: chaveUsuarioLogado, valorPadrao: false)
            .then((logadoAnterior) {
          final logadoAtual = usuario != null;
          if (logadoAtual != logadoAnterior) {
            (logadoAtual) ? acaoLogado() : acaoDeslogado();
            Sistemas.dados.salvarChave(
              chave: chaveUsuarioLogado,
              valor: logadoAtual,
            );
          }
        });
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

  Future<void> get definirLinguagem {
    final linguagem = Idiomas.current.idioma;
    return instancia.setLanguageCode(linguagem);
  }

  void checarAcaoURL(String acaoURL) {
    final regex = RegExp(r'^mode=(?<modo>.+)&oobCode=(?<codigo>.+)$');


    if (regex.hasMatch(acaoURL)) {
      final resultado = regex.firstMatch(acaoURL)!;
      final modo = resultado.namedGroup("modo");
      final codigo = resultado.namedGroup("codigo");

      if (modo != null && codigo != null) {
        instancia.verifyPasswordResetCode(codigo).then((value) {
          print(value);
        });





      }




    }
  }

  // =========================================================================== Auth Verificar Provedor
  Future<List<String>> verificarProvedor({
    required BuildContext context,
    required String email,
  }) async {
    const codigoErro = "verificarProvedor";
    return await instancia
        .fetchSignInMethodsForEmail(email)
        .then((listaProvedores) => listaProvedores)
        .onError((FirebaseAuthException erro, stack) {
      _identificarErro(context: context, erro: erro);
      return <String>[];
    }).catchError((erro, stack) {
      _identificarErro(context: context, erro: erro, codigoErro: codigoErro);
      return <String>[];
    });
  }

  // =========================================================================== Auth Sair
  void sair() => instancia.signOut();

// ============================================================================= Auth Cadastrar com Email
  Future<bool> cadastrarEmail({
    required BuildContext context,
    required String email,
    required String senha,
  }) async {
    const codigoErro = "cadastrarEmail";
    try {
      final senhaCG = Sistemas.texto.criptografar(senha);
      return await verificarProvedor(context: context, email: email)
          .then((provedores) async {
        // --------------------------------------------------------------------- Conta Inexistente
        if (provedores.isEmpty) {
          Sistemas.navegador.abrirCarregamento(context);
          return await instancia
              .createUserWithEmailAndPassword(email: email, password: senhaCG)
              .then((credencialUsuario) => credencialUsuario.user)
              .then((usuarioEmail) async {
            if (usuarioEmail != null) {
              await Sistemas.firebase.dados.salvarDados(
                dados: DadosUsuarios(
                  criarUsuario: true,
                  uid: usuarioEmail.uid,
                  dataCriacao: usuarioEmail.metadata.creationTime.toString(),
                  nomePublico: email.substring(0, email.indexOf(r'@')),
                  email: email,
                  senha: senhaCG,
                ),
              );
              return true;
            } else {
              throw FirebaseAuthException(
                code: codigoErroAuth,
                message: Idiomas.current.textoAuthFalhaCadastro,
              );
            }
          }).timeout(const Duration(minutes: 60), onTimeout: () {
            throw FirebaseAuthException(
              code: codigoErroAuth,
              message: Idiomas.current.textoAuthExpirado,
            );
          });
        }
        // --------------------------------------------------------------------- Conta Existente
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
    } on FirebaseAuthException catch (erro) {
      _identificarErro(context: context, erro: erro);
      return false;
    } catch (erro) {
      _identificarErro(context: context, erro: erro, codigoErro: codigoErro);
      return false;
    }
  }

// ============================================================================= Auth Entrar com Email
  Future<bool> entrarEmail({
    required BuildContext context,
    required String email,
    required String senha,
  }) async {
    const codigoErro = "entrarEmail";
    try {
      final senhaCG = Sistemas.texto.criptografar(senha);
      return await verificarProvedor(context: context, email: email)
          .then((provedores) async {
        // --------------------------------------------------------------------- Conta Inexistente
        if (provedores.isEmpty) {
          final tituloEmail = Idiomas.current.tituloEmail;
          final tituloSenha = Idiomas.current.tituloSenha;
          final senhaOculta = senha.replaceAll(RegExp(r'.'), "*");
          Sistemas.navegador.abrirDialogo(
            context: context,
            persistente: true,
            dialogo: Componentes.dialogo.mensagem(
              titulo: Idiomas.current.tituloContaNaoEncontrada,
              texto: "${Idiomas.current.textoDesejaSeCadastrar}\n\n"
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
        // --------------------------------------------------------------------- Entrar Com Email
        else if (provedores.contains(EmailAuthProvider.PROVIDER_ID)) {
          Sistemas.navegador.abrirCarregamento(context);
          return await instancia
              .signInWithEmailAndPassword(email: email, password: senhaCG)
              .then((credencialUsuario) => credencialUsuario.user)
              .then((usuarioEmail) {
            if (usuarioEmail == null) {
              throw FirebaseAuthException(
                code: codigoErroAuth,
                message: Idiomas.current.textoAuthFalhaLogin,
              );
            } else {
              return true;
            }
          }).timeout(const Duration(minutes: 60), onTimeout: () {
            throw FirebaseAuthException(
              code: codigoErroAuth,
              message: Idiomas.current.textoAuthExpirado,
            );
          });
        }
        // --------------------------------------------------------------------- Sem Provedor Email
        else {
          return false;
        }
      });
    } on FirebaseAuthException catch (erro) {
      _identificarErro(context: context, erro: erro);
      return false;
    } catch (erro) {
      _identificarErro(context: context, erro: erro, codigoErro: codigoErro);
      return false;
    }
  }

  // =========================================================================== Auth Entrar com Google
  Future<bool> entrarGoogle(BuildContext context) async {
    const codigoErro = "entrarGoogle";
    try {
      Sistemas.navegador.abrirCarregamento(context);
      final provedorGoogle = GoogleAuthProvider();
      final tipoDispositivo = Sistemas.dispositivo.info.tipo;
      // ----------------------------------------------------------------------- Mobile
      if (tipoDispositivo == Dispositivo.tipoMobile) {
        return await instancia
            .signInWithProvider(provedorGoogle)
            .then((credencialUsuario) => credencialUsuario.user)
            .then((usuarioGoogle) async {
          if (usuarioGoogle != null) {
            await _salvarUsuarioRedes(context, usuarioGoogle);
            return true;
          } else {
            throw FirebaseAuthException(
              code: codigoErroAuth,
              message: Idiomas.current.textoAuthFalhaLogin,
            );
          }
        }).timeout(const Duration(minutes: 60), onTimeout: () {
          throw FirebaseAuthException(
            code: codigoErroAuth,
            message: Idiomas.current.textoAuthExpirado,
          );
        });
      }
      // ----------------------------------------------------------------------- Web
      else if (tipoDispositivo == Dispositivo.tipoWeb) {
        return await instancia
            .signInWithPopup(provedorGoogle)
            .then((credencialUsuario) => credencialUsuario.user)
            .then((usuarioGoogle) async {
          if (usuarioGoogle != null) {
            await _salvarUsuarioRedes(context, usuarioGoogle);
            return true;
          } else {
            throw FirebaseAuthException(
              code: codigoErroAuth,
              message: Idiomas.current.textoAuthFalhaLogin,
            );
          }
        }).timeout(const Duration(minutes: 60), onTimeout: () {
          throw FirebaseAuthException(
            code: codigoErroAuth,
            message: Idiomas.current.textoAuthExpirado,
          );
        });
      }
      // ----------------------------------------------------------------------- Outros
      else {
        throw FirebaseAuthException(
          code: codigoErro,
          message: Idiomas.current.textoPlataformaNaoSuportada,
        );
      }
    } on FirebaseAuthException catch (erro) {
      _identificarErro(context: context, erro: erro);
      return false;
    } catch (erro) {
      _identificarErro(context: context, erro: erro, codigoErro: codigoErro);
      return false;
    }
  }

  // =========================================================================== Auth Entrar com Apple
  Future<bool> entrarApple(BuildContext context) async {
    // ------------------------------------------------------------------------- Mensagem Indisponivel
    _exibirMensagem(
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
    _exibirMensagem(
      context: context,
      mensagem: "Facebook ${Idiomas.current.tituloIndisponivel}",
      corFundoErro: false,
      voltar: false,
    );
    return false;
  }

// =========================================================================== Auth Recuperar Senha
  void recuperarSenha({
    required BuildContext context,
    String? email,
  }) {
    const codigoErro = "recuperarSenha";
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
            Sistemas.navegador
                .redirecionarPagina(
              redirecionar: Paginas.acesso.usuario.recuperarSenha,
            )
                .then((configurado) {
              if (configurado) {
                Sistemas.navegador.voltar(context);
                entrarGoogle(contextOriginal).then((logado) {
                  if (!logado) Sistemas.navegador.limparRedirecionamento();
                });
              } else {
                final tituloGoogle = Idiomas.current.tituloGoogle;
                final indisponivel = Idiomas.current.tituloIndisponivel;
                throw FirebaseAuthException(
                  code: codigoErroAuth,
                  message: "$tituloGoogle $indisponivel",
                );
              }
            }).onError((FirebaseAuthException erro, stack) {
              Sistemas.navegador.limparRedirecionamento();
              _identificarErro(context: context, erro: erro);
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
            Sistemas.navegador
                .redirecionarPagina(
              redirecionar: Paginas.acesso.usuario.recuperarSenha,
            )
                .then((configurado) {
              if (configurado) {
                Sistemas.navegador.voltar(context);
                entrarApple(contextOriginal).then((logado) {
                  if (!logado) Sistemas.navegador.limparRedirecionamento();
                });
              } else {
                final tituloApple = Idiomas.current.tituloApple;
                final indisponivel = Idiomas.current.tituloIndisponivel;
                throw FirebaseAuthException(
                  code: codigoErroAuth,
                  message: "$tituloApple $indisponivel",
                );
              }
            }).onError((FirebaseAuthException erro, stack) {
              Sistemas.navegador.limparRedirecionamento();
              _identificarErro(context: context, erro: erro);
            });
          },
          imagem: Estilos.imagem.logos.apple,
          corImagem: Estilos.cor(context).primary,
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
            Sistemas.navegador
                .redirecionarPagina(
              redirecionar: Paginas.acesso.usuario.recuperarSenha,
            )
                .then((configurado) {
              if (configurado) {
                Sistemas.navegador.voltar(context);
                entrarFacebook(contextOriginal).then((logado) {
                  if (!logado) Sistemas.navegador.limparRedirecionamento();
                });
              } else {
                final tituloFacebook = Idiomas.current.tituloFacebook;
                final indisponivel = Idiomas.current.tituloIndisponivel;
                throw FirebaseAuthException(
                  code: codigoErroAuth,
                  message: "$tituloFacebook $indisponivel",
                );
              }
            }).onError((FirebaseAuthException erro, stack) {
              Sistemas.navegador.limparRedirecionamento();
              _identificarErro(context: context, erro: erro);
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
          corImagem: Estilos.cor(context).primary,
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
          if (indice == indiceFinal) {
            verificarProvedor(
              context: context,
              email: campoEmail.email,
            ).then((provedores) {
              if (provedores.contains(EmailAuthProvider.PROVIDER_ID)) {
                instancia
                    .sendPasswordResetEmail(email: campoEmail.email)
                    .then((_) {
                  // ----------------------------------------------------------- Mensagem Conclusão Recuperação de Senha
                  _exibirMensagem(
                    context: context,
                    mensagem: Idiomas.current.textoConclusaoRecuperacaoSenha,
                    corFundoErro: false,
                  );
                });
              } else {
                throw FirebaseAuthException(
                  code: codigoErroAuth,
                  message: Idiomas.current.textoContaNaoEncontrada,
                );
              }
            }).onError((FirebaseAuthException erro, stack) {
              _identificarErro(context: context, erro: erro);
            }).catchError((erro, stack) {
              _identificarErro(
                context: context,
                erro: erro,
                codigoErro: codigoErro,
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

  // =========================================================================== Auth Alterar Senha
  Future<bool> alterarSenha({
    required BuildContext context,
    required String senha,
  }) async {
    const codigoErro = "alterarSenha";
    try {
      Sistemas.navegador.abrirCarregamento(context);
      if (logado) {
        final senhaCG = Sistemas.texto.criptografar(senha);
        return await usuario!.updatePassword(senhaCG).then((value) {
          Sistemas.navegador.padrao(
            context: context,
            pagina: Paginas.acesso.usuario.perfil,
            fecharTodas: true,
          );
          return true;
        });
      } else {
        throw FirebaseAuthException(
          code: codigoErroAuth,
          message: Idiomas.current.tituloContaNaoEncontrada,
        );
      }
    } on FirebaseAuthException catch (erro) {
      _identificarErro(context: context, erro: erro);
      return false;
    } catch (erro) {
      _identificarErro(context: context, erro: erro, codigoErro: codigoErro);
      return false;
    }
  }

  // =========================================================================== Metodo Salvar Usuario
  Future<bool> _salvarUsuarioRedes(
      BuildContext context, User? usuarioRedes) async {
    const codigoErro = "_salvarUsuario";
    try {
      if (usuarioRedes == null) return false;
      final email = usuarioRedes.email;
      if (email == null) return false;
      return await verificarProvedor(context: context, email: email)
          .then((provedores) async {
        if (provedores.contains(EmailAuthProvider.PROVIDER_ID)) return true;
        final dadosUsuarios = DadosUsuarios(uid: usuarioRedes.uid);
        return await Sistemas.firebase.dados
            .recuperarDados(dadosRecuperar: dadosUsuarios)
            .then((dadosResposta) async {
          bool respostaSalvarDados = false;
          bool respostaCredencialEmail = false;
          if (dadosResposta == null) {
            respostaSalvarDados = await Sistemas.firebase.dados.salvarDados(
              dados: DadosUsuarios(
                criarUsuario: true,
                uid: usuarioRedes.uid,
                dataCriacao: usuarioRedes.metadata.creationTime.toString(),
                nomePublico: email.substring(0, email.indexOf(r'@')),
                email: usuarioRedes.email,
                senha: Sistemas.texto.criptografar(usuarioRedes.uid),
              ),
            );
          }
          final credencialEmail = EmailAuthProvider.credential(
            email: usuarioRedes.email!,
            password: (dadosResposta == null)
                ? Sistemas.texto.criptografar(usuarioRedes.uid)
                : dadosResposta.senha!,
          );
          respostaCredencialEmail = await usuarioRedes
              .linkWithCredential(credencialEmail)
              .then((credencialUsuario) => credencialUsuario.credential)
              .then((credencial) => credencial?.providerId)
              .then(
                  (idProvedor) => idProvedor == EmailAuthProvider.PROVIDER_ID);
          return respostaSalvarDados && respostaCredencialEmail;
        });
      });
    } on FirebaseAuthException catch (erro) {
      _identificarErro(context: context, erro: erro);
      return false;
    } catch (erro) {
      _identificarErro(context: context, erro: erro, codigoErro: codigoErro);
      return false;
    }
  }

  // =========================================================================== Metodo Exibir Mensagem Erro
  void _exibirMensagem({
    required BuildContext context,
    required String mensagem,
    bool? corFundoErro,
    bool? voltar,
  }) {
    Sistemas.navegador.abrirMensagem(
      context: context,
      flutuante: true,
      corFundo: (corFundoErro != false) ? Estilos.cor(context).error : null,
      mensagem: mensagem,
      aoVisualizar:
          (voltar != false) ? () => Sistemas.navegador.voltar(context) : null,
    );
  }

  // =========================================================================== Metodo Identificar Erro
  void _identificarErro({
    required BuildContext context,
    required Object erro,
    String? codigoErro,
  }) {
    if (codigoErro == null) {
      erro as FirebaseAuthException;
      // ----------------------------------------------------------------------- Mensagem Erro Auth
      if (erro.code == codigoErroAuth) {
        _exibirMensagem(
          context: context,
          mensagem: erro.message ?? Idiomas.current.textoErroDesconhecido,
        );
      }
      // ----------------------------------------------------------------------- Mensagem Auth Senha Invalida
      else if (erro.code.contains("wrong-password") ||
          erro.message!.contains("wrong-password")) {
        _exibirMensagem(
          context: context,
          mensagem: Idiomas.current.textoAuthEmailCamposInvalidos,
        );
      }
      // ----------------------------------------------------------------------- Mensagem Auth Muitas Tentativas
      else if (erro.code.contains("too-many-requests") ||
          erro.message!.contains("too-many-requests")) {
        _exibirMensagem(
          context: context,
          mensagem: Idiomas.current.textoMuitasTentativasConsecutivas,
        );
      }
      // ----------------------------------------------------------------------- Mensagem Auth Google Fechado
      else if (erro.code.contains("web-context-canceled") ||
          erro.message!.contains("popup-closed-by-user")) {
        _exibirMensagem(
          context: context,
          mensagem: Idiomas.current.textoAuthGoogleFechado,
        );
      }
      // ----------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
      else {
        Sistemas.dispositivo.reportarErro(
          erro: erro,
          local: ["Sistemas", "FirebaseAuth"],
          verificacao: codigoErroAuth,
        );
        _exibirMensagem(
          context: context,
          mensagem: Idiomas.current.textoErroDesconhecido,
        );
      }
    } else {
      // ----------------------------------------------------------------------- Mensagem Auth Erro Desconhecido
      Sistemas.dispositivo.reportarErro(
        erro: erro,
        local: ["Sistemas", "FirebaseAuth"],
        verificacao: codigoErro,
      );
      _exibirMensagem(
        context: context,
        mensagem: Idiomas.current.textoErroDesconhecido,
      );
    }
  }
}
