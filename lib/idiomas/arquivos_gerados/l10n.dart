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
  String get tituloTextoCampoCelular {
    return Intl.message(
      'Celular',
      name: 'tituloTextoCampoCelular',
      desc: '',
      args: [],
    );
  }

  /// `Senha`
  String get tituloTextoCampoSenha {
    return Intl.message(
      'Senha',
      name: 'tituloTextoCampoSenha',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar Senha`
  String get tituloTextoCampoReSenha {
    return Intl.message(
      'Confirmar Senha',
      name: 'tituloTextoCampoReSenha',
      desc: '',
      args: [],
    );
  }

  /// `Nome Completo`
  String get tituloTextoCampoNome {
    return Intl.message(
      'Nome Completo',
      name: 'tituloTextoCampoNome',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get tituloTextoCampoEmail {
    return Intl.message(
      'E-mail',
      name: 'tituloTextoCampoEmail',
      desc: '',
      args: [],
    );
  }

  /// `Buscar`
  String get tituloTextoCampoBuscar {
    return Intl.message(
      'Buscar',
      name: 'tituloTextoCampoBuscar',
      desc: '',
      args: [],
    );
  }

  /// `Selecionar`
  String get tituloTextoCampoSelecionar {
    return Intl.message(
      'Selecionar',
      name: 'tituloTextoCampoSelecionar',
      desc: '',
      args: [],
    );
  }

  /// `Voltar`
  String get tituloBotaoVoltar {
    return Intl.message(
      'Voltar',
      name: 'tituloBotaoVoltar',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get tituloBotaoCancelar {
    return Intl.message(
      'Cancelar',
      name: 'tituloBotaoCancelar',
      desc: '',
      args: [],
    );
  }

  /// `Aceitar`
  String get tituloBotaoAceitar {
    return Intl.message(
      'Aceitar',
      name: 'tituloBotaoAceitar',
      desc: '',
      args: [],
    );
  }

  /// `Saiba mais!`
  String get tituloBotaoSaibaMais {
    return Intl.message(
      'Saiba mais!',
      name: 'tituloBotaoSaibaMais',
      desc: '',
      args: [],
    );
  }

  /// `Entrar`
  String get tituloBotaoEntrar {
    return Intl.message(
      'Entrar',
      name: 'tituloBotaoEntrar',
      desc: '',
      args: [],
    );
  }

  /// `Cadastre-se`
  String get tituloBotaoCadastrar {
    return Intl.message(
      'Cadastre-se',
      name: 'tituloBotaoCadastrar',
      desc: '',
      args: [],
    );
  }

  /// `Recuperar Senha`
  String get tituloBotaoRecuperarSenha {
    return Intl.message(
      'Recuperar Senha',
      name: 'tituloBotaoRecuperarSenha',
      desc: '',
      args: [],
    );
  }

  /// `Entrar com`
  String get tituloBotoesLoginRapido {
    return Intl.message(
      'Entrar com',
      name: 'tituloBotoesLoginRapido',
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

  /// `Conta Não Encontrada`
  String get tituloContaNaoEncontrada {
    return Intl.message(
      'Conta Não Encontrada',
      name: 'tituloContaNaoEncontrada',
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

  /// `E-mail Já Cadastrado`
  String get tituloContaEncontrada {
    return Intl.message(
      'E-mail Já Cadastrado',
      name: 'tituloContaEncontrada',
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

  /// `Deseja ir para página de login?`
  String get textoContaEncontrada {
    return Intl.message(
      'Deseja ir para página de login?',
      name: 'textoContaEncontrada',
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

  /// `Campo de E-mail ou Senha está inválido.`
  String get textoAuthEmailCamposInvalidos {
    return Intl.message(
      'Campo de E-mail ou Senha está inválido.',
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
