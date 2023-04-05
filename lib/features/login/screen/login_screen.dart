import 'package:drembaufresh/constnats/constants.dart';
import 'package:drembaufresh/features/login/controller/auth_controller.dart';
import 'package:drembaufresh/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteShade,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(AssetsConstnats.animatedBanner),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  'Digitising Agriculture and Farmer\'s',
                  style: TextStyle(
                      fontSize: 18,
                      color: Pallete.green,
                      fontWeight: FontWeight.w900),
                  // style: TextStyle(fontSize: 16, color: Pallete.white),
                )),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  // Image.asset(ImagePathConstants.hero2),

                  const SizedBox(
                    height: 30,
                  ),
                  isClicked
                      ? SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: Lottie.network(
                              'https://assets8.lottiefiles.com/private_files/lf30_3nvqj06a.json'))
                      : Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: Pallete.blue,
                            ),
                            onPressed: () async {
                              setState(() {
                                isClicked = true;
                              });

                              Future.delayed(const Duration(milliseconds: 500));
                              UserCredential userCredential =
                                  await AuthController().signInWithGoogle();

                              setState(() {
                                isClicked = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                        AssetsConstnats.googlelogo)),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              )),
        ],
      ),
    );
  }
}
