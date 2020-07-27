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
    PermissionStatus contactStatus = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);

    switch (contactStatus) {
      case PermissionStatus.granted:
        _loadContacts();
        _isContactsPermissionGranted = true;
        _isContactsPermissionChecked = true;
        notifyListeners();
        return;
      default:
        _isContactsPermissionGranted = false;
        _isContactsPermissionChecked = true;
        notifyListeners();
    }
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
    PermissionStatus phoneStatus =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.phone);
    switch (phoneStatus) {
      case PermissionStatus.granted:
        _isPhonePermissionGranted = true;
        _isPhonePermissionChecked = true;
        notifyListeners();
        return;
      default:
        _isPhonePermissionGranted = false;
        _isPhonePermissionChecked = true;
        notifyListeners();
    }
  }

  void _requestPermission(PermissionGroup permissionGroup) async {
    PermissionStatus permissionStatus =
        await PermissionHandler().checkPermissionStatus(permissionGroup);
    switch (permissionStatus) {
      case PermissionStatus.neverAskAgain:
        await PermissionHandler().openAppSettings();
        return;
      default:
        await PermissionHandler().requestPermissions([permissionGroup]);
    }
  }

  void launchContactsApp() async {
    NativeMethods().launchContactsApp();
  }

  void callPhoneNumber(String number) async {
    if (isPhonePermissionGranted) {
      NativeMethods().startPhoneCall(number);
    } else {
      NativeMethods().launchDialerApp(number);
    }
  }

  void requestContactsPermission() async {
    await _requestPermission(PermissionGroup.contacts);
    _loadContactsWithPermissionCheck();
  }

  void requestPhonePermission() async {
    await _requestPermission(PermissionGroup.phone);
    _checkPhonePermission();
  }

  void saveFavContacts(List<String> new_favContacts) async {
    dataRepository.setFavItems(new_favContacts);
    _loadFavItems();
  }
}
