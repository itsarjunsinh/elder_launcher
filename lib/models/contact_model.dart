import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import '../data_sources/contact_repository.dart';
import '../models/item.dart';
import '../utils/native_methods.dart';

class ContactModel extends ChangeNotifier {
  bool _isContactListLoaded = false;
  bool _isFavListLoaded = false;
  bool _isContactsPermissionChecked = false;
  bool _isPhonePermissionChecked = false;
  bool _isTelephoneFeatureChecked = false;

  late bool _hasTelephoneFeature;
  late bool _isContactsPermissionGranted;
  late bool _isPhonePermissionGranted;
  late Timer _refreshTimer;

  List<Item> _allContacts = [];
  List<Item> _favContacts = [];

  ContactModel() {
    _loadContactsWithPermissionCheck();
    _checkPhonePermission();
    _refreshTimer = Timer.periodic(const Duration(minutes: 10),
        (timer) => _loadContactsWithPermissionCheck());
  }

  bool get isContactListLoaded => _isContactListLoaded;
  bool get isFavListLoaded => _isFavListLoaded;
  bool get isContactsPermissionChecked => _isContactsPermissionChecked;
  bool get isContactsPermissionGranted => _isContactsPermissionGranted;
  bool get isPhonePermissionChecked => _isPhonePermissionChecked;
  bool get isPhonePermissionGranted => _isPhonePermissionGranted;
  bool get isTelephoneFeatureChecked => _isTelephoneFeatureChecked;
  bool get hasTelephoneFeature => _hasTelephoneFeature;
  UnmodifiableListView<Item> get allContacts =>
      UnmodifiableListView(_allContacts);
  UnmodifiableListView<Item> get favContacts =>
      UnmodifiableListView(_favContacts);

  @override
  void dispose() {
    _refreshTimer.cancel();
    super.dispose();
  }

  Future<void> _loadContactsWithPermissionCheck() async {
    if (await Permission.contacts.isGranted) {
      _isContactsPermissionGranted = true;
      _loadContacts();
    } else {
      _isContactsPermissionGranted = false;
    }
    _isContactsPermissionChecked = true;
    notifyListeners();
  }

  Future<void> _loadContacts() async {
    _loadAllItems();
    _loadFavItems();
  }

  Future<void> _loadAllItems() async {
    _allContacts = await ContactRepository().getAllItems();
    _isContactListLoaded = true;
    notifyListeners();
  }

  Future<void> _loadFavItems() async {
    _favContacts = await ContactRepository().getFavItems();
    _isFavListLoaded = true;
    notifyListeners();
  }

  Future<void> _checkPhonePermission() async {
    _checkTelephoneFeature();
    if (await Permission.phone.isGranted) {
      _isPhonePermissionGranted = true;
    } else {
      _isPhonePermissionGranted = false;
    }
    _isPhonePermissionChecked = true;
    notifyListeners();
  }

  Future<void> _checkTelephoneFeature() async {
    if (await NativeMethods().hasTelephoneFeature()) {
      _hasTelephoneFeature = true;
    } else {
      _hasTelephoneFeature = false;
    }
    _isTelephoneFeatureChecked = true;
  }

  Future<void> _requestPermission(Permission permission) async {
    var permissionStatus = await permission.request();
    if (permissionStatus == PermissionStatus.permanentlyDenied) {
      await openAppSettings();
    }
  }

  Future<void> launchContactsApp() async {
    NativeMethods().launchContactsApp();
  }

  Future<void> callPhoneNumber(String number) async {
    if (_isTelephoneFeatureChecked) {
      if (_isPhonePermissionGranted && _hasTelephoneFeature) {
        NativeMethods().startPhoneCall(number);
      } else {
        NativeMethods().launchDialerApp(number);
      }
    }
  }

  void reloadLists() {
    _loadContactsWithPermissionCheck();
  }

  Future<void> requestContactsPermission() async {
    await _requestPermission(Permission.contacts);
    _loadContactsWithPermissionCheck();
  }

  Future<void> requestPhonePermission() async {
    await _requestPermission(Permission.phone);
    _checkPhonePermission();
  }

  Future<void> saveFavContacts(List<String> newFavContacts) async {
    ContactRepository().setFavItems(newFavContacts);
    _loadFavItems();
  }
}
