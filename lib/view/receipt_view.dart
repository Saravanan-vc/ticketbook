// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_widget/ticket_widget.dart';

import 'package:ticketbook/model_view/api_provider.dart';
import 'package:ticketbook/model_view/login_provider.dart';
import 'package:ticketbook/ui/image.dart';

class ReceiptView extends StatefulWidget {
  final int id;
  const ReceiptView({super.key, required this.id});

  @override
  State<ReceiptView> createState() => _ReceiptViewState();
}

class _ReceiptViewState extends State<ReceiptView> {
  String? name;
  @override
  void initState() {
    super.initState();
    name = Provider.of<AuthenProvider>(context, listen: false).userName ??
        box.get(01);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageArea.wallImage), fit: BoxFit.fitHeight),
        ),
        child: Center(
          child: TicketWidget(
            color: Colors.transparent.withAlpha(40),
            width: 350,
            height: 450,
            isCornerRounded: true,
            padding: const EdgeInsets.all(20),
            child: TicketData(
              name: name!,
              id: widget.id,
            ),
          ),
        ),
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  final String name;
  final int id;
  const TicketData({
    super.key,
    required this.name,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, apiprovider, _) {
        var finalTicket = apiprovider.flightlist[id];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(width: 1.0, color: Colors.green),
                  ),
                  child: const Center(
                    child: Text(
                      'Confromation',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      'LHR',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.flight_takeoff,
                        color: Colors.pink,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'ISL',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0, left: 10),
              child: Text(
                'Flight Ticket',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Passanger',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(name),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'FlightID',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("${finalTicket.flightId}"),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Terminal',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("${finalTicket.departure!.terminal}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Gate',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("${finalTicket.departure!.gate}"),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Date',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "0${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Seat',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("${apiprovider.seatSelect}"),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              child: BarcodeWidget(
                barcode: Barcode.code128(),
                data: '${finalTicket.flightId}${finalTicket.flightNumber}',
              ),
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
