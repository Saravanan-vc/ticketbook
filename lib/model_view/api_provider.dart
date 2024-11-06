import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:ticketbook/model/flight_all_model/flight_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ApiProvider extends ChangeNotifier {
  List<FlightClass> flightlist = [];
  List<FlightClass>? flightfist = [];
  String apiUrl = "https://saravanan-vc.github.io/flight-api/flightofall";
  String apiUrl1 = "https://saravanan-vc.github.io/flight-api/50unqieFlight";
  int seatSelect = 1;
  List<String> selectedSeat = [];
  int total = 0;
  int index = 0;

  void gettinData() async {
    var convert = Uri.parse(apiUrl1);
    var rawApi = await http.get(convert);
    var decodeApi = json.decode(rawApi.body) as List;
    if (rawApi.statusCode == 200) {
      List<FlightClass> convertList =
          decodeApi.map((data) => FlightClass.fromjson(data)).toList();
      flightfist?.clear();
      flightfist?.addAll(convertList);
      flightlist.addAll(flightfist!);
      notifyListeners();
      if (kDebugMode) {
        debugPrint("---------------------------------------------------------");
        debugPrint("${flightlist[0].arrival}");
        debugPrint("---------------------------------------------------------");
      }
    }
  }
  /*
  try to get controller in search method 
   */

  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();

  void controllingSeach() {
    debugPrint('itstart');

    from.addListener(fromCrontroller);
    to.addListener(fromCrontroller);
  }

  void fromCrontroller() {
    debugPrint('itstartfromcontroller');

    flightlist = flightfist!.where((data) {
      final matchesFrom = data.departure?.city
              ?.toLowerCase()
              .contains(from.text.toLowerCase().trim()) ??
          false;
      final matchesTo = data.arrival?.city
              ?.toLowerCase()
              .contains(to.text.toLowerCase().trim()) ??
          false;

      return matchesFrom && matchesTo;
    }).toList();

    notifyListeners();
    debugPrint("${flightlist.length}");
  }

  final Uri url =
      Uri.parse('https://razorpay.com/payment-link/plink_PGgWSgMAKCcSJN');

  Future<void> canlan() async {
    canLaunchUrl(url).then((value) async {
      await launchUrl(url);
    });
  }

  List<Color> seatColor = List.filled(10, Colors.grey.shade300 );

  //changinig seat

  void changeSeat(int seat) {
    seatSelect = seat;
    notifyListeners();
  }

  void selectedAdd(String a) {
    if (selectedSeat.contains(a)) {
      selectedSeat.remove(a);
      notifyListeners();
    } else if (selectedSeat.length < seatSelect) {
      if (selectedSeat.isEmpty) {
        selectedSeat.add(a);
        notifyListeners();
      } else {
        if (selectedSeat.contains(a)) {
          selectedSeat.remove(a);
        } else {
          selectedSeat.add(a);
        }
        notifyListeners();
      }

      debugPrint("$selectedSeat");
    }
  }

  void checkit(int e, int b) {
    for (int c = 0; c < selectedSeat.length; c++) {
      if (selectedSeat[c][0] == "B") {
        debugPrint(selectedSeat[c][0]);
        total = total + b;
        notifyListeners();
      } else {
        total = total + e;
        notifyListeners();
      }
    }
    notifyListeners();
    debugPrint("$total");
  }

  //make zero
  void makezero() {
    total = 0;
    notifyListeners();
  }

  void forindeX(int currentIndex) {
    index = currentIndex;
    notifyListeners();
  }
}
