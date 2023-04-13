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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Personajes`
  String get charactersTitle {
    return Intl.message(
      'Personajes',
      name: 'charactersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sin descripción`
  String get noDescription {
    return Intl.message(
      'Sin descripción',
      name: 'noDescription',
      desc: '',
      args: [],
    );
  }

  /// `Comics`
  String get comics {
    return Intl.message(
      'Comics',
      name: 'comics',
      desc: '',
      args: [],
    );
  }

  /// `Eventos`
  String get events {
    return Intl.message(
      'Eventos',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `Series`
  String get series {
    return Intl.message(
      'Series',
      name: 'series',
      desc: '',
      args: [],
    );
  }

  /// `Historias`
  String get stories {
    return Intl.message(
      'Historias',
      name: 'stories',
      desc: '',
      args: [],
    );
  }

  /// `Modificado`
  String get modified {
    return Intl.message(
      'Modificado',
      name: 'modified',
      desc: '',
      args: [],
    );
  }

  /// `Ver todo`
  String get viewAll {
    return Intl.message(
      'Ver todo',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Personajes`
  String get characters {
    return Intl.message(
      'Personajes',
      name: 'characters',
      desc: '',
      args: [],
    );
  }

  /// `Creadores`
  String get creators {
    return Intl.message(
      'Creadores',
      name: 'creators',
      desc: '',
      args: [],
    );
  }

  /// `Páginas`
  String get pages {
    return Intl.message(
      'Páginas',
      name: 'pages',
      desc: '',
      args: [],
    );
  }

  /// `Precio de impresión`
  String get printPrice {
    return Intl.message(
      'Precio de impresión',
      name: 'printPrice',
      desc: '',
      args: [],
    );
  }

  /// `Publicado`
  String get publised {
    return Intl.message(
      'Publicado',
      name: 'publised',
      desc: '',
      args: [],
    );
  }

  /// `Unlimited`
  String get unlimited {
    return Intl.message(
      'Unlimited',
      name: 'unlimited',
      desc: '',
      args: [],
    );
  }

  /// `Compra digital`
  String get digitalPurchase {
    return Intl.message(
      'Compra digital',
      name: 'digitalPurchase',
      desc: '',
      args: [],
    );
  }

  /// `Formato`
  String get format {
    return Intl.message(
      'Formato',
      name: 'format',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
