import 'dart:async';
import 'dart:collection';
import 'package:elder_launcher/models/interfaces/data_repository.dart';
import 'package:elder_launcher/models/item.dart';
import 'package:elder_launcher/utils/native_methods.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactModel extends ChangeNotifier {
  final DataRepository dataRepository;

  bool _isContactListLoaded = false;
  bool _isFavListLoaded = false;
  bool _isContactsPermissionChecked = false;
  bool _isContactsPermissionGranted;
  bool _isPhonePermissionChecked = false;
  bool _isPhonePermissionGranted;
  bool _isTelephoneFeatureChecked = false;
  bool _hasTelephoneFeature;

  List<Item> _allContacts = [];
  List<Item> _favContacts = [];

  Timer _refreshTimer;

  ContactModel({this.dataRepository}) {
    _loadContactsWithPermissionCheck();
    _checkPhonePermission();
    _refreshTimer = Timer.periodic(Duration(minutes: 10),
        (Timer timer) => _loadContactsWithPermissionCheck());
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

  void _loadContactsWithPermissionCheck() async {
    if (await Permission.contacts.isGranted) {
      _isContactsPermissionGranted = true;
      _loadContacts();
    } else {
      _isContactsPermissionGranted = false;
    }
    _isContactsPermissionChecked = true;
    notifyListeners();
  }

  void _loadContacts() async {
    _loadAllItems();
    _loadFavItems();
  }

  void _loadAllItems() async {
    _allContacts = await dataRepository.getAllItems();
    _isContactListLoaded = true;
    notifyListeners();
  }

  void _loadFavItems() async {
    _favContacts = await dataRepository.getFavItems();
    _isFavListLoaded = true;
    notifyListeners();
  }

  void _checkPhonePermission() async {
    _checkTelephoneFeature();
    if (await Permission.phone.isGranted) {
      _isPhonePermissionGranted = true;
    } else {
      _isPhonePermissionGranted = false;
    }
    _isPhonePermissionChecked = true;
    notifyListeners();
  }

  void _checkTelephoneFeature() async {
    if (await NativeMethods().hasTelephoneFeature()) {
      _hasTelephoneFeature = true;
    } else {
      _hasTelephoneFeature = false;
    }
    _isTelephoneFeatureChecked = true;
  }

  void _requestPermission(Permission permission) async {
    if (await permission.status.isPermanentlyDenied) {
      await openAppSettings();
    } else {
      await permission.request();
    }
  }

  void launchContactsApp() async {
    NativeMethods().launchContactsApp();
  }

  void callPhoneNumber(String number) async {
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

  void requestContactsPermission() async {
    await _requestPermission(Permission.contacts);
    _loadContactsWithPermissionCheck();
  }

  void requestPhonePermission() async {
    await _requestPermission(Permission.phone);
    _checkPhonePermission();
  }

  void saveFavContacts(List<String> new_favContacts) async {
    dataRepository.setFavItems(new_favContacts);
    _loadFavItems();
  }
}
