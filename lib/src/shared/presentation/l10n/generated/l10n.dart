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

  /// `Main game`
  String get mainGame {
    return Intl.message(
      'Main game',
      name: 'mainGame',
      desc: '',
      args: [],
    );
  }

  /// `DLC addon`
  String get dlcAddon {
    return Intl.message(
      'DLC addon',
      name: 'dlcAddon',
      desc: '',
      args: [],
    );
  }

  /// `Expansion`
  String get expansion {
    return Intl.message(
      'Expansion',
      name: 'expansion',
      desc: '',
      args: [],
    );
  }

  /// `Bundle`
  String get bundle {
    return Intl.message(
      'Bundle',
      name: 'bundle',
      desc: '',
      args: [],
    );
  }

  /// `Standalone expansion`
  String get standaloneExpansion {
    return Intl.message(
      'Standalone expansion',
      name: 'standaloneExpansion',
      desc: '',
      args: [],
    );
  }

  /// `Mod`
  String get mod {
    return Intl.message(
      'Mod',
      name: 'mod',
      desc: '',
      args: [],
    );
  }

  /// `Episode`
  String get episode {
    return Intl.message(
      'Episode',
      name: 'episode',
      desc: '',
      args: [],
    );
  }

  /// `Season`
  String get season {
    return Intl.message(
      'Season',
      name: 'season',
      desc: '',
      args: [],
    );
  }

  /// `Remake`
  String get remake {
    return Intl.message(
      'Remake',
      name: 'remake',
      desc: '',
      args: [],
    );
  }

  /// `Remaster`
  String get remaster {
    return Intl.message(
      'Remaster',
      name: 'remaster',
      desc: '',
      args: [],
    );
  }

  /// `Expanded game`
  String get expandedGame {
    return Intl.message(
      'Expanded game',
      name: 'expandedGame',
      desc: '',
      args: [],
    );
  }

  /// `Port`
  String get port {
    return Intl.message(
      'Port',
      name: 'port',
      desc: '',
      args: [],
    );
  }

  /// `Fork`
  String get fork {
    return Intl.message(
      'Fork',
      name: 'fork',
      desc: '',
      args: [],
    );
  }

  /// `Released`
  String get released {
    return Intl.message(
      'Released',
      name: 'released',
      desc: '',
      args: [],
    );
  }

  /// `Alpha`
  String get alpha {
    return Intl.message(
      'Alpha',
      name: 'alpha',
      desc: '',
      args: [],
    );
  }

  /// `Beta`
  String get beta {
    return Intl.message(
      'Beta',
      name: 'beta',
      desc: '',
      args: [],
    );
  }

  /// `Early access`
  String get earlyAccess {
    return Intl.message(
      'Early access',
      name: 'earlyAccess',
      desc: '',
      args: [],
    );
  }

  /// `Offline`
  String get offline {
    return Intl.message(
      'Offline',
      name: 'offline',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Rumored`
  String get rumored {
    return Intl.message(
      'Rumored',
      name: 'rumored',
      desc: '',
      args: [],
    );
  }

  /// `Delisted`
  String get delisted {
    return Intl.message(
      'Delisted',
      name: 'delisted',
      desc: '',
      args: [],
    );
  }

  /// `List of games`
  String get listGames {
    return Intl.message(
      'List of games',
      name: 'listGames',
      desc: '',
      args: [],
    );
  }

  /// `You have fetched all of the content`
  String get youHaveFetchedAllContent {
    return Intl.message(
      'You have fetched all of the content',
      name: 'youHaveFetchedAllContent',
      desc: '',
      args: [],
    );
  }

  /// `Server error`
  String get serverError {
    return Intl.message(
      'Server error',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `There are no games`
  String get thereNotGames {
    return Intl.message(
      'There are no games',
      name: 'thereNotGames',
      desc: '',
      args: [],
    );
  }

  /// `Details of the game`
  String get detailsGame {
    return Intl.message(
      'Details of the game',
      name: 'detailsGame',
      desc: '',
      args: [],
    );
  }

  /// `Category: {value}`
  String categoryPlus(Object value) {
    return Intl.message(
      'Category: $value',
      name: 'categoryPlus',
      desc: '',
      args: [value],
    );
  }

  /// `Screenshots`
  String get screenshots {
    return Intl.message(
      'Screenshots',
      name: 'screenshots',
      desc: '',
      args: [],
    );
  }

  /// `Similar games`
  String get similarGames {
    return Intl.message(
      'Similar games',
      name: 'similarGames',
      desc: '',
      args: [],
    );
  }

  /// `Go to page`
  String get goToPage {
    return Intl.message(
      'Go to page',
      name: 'goToPage',
      desc: '',
      args: [],
    );
  }

  /// `Can't launch the game page`
  String get cantToLauncher {
    return Intl.message(
      'Can\'t launch the game page',
      name: 'cantToLauncher',
      desc: '',
      args: [],
    );
  }

  /// `Not connected to the internet`
  String get notConnectedInternet {
    return Intl.message(
      'Not connected to the internet',
      name: 'notConnectedInternet',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
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
