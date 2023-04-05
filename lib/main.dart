import 'package:drembaufresh/firebase_options.dart';
import 'package:drembaufresh/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const DRembauFresh());
}

class DRembauFresh extends StatefulWidget {
  const DRembauFresh({super.key});

  @override
  State<DRembauFresh> createState() => _DRembauFreshState();
}

class _DRembauFreshState extends State<DRembauFresh> {
  final Future<FirebaseApp> _initiData = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initiData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Snapshort has Error'));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<User?>.value(
            initialData: FirebaseAuth.instance.currentUser,
            value: FirebaseAuth.instance.authStateChanges(),
            child: const Wrapper(),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}