import 'package:drembaufresh/features/datetime/controller/datetime_controller.dart';
import 'package:drembaufresh/features/datetime/screen/home_screen.dart';
import 'package:drembaufresh/features/login/screen/login_screen.dart';
import 'package:drembaufresh/theme/pallete.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context, listen: true);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DateTimeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Pallete.whiteShade,
            appBarTheme: const AppBarTheme(
              backgroundColor: Pallete.blue,
            ),
            brightness: Brightness.light,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Pallete.black,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            )),
        home: user == null ? const LoginScreen() : const HomeScreen(),
      ),
    );
  }
}
