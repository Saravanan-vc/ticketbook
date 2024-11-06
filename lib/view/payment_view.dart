import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:ticketbook/model_view/api_provider.dart';
import 'package:ticketbook/model_view/login_provider.dart';
import 'package:ticketbook/model_view/payed_provider.dart';
import 'package:ticketbook/ui/color.dart';
import 'package:ticketbook/ui/image.dart';
import 'package:ticketbook/ui/mediaquery.dart';
import 'package:ticketbook/ui/text_styl_ui.dart';
import 'package:ticketbook/view/receipt_view.dart';

class PaymentView extends StatefulWidget {
  final int inde;
  const PaymentView({super.key, required this.inde});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  String? name;
  late Razorpay razorpay;

  @override
  void initState() {
    name = Provider.of<AuthenProvider>(context, listen: false).userName ??
        box.get(01);
    razorpay = Razorpay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, apiprovider, _) {
        var allId = apiprovider.flightlist[widget.inde];
        return Scaffold(
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageArea.wallImage),
                      fit: BoxFit.fitHeight)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Ticeket Booking",
                        style: TextStylUi.normalBold01(),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(height: allMediaQuery(context, 0.01)),
                    Text("Name : ${name ?? box.get(01)}",
                        style: TextStylUi.simple002()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "From",
                              style: TextStylUi.normalBold(),
                            ),
                            Text(
                              "${allId.departure!.city}",
                              style: TextStylUi.simple002(),
                            ),
                            Text(
                              "${allId.departure!.gate}",
                              style: TextStylUi.simple002(),
                            ),
                            Text(
                              "${allId.departure!.terminal}",
                              style: TextStylUi.simple002(),
                            ),
                            Text(
                              allId.departure!.time!.substring(0, 5),
                              style: TextStylUi.simple002(),
                            ),
                          ],
                        ),
                        Icon(
                          CupertinoIcons.airplane,
                          color: ColorClass.palBlue,
                        ),
                        Column(
                          children: [
                            Text(
                              "To",
                              style: TextStylUi.normalBold(),
                            ),
                            Text(
                              "${allId.arrival!.city}",
                              style: TextStylUi.simple002(),
                            ),
                            Text(
                              "${allId.arrival!.gate}",
                              style: TextStylUi.simple002(),
                            ),
                            Text(
                              "${allId.arrival!.terminal}",
                              style: TextStylUi.simple002(),
                            ),
                            Text(
                              allId.arrival!.time!.substring(0, 5),
                              style: TextStylUi.simple002(),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Amenities :",
                          style: TextStylUi.normalBold(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: allId.amenities!.length,
                        itemBuilder: (context, ind) {
                          return Text(
                            "* ${allId.amenities![ind]}",
                            style: TextStylUi.simple01(),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Selected Seat :",
                          style: TextStylUi.normalBold(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: apiprovider.selectedSeat.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, ind) {
                            return Text(
                              "${apiprovider.selectedSeat[ind]}, ",
                              style: TextStylUi.simple01(),
                            );
                          },
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price :",
                            style: TextStylUi.normalBold(),
                          ),
                          Text(
                            "₹${apiprovider.total}",
                            style: TextStylUi.normalBold(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: allMediaQuery(context, 0.04)),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black45),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            var options = {
                              'key': 'rzp_live_ILgsfZCZoFIKMb',
                              'amount': 100,
                              'name': 'Acme Corp.',
                              'description': 'Fine T-Shirt',
                              'retry': {'enabled': true, 'max_count': 1},
                              'send_sms_hash': true,
                              'prefill': {
                                'contact': '8888888888',
                                'email': 'test@razorpay.com'
                              },
                              'external': {
                                'wallets': ['paytm']
                              }
                            };
                            razorpay.open(options);
                          },
                          child: Center(
                              child: Text(
                            "Pay Now",
                            style: TextStylUi.simple01W(),
                          )),
                        )),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    String names =
        Provider.of<AuthenProvider>(context, listen: false).userName ??
            box.get(01);
    var allthing = Provider.of<ApiProvider>(context, listen: false);

    var database = Provider.of<PayedProvider>(context, listen: false);
    database.razorpaySucessed(
        names,
        allthing.flightlist[allthing.index].flightId!,
        allthing.flightlist[allthing.index].departure!.terminal!,
        allthing.flightlist[allthing.index].departure!.gate!,
        "${allthing.seatSelect}");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ReceiptView(
          id: 0,
        ),
      ),
    );
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // Set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        ElevatedButton(
          child: const Text("Continue"),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
