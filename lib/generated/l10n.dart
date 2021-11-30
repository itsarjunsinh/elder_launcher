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

  /// `Apps`
  String get Apps {
    return Intl.message(
      'Apps',
      name: 'Apps',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get Contacts {
    return Intl.message(
      'Contacts',
      name: 'Contacts',
      desc: '',
      args: [],
    );
  }

  /// `All Apps`
  String get btnAllApps {
    return Intl.message(
      'All Apps',
      name: 'btnAllApps',
      desc: '',
      args: [],
    );
  }

  /// `All Contacts`
  String get btnAllContacts {
    return Intl.message(
      'All Contacts',
      name: 'btnAllContacts',
      desc: '',
      args: [],
    );
  }

  /// `Add Favourite Apps`
  String get btnAddFavApps {
    return Intl.message(
      'Add Favourite Apps',
      name: 'btnAddFavApps',
      desc: '',
      args: [],
    );
  }

  /// `Add Favourite Contacts`
  String get btnAddFavContacts {
    return Intl.message(
      'Add Favourite Contacts',
      name: 'btnAddFavContacts',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get btnBackToHome {
    return Intl.message(
      'Back to Home',
      name: 'btnBackToHome',
      desc: '',
      args: [],
    );
  }

  /// `Grant Permission`
  String get btnGrantPermission {
    return Intl.message(
      'Grant Permission',
      name: 'btnGrantPermission',
      desc: '',
      args: [],
    );
  }

  /// `Set as Default`
  String get btnSetDefaultLauncher {
    return Intl.message(
      'Set as Default',
      name: 'btnSetDefaultLauncher',
      desc: '',
      args: [],
    );
  }

  /// `No data available. Try again in a few seconds.`
  String get msgNoData {
    return Intl.message(
      'No data available. Try again in a few seconds.',
      name: 'msgNoData',
      desc: '',
      args: [],
    );
  }

  /// `You haven't added any favourites`
  String get msgNoFavourites {
    return Intl.message(
      'You haven\'t added any favourites',
      name: 'msgNoFavourites',
      desc: '',
      args: [],
    );
  }

  /// `To add favourite contacts to this screen, allow this app access to your contacts.`
  String get msgNoContactsPermission {
    return Intl.message(
      'To add favourite contacts to this screen, allow this app access to your contacts.',
      name: 'msgNoContactsPermission',
      desc: '',
      args: [],
    );
  }

  /// `To make calling easier, allow this app to start phone calls for you.`
  String get msgNoPhonePermission {
    return Intl.message(
      'To make calling easier, allow this app to start phone calls for you.',
      name: 'msgNoPhonePermission',
      desc: '',
      args: [],
    );
  }

  /// `Open apps and contacts faster by making Elder Launcher the home app.`
  String get msgNotDefaultLauncher {
    return Intl.message(
      'Open apps and contacts faster by making Elder Launcher the home app.',
      name: 'msgNotDefaultLauncher',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get dlgCall {
    return Intl.message(
      'Call',
      name: 'dlgCall',
      desc: '',
      args: [],
    );
  }

  /// `Edit Favourites`
  String get dlgEditTitle {
    return Intl.message(
      'Edit Favourites',
      name: 'dlgEditTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get dlgCancel {
    return Intl.message(
      'Cancel',
      name: 'dlgCancel',
      desc: '',
      args: [],
    );
  }

  /// `Open Settings`
  String get dlgOpenSettings {
    return Intl.message(
      'Open Settings',
      name: 'dlgOpenSettings',
      desc: '',
      args: [],
    );
  }

  /// `Add/Remove Apps`
  String get dlgAppsAddRemove {
    return Intl.message(
      'Add/Remove Apps',
      name: 'dlgAppsAddRemove',
      desc: '',
      args: [],
    );
  }

  /// `Reorder Apps`
  String get dlgAppsReorder {
    return Intl.message(
      'Reorder Apps',
      name: 'dlgAppsReorder',
      desc: '',
      args: [],
    );
  }

  /// `Reload App List`
  String get dlgAppsReload {
    return Intl.message(
      'Reload App List',
      name: 'dlgAppsReload',
      desc: '',
      args: [],
    );
  }

  /// `Add/Remove Contacts`
  String get dlgContactsAddRemove {
    return Intl.message(
      'Add/Remove Contacts',
      name: 'dlgContactsAddRemove',
      desc: '',
      args: [],
    );
  }

  /// `Reorder Contacts`
  String get dlgContactsReorder {
    return Intl.message(
      'Reorder Contacts',
      name: 'dlgContactsReorder',
      desc: '',
      args: [],
    );
  }

  /// `Reload Contacts`
  String get dlgContactsReload {
    return Intl.message(
      'Reload Contacts',
      name: 'dlgContactsReload',
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
      Locale.fromSubtags(languageCode: 'cs'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'nl'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ru'),
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
