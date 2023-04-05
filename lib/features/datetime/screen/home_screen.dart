import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:drembaufresh/constnats/api_constants.dart';
import 'package:drembaufresh/features/datetime/controller/datetime_controller.dart';
import 'package:drembaufresh/features/login/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentDateTimeFromPHPAPI();
    Timer.periodic(const Duration(seconds: 10), (timer) {
      getCurrentDateTimeFromPHPAPI();
    });
  }

  void getCurrentDateTimeFromPHPAPI() async {
    final response = await http.get(Uri.parse(ApiConstants.baseUrl));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final date = responseData['date'];
      final time = responseData['time'];
      final dateTimeProvider =
          Provider.of<DateTimeProvider>(context, listen: false);
      dateTimeProvider.updateDateTime(date, time);
    } else {
      throw Error();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('D Rembau Fresh'),
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
            Consumer<DateTimeProvider>(
              builder: (context, dateTimeProvider, child) {
                return Text(
                  'Time : ${dateTimeProvider.time}',
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<DateTimeProvider>(
              builder: (context, dateTimeProvider, child) {
                return Text(
                  'Date : ${dateTimeProvider.date}',
                  style: const TextStyle(fontSize: 25),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
