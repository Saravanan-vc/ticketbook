import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String collectionpath = "userDetails";

  // login screen
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  void clearLogin() {
    mailcontroller.clear();
    passcontroller.clear();
  }

  void login(String email, String password, VoidCallback call) {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        _firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((_) {
              getUser(email);
            })
            .then((_) => call())
            .then((_) => clearLogin());
      } catch (e) {
        debugPrint("$e");
      }
    } else {
      debugPrint('Enter eamil and password');
    }
  }

  Future<void> getUser(String email) async {
    try {
      QuerySnapshot querySnapshot =
          await _firebaseFirestore.collection(collectionpath).get();
      for (var doc in querySnapshot.docs) {
        if (email == doc['email']) {
          debugPrint(doc['name']);
        }
      }
    } catch (e) {
      debugPrint('Error retrieving user: $e');
    }
  }

  //sign screen
  TextEditingController signnameC = TextEditingController();
  TextEditingController signemailC = TextEditingController();
  TextEditingController signpassc = TextEditingController();
  void clearSign() {
    signemailC.clear();
    signnameC.clear();
    signpassc.clear();
  }

  void sign(
      String email, String password, VoidCallback callit, String name) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _firebaseFirestore
          .collection(collectionpath)
          .doc("${userCredential.user?.uid}")
          .set({
        "name": name,
        "email": email,
      });
      clearSign();
      callit();
    } catch (e) {
      debugPrint("$e");
    }
  }
}
