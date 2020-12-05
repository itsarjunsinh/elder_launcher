import 'package:contacts_service/contacts_service.dart';
import 'package:elder_launcher/constants/keys.dart';
import 'package:elder_launcher/models/interfaces/data_repository.dart';
import 'package:elder_launcher/models/item.dart' as item;
import 'package:elder_launcher/utils/shared_prefs.dart';

class ContactRepository implements DataRepository {
  @override
  Future<List<item.Item>> getAllItems() async {
    var allContacts = await ContactsService.getContacts(
        orderByGivenName: true, photoHighResolution: false);
    return _toDistinctItems(allContacts);
  }

  @override
  Future<List<item.Item>> getFavItems() async {
    List<String> favContactNumbers =
        await SharedPrefs().getList(keyFavContacts);
    List<item.Item> favContacts = [];
    favContactNumbers.forEach((i) => print(i));
    for (String number in favContactNumbers) {
      favContacts.add(
          _toItem(number, await ContactsService.getContactsForPhone(number)));
    }
    return favContacts;
  }

  @override
  void setFavItems(List<String> favNumbers) {
    SharedPrefs().setList(keyFavContacts, favNumbers);
  }

  List<item.Item> _toDistinctItems(Iterable<Contact> contacts) {
    Set<item.Item> _contacts = <item.Item>{};

    contacts.forEach((contact) {
      Set<String> numbers = <String>{};

      for (var number in contact.phones) {
        print(number.value);
        numbers.add(number.value.replaceAll(
          RegExp('[^a-zA-Z0-9+]+'),
          '',
        ));
      }

      for (String number in numbers) {
        print(number);
        _contacts.add(item.Item(number, contact.displayName, contact.avatar));
      }
    });
    return _contacts.toList();
  }

  item.Item _toItem(number, Iterable<Contact> contacts) {
    return item.Item(number, contacts.first.displayName, contacts.first.avatar);
  }
}
