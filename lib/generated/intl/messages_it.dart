// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'it';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Apps": MessageLookupByLibrary.simpleMessage("App"),
        "Contacts": MessageLookupByLibrary.simpleMessage("Contatti"),
        "btnAddFavApps":
            MessageLookupByLibrary.simpleMessage("Aggiungi app preferite"),
        "btnAddFavContacts":
            MessageLookupByLibrary.simpleMessage("Aggiungi contatti preferiti"),
        "btnAllApps": MessageLookupByLibrary.simpleMessage("Tutte le app"),
        "btnAllContacts":
            MessageLookupByLibrary.simpleMessage("Tutti i contatti"),
        "btnBackToHome":
            MessageLookupByLibrary.simpleMessage("Indietro alla home"),
        "btnGrantPermission":
            MessageLookupByLibrary.simpleMessage("Dai il permesso"),
        "btnSetDefaultLauncher":
            MessageLookupByLibrary.simpleMessage("Imposta come predefinito"),
        "dlgAppsAddRemove":
            MessageLookupByLibrary.simpleMessage("Aggiungi o rimuovi app"),
        "dlgAppsReload":
            MessageLookupByLibrary.simpleMessage("Ricarica la lista di app"),
        "dlgAppsReorder":
            MessageLookupByLibrary.simpleMessage("Riordina le app"),
        "dlgCall": MessageLookupByLibrary.simpleMessage("Chiama"),
        "dlgCancel": MessageLookupByLibrary.simpleMessage("Annulla"),
        "dlgContactsAddRemove":
            MessageLookupByLibrary.simpleMessage("Aggiungi o rimuovi contatti"),
        "dlgContactsReload":
            MessageLookupByLibrary.simpleMessage("Ricarica i contatti"),
        "dlgContactsReorder":
            MessageLookupByLibrary.simpleMessage("Riordina i contatti"),
        "dlgEditTitle":
            MessageLookupByLibrary.simpleMessage("Modifica i preferiti"),
        "msgNoContactsPermission": MessageLookupByLibrary.simpleMessage(
            "Per aggiungere contatti preferiti a questa schermata, permetti a quest\'app di accedere ai contatti."),
        "msgNoData": MessageLookupByLibrary.simpleMessage(
            "Dati non disponibili. Riprova fra qualche secondo."),
        "msgNoFavourites": MessageLookupByLibrary.simpleMessage(
            "Non hai aggiunto alcun preferito"),
        "msgNoPhonePermission": MessageLookupByLibrary.simpleMessage(
            "Per semplificare la procedura per chiamare, permetti a quest\'app di far partire chiamate per te."),
        "msgNotDefaultLauncher": MessageLookupByLibrary.simpleMessage(
            "Apri app e contatti più velocemente rendendo Elder Launcher l\'app home.")
      };
}
