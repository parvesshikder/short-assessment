import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:drembaufresh/constnats/constants.dart';

class DateTimeController{
  late DateTime datetime;
  String? date;
  String? time;
    Future<void> _loadCurrentDateTime() async {
    final response = await http.get(Uri.parse(Constants.url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final serverTime = DateTime.parse(json['datetime']);

      datetime = serverTime.toLocal();

        //get date
        final DateFormat formatterDate = DateFormat.yMMMMd('en_US');
        date = formatterDate.format(datetime);

        //get time
        final DateFormat formatterTime = DateFormat.jm();
        time = formatterTime.format(datetime);
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('Failed to load Current Date Time'), backgroundColor: Colors.red,));
    }
  }
}