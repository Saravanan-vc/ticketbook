import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Box box;

class AuthenProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String collectionpath = "userDetails";
  String? userName;
  late String usrName;

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
        }).then(
          (_) {
            if (userName == null || userName!.isEmpty) {
              Future.delayed(const Duration(seconds: 10));
            }
            call();
          },
        ).then((_) => clearLogin());
      } catch (e) {
        if (kDebugMode) debugPrint("$e");
      }
    } else {
      if (kDebugMode) debugPrint('Enter eamil and password');
    }
  }

  Future<void> getUser(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      QuerySnapshot querySnapshot =
          await _firebaseFirestore.collection(collectionpath).get();
      for (var doc in querySnapshot.docs) {
        if (email == doc['email']) {
          userName = capitalizeFirstletter(doc['name']);
          notifyListeners();
          box.put(01, userName);
          sharedPreferences.setBool("check", true);
          notifyListeners();
          break;
        }
      }
    } catch (e) {
      if (kDebugMode) debugPrint('Error retrieving user: $e');
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
      //nested data base setting

      // await _firebaseFirestore
      //     .collection(collectionpath)
      //     .doc("${userCredential.user?.uid}")
      //   ..set({"name": name, "email": email, "innerwork": "finaly did it"})
      //   ..collection("data")
      //       .doc(name)
      //       .set({"name": name, "email": email, "innerwork": "finaly did it"});
      clearSign();
      callit();
    } catch (e) {
      if (kDebugMode) debugPrint("$e");
    }
  }

  // geting usename
  void getusename(dynamic a) {
    usrName = box.get(a);
    notifyListeners();
  }

  //first leter upercase
  String capitalizeFirstletter(String input) {
    if (input.isEmpty) {
      return "";
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  Stream getdata() {
    return _firebaseFirestore.collection(collectionpath).doc("${_firebaseAuth.currentUser?.uid}").collection("purachedTicket").snapshots();
  }
}
