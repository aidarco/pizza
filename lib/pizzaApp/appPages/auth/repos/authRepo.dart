


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginRepo
{
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> login(
      {required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
}