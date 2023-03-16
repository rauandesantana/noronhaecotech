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

  /// `Indisponível`
  String get paginaTituloIndisponivel {
    return Intl.message(
      'Indisponível',
      name: 'paginaTituloIndisponivel',
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
