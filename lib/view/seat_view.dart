import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketbook/model_view/api_provider.dart';
import 'package:ticketbook/ui/mediaquery.dart';
import 'package:ticketbook/ui/text_styl_ui.dart';
import 'package:ticketbook/view/payment_view.dart';

class SeatView extends StatefulWidget {
  final int count;
  const SeatView({super.key, required this.count});

  @override
  State<SeatView> createState() => _SeatViewState();
}

class _SeatViewState extends State<SeatView> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApiProvider>(context, listen: false)
      ..selectedSeat = []
      ..total = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, apiprovider, _) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: allMediaQuery(context, 0.07),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("BusinessClass", style: TextStylUi.normalBold()),
                        Text(
                          "₹${apiprovider.flightlist[widget.count].price! + 3000}",
                          style: TextStylUi.simple01(),
                        )
                      ]),
                  SizedBox(
                    height: 190,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5 * 3,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                childAspectRatio: 1.1,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4),
                        itemBuilder: (context, index) {
                          if (index % 5 == 2) {
                            return Container(
                              color: Colors.white,
                              height: 30,
                              width: 30,
                            );
                          }
                          return GestureDetector(
                            onTap: () {
                              apiprovider.selectedAdd("B${index + 1}");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(4)),
                              height: 15,
                              width: 15,
                              child: Center(child: Text("B${index + 1}")),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("EconomicClass", style: TextStylUi.normalBold()),
                        Text(
                          "₹${apiprovider.flightlist[widget.count].price!}",
                          style: TextStylUi.simple01(),
                        )
                      ]),
                  SizedBox(
                    height: 370,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5 * 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                childAspectRatio: 1.1,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4),
                        itemBuilder: (context, index) {
                          if (index % 5 == 2) {
                            return Container(
                              color: Colors.white,
                              height: 15,
                              width: 15,
                            );
                          }
                          return GestureDetector(
                            onTap: () {
                              apiprovider.selectedAdd("E${index + 1}");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(4)),
                              height: 15,
                              width: 15,
                              child: Center(child: Text("E${index + 1}")),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 100,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: FittedBox(
                    child: Text(
                      'Seat Numbers: ${apiprovider.selectedSeat.join(',')}',
                      style: TextStylUi.simple01(),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        backgroundColor: Colors.red.shade400,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    onPressed: () {
                      apiprovider.makezero();
                      if (apiprovider.seatSelect ==
                          apiprovider.selectedSeat.length) {
                        apiprovider.checkit(
                            apiprovider.flightlist[widget.count].price!.toInt(),
                            apiprovider.flightlist[widget.count].price!
                                    .toInt() +
                                3000);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PaymentView(
                                  inde: widget.count,
                                )));
                      }
                    },
                    child: Text(
                      "Pay Now",
                      style: TextStylUi.simple01W(),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
