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
  int seatSelect = 1;
  List<String> selectedSeat = [];

  void gettinData() async {
    var convert = Uri.parse(apiUrl);
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
  //changinig seat

  void changeSeat(int seat) {
    seatSelect = seat;
    notifyListeners();
  }

  void selectedAdd(String a) {
    if (selectedSeat.length < seatSelect) {
      if (selectedSeat.isNotEmpty) {
        for (int q = 0; q < selectedSeat.length; q++) {
          if (selectedSeat[q] == a) {
            selectedSeat.removeAt(q);
            debugPrint("$selectedSeat");
            notifyListeners();
            break;
          }
        }
      }
      selectedSeat.add(a);
      notifyListeners();
      debugPrint("$selectedSeat");
    }
  }
}
