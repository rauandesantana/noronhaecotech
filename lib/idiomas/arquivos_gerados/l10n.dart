// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Idiomas {
  Idiomas();

  static Idiomas? _current;

  static Idiomas get current {
    assert(_current != null,
        'No instance of Idiomas was loaded. Try to initialize the Idiomas delegate before accessing Idiomas.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Idiomas> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Idiomas();
      Idiomas._current = instance;

      return instance;
    });
  }

  static Idiomas of(BuildContext context) {
    final instance = Idiomas.maybeOf(context);
    assert(instance != null,
        'No instance of Idiomas present in the widget tree. Did you add Idiomas.delegate in localizationsDelegates?');
    return instance!;
  }

  static Idiomas? maybeOf(BuildContext context) {
    return Localizations.of<Idiomas>(context, Idiomas);
  }

  /// `Carregando`
  String get tituloCarregando {
    return Intl.message(
      'Carregando',
      name: 'tituloCarregando',
      desc: '',
      args: [],
    );
  }

  /// `Indisponível`
  String get tituloIndisponivel {
    return Intl.message(
      'Indisponível',
      name: 'tituloIndisponivel',
      desc: '',
      args: [],
    );
  }

  /// `Celular`
  String get tituloCelular {
    return Intl.message(
      'Celular',
      name: 'tituloCelular',
      desc: '',
      args: [],
    );
  }

  /// `Senha`
  String get tituloSenha {
    return Intl.message(
      'Senha',
      name: 'tituloSenha',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar Senha`
  String get tituloConfirmarSenha {
    return Intl.message(
      'Confirmar Senha',
      name: 'tituloConfirmarSenha',
      desc: '',
      args: [],
    );
  }

  /// `Nome Completo`
  String get tituloNome {
    return Intl.message(
      'Nome Completo',
      name: 'tituloNome',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get tituloEmail {
    return Intl.message(
      'E-mail',
      name: 'tituloEmail',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get tituloGoogle {
    return Intl.message(
      'Google',
      name: 'tituloGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Apple`
  String get tituloApple {
    return Intl.message(
      'Apple',
      name: 'tituloApple',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get tituloFacebook {
    return Intl.message(
      'Facebook',
      name: 'tituloFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Buscar`
  String get tituloBuscar {
    return Intl.message(
      'Buscar',
      name: 'tituloBuscar',
      desc: '',
      args: [],
    );
  }

  /// `Selecionar`
  String get tituloSelecionar {
    return Intl.message(
      'Selecionar',
      name: 'tituloSelecionar',
      desc: '',
      args: [],
    );
  }

  /// `Voltar`
  String get tituloVoltar {
    return Intl.message(
      'Voltar',
      name: 'tituloVoltar',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get tituloCancelar {
    return Intl.message(
      'Cancelar',
      name: 'tituloCancelar',
      desc: '',
      args: [],
    );
  }

  /// `Aceitar`
  String get tituloAceitar {
    return Intl.message(
      'Aceitar',
      name: 'tituloAceitar',
      desc: '',
      args: [],
    );
  }

  /// `Saiba mais!`
  String get tituloSaibaMais {
    return Intl.message(
      'Saiba mais!',
      name: 'tituloSaibaMais',
      desc: '',
      args: [],
    );
  }

  /// `Entrar`
  String get tituloEntrar {
    return Intl.message(
      'Entrar',
      name: 'tituloEntrar',
      desc: '',
      args: [],
    );
  }

  /// `Cadastre-se`
  String get tituloCadastrar {
    return Intl.message(
      'Cadastre-se',
      name: 'tituloCadastrar',
      desc: '',
      args: [],
    );
  }

  /// `Entrar com`
  String get tituloEntrarCom {
    return Intl.message(
      'Entrar com',
      name: 'tituloEntrarCom',
      desc: '',
      args: [],
    );
  }

  /// `Outro`
  String get tituloDDIOutro {
    return Intl.message(
      'Outro',
      name: 'tituloDDIOutro',
      desc: '',
      args: [],
    );
  }

  /// `Recuperar Senha`
  String get tituloRecuperarSenha {
    return Intl.message(
      'Recuperar Senha',
      name: 'tituloRecuperarSenha',
      desc: '',
      args: [],
    );
  }

  /// `Conta Não Encontrada`
  String get tituloContaNaoEncontrada {
    return Intl.message(
      'Conta Não Encontrada',
      name: 'tituloContaNaoEncontrada',
      desc: '',
      args: [],
    );
  }

  /// `E-mail Já Cadastrado`
  String get tituloContaEncontrada {
    return Intl.message(
      'E-mail Já Cadastrado',
      name: 'tituloContaEncontrada',
      desc: '',
      args: [],
    );
  }

  /// `Próximo`
  String get tituloProximo {
    return Intl.message(
      'Próximo',
      name: 'tituloProximo',
      desc: '',
      args: [],
    );
  }

  /// `Concluir`
  String get tituloConcluir {
    return Intl.message(
      'Concluir',
      name: 'tituloConcluir',
      desc: '',
      args: [],
    );
  }

  /// `Deseja se cadastrar usando esse E-mail e Senha?`
  String get textoContaNaoEncontrada {
    return Intl.message(
      'Deseja se cadastrar usando esse E-mail e Senha?',
      name: 'textoContaNaoEncontrada',
      desc: '',
      args: [],
    );
  }

  /// `Deseja ir para página de login?`
  String get textoContaEncontrada {
    return Intl.message(
      'Deseja ir para página de login?',
      name: 'textoContaEncontrada',
      desc: '',
      args: [],
    );
  }

  /// `Plataforma não suportada.`
  String get textoPlataformaNaoSuportada {
    return Intl.message(
      'Plataforma não suportada.',
      name: 'textoPlataformaNaoSuportada',
      desc: '',
      args: [],
    );
  }

  /// `Erro Desconhecido`
  String get textoErroDesconhecido {
    return Intl.message(
      'Erro Desconhecido',
      name: 'textoErroDesconhecido',
      desc: '',
      args: [],
    );
  }

  /// `Falha ao concluir autenticação do usuário.`
  String get textoAuthFalhaLogin {
    return Intl.message(
      'Falha ao concluir autenticação do usuário.',
      name: 'textoAuthFalhaLogin',
      desc: '',
      args: [],
    );
  }

  /// `Falha ao concluir cadastro do usuário.`
  String get textoAuthFalhaCadastro {
    return Intl.message(
      'Falha ao concluir cadastro do usuário.',
      name: 'textoAuthFalhaCadastro',
      desc: '',
      args: [],
    );
  }

  /// `Campos de E-mail e Senha estão inválidos.`
  String get textoAuthEmailCamposInvalidos {
    return Intl.message(
      'Campos de E-mail e Senha estão inválidos.',
      name: 'textoAuthEmailCamposInvalidos',
      desc: '',
      args: [],
    );
  }

  /// `Falha ao salvar os dados do usuário.`
  String get textoAuthUsuarioNaoSalvo {
    return Intl.message(
      'Falha ao salvar os dados do usuário.',
      name: 'textoAuthUsuarioNaoSalvo',
      desc: '',
      args: [],
    );
  }

  /// `Tempo de autenticação excedeu 60 minutos.`
  String get textoAuthExpirado {
    return Intl.message(
      'Tempo de autenticação excedeu 60 minutos.',
      name: 'textoAuthExpirado',
      desc: '',
      args: [],
    );
  }

  /// `Página de autenticação Google foi fechada.`
  String get textoAuthGoogleFechado {
    return Intl.message(
      'Página de autenticação Google foi fechada.',
      name: 'textoAuthGoogleFechado',
      desc: '',
      args: [],
    );
  }

  /// `Escolha um método para continuar.`
  String get textoEscolhaUmMetodo {
    return Intl.message(
      'Escolha um método para continuar.',
      name: 'textoEscolhaUmMetodo',
      desc: '',
      args: [],
    );
  }

  /// `Informe o e-mail da sua conta cadastrada.`
  String get textoInformarEmail {
    return Intl.message(
      'Informe o e-mail da sua conta cadastrada.',
      name: 'textoInformarEmail',
      desc: '',
      args: [],
    );
  }

  /// `Informe o código enviado para o seu e-mail.`
  String get textoInformeCodigoEmail {
    return Intl.message(
      'Informe o código enviado para o seu e-mail.',
      name: 'textoInformeCodigoEmail',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Idiomas> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Idiomas> load(Locale locale) => Idiomas.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
