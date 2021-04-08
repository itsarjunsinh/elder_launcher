import 'package:contacts_service/contacts_service.dart';
import '../constants/keys.dart';
import '../models/interfaces/data_repository.dart';
import '../models/item.dart' as item;
import '../utils/shared_prefs.dart';

class ContactRepository implements DataRepository {
  @override
  Future<List<item.Item>> getAllItems() async {
    var allContacts = await ContactsService.getContacts(
        orderByGivenName: true, photoHighResolution: false);
    return _toDistinctItems(allContacts);
  }

  @override
  Future<List<item.Item>> getFavItems() async {
    var favContactNumbers = await SharedPrefs().getList(keyFavContacts);
    var favContacts = <item.Item>[];
    for (var number in favContactNumbers) {
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
    var _contacts = <item.Item>{};

    for (var contact in contacts) {
      var numbers = <String>{};

      for (var number in contact.phones) {
        numbers.add(number.value.replaceAll(
          RegExp('[^a-zA-Z0-9+]+'),
          '',
        ));
      }

      for (var number in numbers) {
        _contacts.add(item.Item(number, contact.displayName, contact.avatar));
      }
    }
    return _contacts.toList();
  }

  item.Item _toItem(String number, Iterable<Contact> contacts) {
    return item.Item(number, contacts.first.displayName, contacts.first.avatar);
  }
}
