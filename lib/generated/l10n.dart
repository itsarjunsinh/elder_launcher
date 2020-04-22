// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S();
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S();
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get Apps {
    return Intl.message(
      'Apps',
      name: 'Apps',
      desc: '',
      args: [],
    );
  }

  String get Contacts {
    return Intl.message(
      'Contacts',
      name: 'Contacts',
      desc: '',
      args: [],
    );
  }

  String get btnAllApps {
    return Intl.message(
      'All Apps',
      name: 'btnAllApps',
      desc: '',
      args: [],
    );
  }

  String get btnAllContacts {
    return Intl.message(
      'All Contacts',
      name: 'btnAllContacts',
      desc: '',
      args: [],
    );
  }

  String get btnAddFavApps {
    return Intl.message(
      'Add Favourite Apps',
      name: 'btnAddFavApps',
      desc: '',
      args: [],
    );
  }

  String get btnAddFavContacts {
    return Intl.message(
      'Add Favourite Contacts',
      name: 'btnAddFavContacts',
      desc: '',
      args: [],
    );
  }

  String get btnBackToHome {
    return Intl.message(
      'Back to Home',
      name: 'btnBackToHome',
      desc: '',
      args: [],
    );
  }

  String get btnGrantPermission {
    return Intl.message(
      'Grant Contacts Permission',
      name: 'btnGrantPermission',
      desc: '',
      args: [],
    );
  }

  String get msgNoData {
    return Intl.message(
      'Error: No Data',
      name: 'msgNoData',
      desc: '',
      args: [],
    );
  }

  String get msgNoFavourites {
    return Intl.message(
      'You haven\'t added any favourites',
      name: 'msgNoFavourites',
      desc: '',
      args: [],
    );
  }

  String get msgNoContactsPermission {
    return Intl.message(
      'No Contacts Permssion',
      name: 'msgNoContactsPermission',
      desc: '',
      args: [],
    );
  }

  String get dlgCall {
    return Intl.message(
      'Call',
      name: 'dlgCall',
      desc: '',
      args: [],
    );
  }

  String get dlgEditTitle {
    return Intl.message(
      'Edit Favourites',
      name: 'dlgEditTitle',
      desc: '',
      args: [],
    );
  }

  String get dlgCancel {
    return Intl.message(
      'Cancel',
      name: 'dlgCancel',
      desc: '',
      args: [],
    );
  }

  String get dlgAppsAddRemove {
    return Intl.message(
      'Add/Remove Apps',
      name: 'dlgAppsAddRemove',
      desc: '',
      args: [],
    );
  }

  String get dlgAppsReorder {
    return Intl.message(
      'Reorder Apps',
      name: 'dlgAppsReorder',
      desc: '',
      args: [],
    );
  }

  String get dlgContactsAddRemove {
    return Intl.message(
      'Add/Remove Contacts',
      name: 'dlgContactsAddRemove',
      desc: '',
      args: [],
    );
  }

  String get dlgContactsReorder {
    return Intl.message(
      'Reorder Contacts',
      name: 'dlgContactsReorder',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'), Locale.fromSubtags(languageCode: 'de'), Locale.fromSubtags(languageCode: 'es'), Locale.fromSubtags(languageCode: 'fr'), Locale.fromSubtags(languageCode: 'hi'), Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}