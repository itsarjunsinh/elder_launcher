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
  bool _isPermissionChecked = false;
  bool _isPermissionGranted = false;

  List<Item> _allContacts = [];
  List<Item> _favContacts = [];

  Timer _refreshTimer;

  ContactModel({this.dataRepository}) {
    _loadContactsWithPermissionCheck();
    _refreshTimer = Timer.periodic(Duration(minutes: 10),
        (Timer timer) => _loadContactsWithPermissionCheck());
  }

  bool get isContactListLoaded => _isContactListLoaded;
  bool get isFavListLoaded => _isFavListLoaded;
  bool get isPermissionChecked => _isPermissionChecked;
  bool get isPermissionGranted => _isPermissionGranted;
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
    PermissionStatus permissionStatus = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);
    switch (permissionStatus) {
      case PermissionStatus.granted:
        _loadContacts();
        _isPermissionChecked = true;
        _isPermissionGranted = true;
        notifyListeners();
        return;
      default:
        _isPermissionChecked = true;
        _isPermissionGranted = false;
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

  void launchContactsApp() async {
    NativeMethods().launchContactsApp();
  }

  void launchDialerApp(String number) async {
    NativeMethods().launchDialerApp(number);
  }

  void requestPermission() async {
    PermissionStatus permissionStatus = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);
    switch (permissionStatus) {
      case PermissionStatus.neverAskAgain:
        await PermissionHandler().openAppSettings();
        return;
      default:
        await PermissionHandler()
            .requestPermissions([PermissionGroup.contacts]);
        _loadContactsWithPermissionCheck();
    }
  }

  void saveFavContacts(List<String> new_favContacts) async {
    dataRepository.setFavItems(new_favContacts);
    _loadFavItems();
  }
}
