import 'dart:async';

import 'package:drembaufresh/features/datetime/model/datetime.dart';
import 'package:drembaufresh/features/login/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../constnats/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime datetime;
  String? date;
  String? time;

  @override
  void initState() {
    super.initState();

    _loadCurrentDateTime();
    Timer.periodic(
        const Duration(seconds: 10), (timer) => _loadCurrentDateTime());
  }


  Future<void> _loadCurrentDateTime() async {
    final response = await http.get(Uri.parse(Constants.url));
    if (response.statusCode == 200) {
      try {
        final json = jsonDecode(response.body);
        final serverTime = DateTime.parse(json['datetime']);

        setState(() {
          datetime = serverTime.toLocal();

          //get date
          final DateFormat formatterDate = DateFormat.yMMMMd('en_US');
          date = formatterDate.format(datetime);

          //get time
          final DateFormat formatterTime = DateFormat.jm();
          time = formatterTime.format(datetime);
          print(time);
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to load Current Date Time'),
          backgroundColor: Colors.red,
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Failed to load Current Date Time'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        actions: [
          TextButton(
              onPressed: () {
                AuthController().signOut();
              },
              child: const Text('Sign Out'))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Time : ${time ?? '00:00'}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Date : ${date ?? ' 00 / 00 / 0000'}',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
