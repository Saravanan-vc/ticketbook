import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenProvider extends ChangeNotifier {
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void login(String email, String password) {
    try {
      _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      debugPrint("$e");
    }
  }
}
