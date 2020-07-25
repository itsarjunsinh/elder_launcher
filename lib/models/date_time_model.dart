import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeModel extends ChangeNotifier {
  Timer _timer;
  String _date = '';
  String _time = '';
  String _timeFormat = '';

  DateTimeModel(bool is24HoursFormat) {
    _timeFormat = is24HoursFormat ? 'HH:MM' : 'h:mm a';
    _timer = Timer.periodic(
        Duration(seconds: 1), (Timer timer) => _updateDateTime());
  }

  String get date => _date;
  String get time => _time;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateDateTime() {
    _time = DateFormat(_timeFormat).format(DateTime.now());
    _date = DateFormat('EEEE, MMM d').format(DateTime.now());
    notifyListeners();
  }
}
