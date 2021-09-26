import 'package:elder_launcher/models/item.dart';

const fakeAllContacts = [
  Item('1234', 'Alligator', null),
  Item('2345', 'Bat', null),
  Item('3456', 'Cat', null),
  Item('4567', 'Dog', null),
  Item('5678', 'Elephant', null),
  Item('6789', 'Fox', null),
  Item('7890', 'Gorilla', null),
  Item('8901', 'Horse', null),
  Item('9012', 'Iguana', null),
  Item('9876', 'Jellyfish', null),
  Item('8765', 'Kangaroo', null),
  Item('7654', 'Lion', null),
  Item('6543', 'Mongoose', null)
];

const fakeFavContactNumbers = ['3456', '4567', '8765', '7654'];

List<Item> get fakeFavApps {
  var favApps = <Item>[];
  for (var number in fakeFavContactNumbers) {
    final fakeApp = fakeAllContacts.firstWhere((item) => item.id == number);
    favApps.add(fakeApp);
  }
  return favApps;
}

/// Mock list of installed apps for the ContactsService package.
Iterable get fakeDeviceContacts {
  var contactList = <Map<String, Object>>[];
  for (var fakeContact in fakeAllContacts) {
    final contact = Map.from(_baseContact).cast<String, Object>();
    contact['displayName'] = fakeContact.name;
    contact['phones'] = [
      {'label': '', 'value': fakeContact.id, 'type': 0}
    ];
    contactList.add(contact);
  }
  return contactList;
}

/// Mock application hashmap used in DeviceApps package.
const _baseContact = {
  'identifier': 'a',
  'displayName': 'a',
  'givenName': 'a',
  'middleName': 'a',
  'familyName': 'a',
  'prefix': 'a',
  'suffix': 'a',
  'company': 'a',
  'jobTitle': 'a',
  'androidAccountType': 'a',
  'androidAccountName': 'a',
  'emails': {},
  'phones': {},
  'postalAddresses': {},
  'avatar': '',
  'birthday': [],
};
