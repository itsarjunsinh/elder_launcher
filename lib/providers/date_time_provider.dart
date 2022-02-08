import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeProvider extends ChangeNotifier {
  late final Timer _timer;
  String _date = '';
  String _time = '';

  DateTimeProvider() {
    _timer = Timer.periodic(
        const Duration(seconds: 1), (timer) => _updateDateTime());
  }

  String get date => _date;
  String get time => _time;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateDateTime() {
    _time = DateFormat.jm().format(DateTime.now());
    _date = DateFormat.MMMMEEEEd().format(DateTime.now());
    notifyListeners();
  }
}
