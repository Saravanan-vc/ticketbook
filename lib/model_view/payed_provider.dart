import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PayedProvider extends ChangeNotifier {
  Razorpay razorpay = Razorpay();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String collectionpath = "userDetails";

  void razorpaySucessed(String name, String flightid, String terminal,
      String gate, String seat) async {
    debugPrint("start to work");
    var userCredential = _firebaseAuth.currentUser?.uid;
    await _firebaseFirestore
        .collection(collectionpath)
        .doc(userCredential)
        .collection('purachedTicket')
        .doc()
        .set({
      "Name": name,
      "FlightID": flightid,
      "Terminal": terminal,
      "Date":
          "0${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      "seat": seat
    });
    debugPrint("its working dude");
  }

  void razorpayErrored() {}
  void razorpayWalleted() {}
}
