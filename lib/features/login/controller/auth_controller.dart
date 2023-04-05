import 'package:drembaufresh/features/login/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthController with ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  Future<UserCredential> signInWithGoogle() async {
    UserCredential userCredential = await _authRepository.signInWithGoogle();
    return userCredential;
  }

  void signOut() {
    _authRepository.signOut();
  }
}
