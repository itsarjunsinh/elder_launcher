// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Apps": MessageLookupByLibrary.simpleMessage("Apps"),
        "Contacts": MessageLookupByLibrary.simpleMessage("Contacts"),
        "btnAddFavApps":
            MessageLookupByLibrary.simpleMessage("Add Favourite Apps"),
        "btnAddFavContacts":
            MessageLookupByLibrary.simpleMessage("Add Favourite Contacts"),
        "btnAllApps": MessageLookupByLibrary.simpleMessage("All Apps"),
        "btnAllContacts": MessageLookupByLibrary.simpleMessage("All Contacts"),
        "btnBackToHome": MessageLookupByLibrary.simpleMessage("Back to Home"),
        "btnGrantPermission":
            MessageLookupByLibrary.simpleMessage("Grant Permission"),
        "btnSetDefaultLauncher":
            MessageLookupByLibrary.simpleMessage("Set as Default"),
        "dlgAppsAddRemove":
            MessageLookupByLibrary.simpleMessage("Add/Remove Apps"),
        "dlgAppsReload":
            MessageLookupByLibrary.simpleMessage("Reload App List"),
        "dlgAppsReorder": MessageLookupByLibrary.simpleMessage("Reorder Apps"),
        "dlgCall": MessageLookupByLibrary.simpleMessage("Call"),
        "dlgCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "dlgContactsAddRemove":
            MessageLookupByLibrary.simpleMessage("Add/Remove Contacts"),
        "dlgContactsReload":
            MessageLookupByLibrary.simpleMessage("Reload Contacts"),
        "dlgContactsReorder":
            MessageLookupByLibrary.simpleMessage("Reorder Contacts"),
        "dlgEditTitle": MessageLookupByLibrary.simpleMessage("Edit Favourites"),
        "dlgOpenSettings":
            MessageLookupByLibrary.simpleMessage("Open Settings"),
        "msgNoContactsPermission": MessageLookupByLibrary.simpleMessage(
            "To add favourite contacts to this screen, allow this app access to your contacts."),
        "msgNoData": MessageLookupByLibrary.simpleMessage(
            "No data available. Try again in a few seconds."),
        "msgNoFavourites": MessageLookupByLibrary.simpleMessage(
            "You haven\'t added any favourites"),
        "msgNoPhonePermission": MessageLookupByLibrary.simpleMessage(
            "To make calling easier, allow this app to start phone calls for you."),
        "msgNotDefaultLauncher": MessageLookupByLibrary.simpleMessage(
            "Open apps and contacts faster by making Elder Launcher the home app.")
      };
}
