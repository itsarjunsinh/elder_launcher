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
        "Apps": MessageLookupByLibrary.simpleMessage("Apps"),
        "Contacts": MessageLookupByLibrary.simpleMessage("Contatti"),
        "btnAddFavApps":
            MessageLookupByLibrary.simpleMessage("Aggiungi app preferite"),
        "btnAddFavContacts":
            MessageLookupByLibrary.simpleMessage("Aggiungi contatti preferiti"),
        "btnAllApps": MessageLookupByLibrary.simpleMessage("Tutte le App"),
        "btnAllContacts":
            MessageLookupByLibrary.simpleMessage("Tutti contatti"),
        "btnBackToHome": MessageLookupByLibrary.simpleMessage("Indietro"),
        "btnGrantPermission":
            MessageLookupByLibrary.simpleMessage("Dai il permesso"),
        "btnSetDefaultLauncher":
            MessageLookupByLibrary.simpleMessage("Imposta come predefinito"),
        "dlgAppsAddRemove":
            MessageLookupByLibrary.simpleMessage("Aggiungi/rimuovi app"),
        "dlgAppsReload":
            MessageLookupByLibrary.simpleMessage("Ricarica la lista delle app"),
        "dlgAppsReorder":
            MessageLookupByLibrary.simpleMessage("Riorganizza le app"),
        "dlgCall": MessageLookupByLibrary.simpleMessage("Chiamare"),
        "dlgCancel": MessageLookupByLibrary.simpleMessage("Annulla"),
        "dlgContactsAddRemove":
            MessageLookupByLibrary.simpleMessage("Aggiungi/rimuovi contatti"),
        "dlgContactsReload": MessageLookupByLibrary.simpleMessage(
            "Ricarica la lista dei contatti"),
        "dlgContactsReorder":
            MessageLookupByLibrary.simpleMessage("Riorganizza i contatti"),
        "dlgEditTitle":
            MessageLookupByLibrary.simpleMessage("Modificare preferiti"),
        "msgNoContactsPermission": MessageLookupByLibrary.simpleMessage(
            "Per aggiungere contatti preferiti a questa schermata, pergo dare i permessi per accedere ai contatti."),
        "msgNoData": MessageLookupByLibrary.simpleMessage(
            "Non ci sono dei dati. Prego riprovare tra pochi secondi."),
        "msgNoFavourites": MessageLookupByLibrary.simpleMessage(
            "Lei non ha aggiunto dei preferiti"),
        "msgNoPhonePermission": MessageLookupByLibrary.simpleMessage(
            "Abilita l\'app a fare chiamate."),
        "msgNotDefaultLauncher": MessageLookupByLibrary.simpleMessage(
            "Apri app e contatti più velocemente, impostando Elder Launcher come Home-App.")
      };
}
