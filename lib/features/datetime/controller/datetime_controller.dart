import 'package:flutter/material.dart';

class DateTimeProvider extends ChangeNotifier {
  String _date = '00-00-00';
  String _time = '00:00';

  String get date => _date;
  String get time => _time;

  void updateDateTime(String newDate, String newTime) {
    _date = newDate;
    _time = newTime;
    notifyListeners();
  }
}
