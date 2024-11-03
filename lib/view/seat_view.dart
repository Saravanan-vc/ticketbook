import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketbook/model_view/api_provider.dart';
import 'package:ticketbook/ui/text_styl_ui.dart';

class SeatView extends StatelessWidget {
  const SeatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, apiprovider, _) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Text("BusinessClass", style: TextStylUi.normalBold()),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                      itemCount: 5 * 3,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              childAspectRatio: 1,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1),
                      itemBuilder: (context, index) {
                        if (index % 5 == 2) {
                          return Container(
                            color: Colors.white,
                            height: 15,
                            width: 15,
                          );
                        }
                        return Container(
                          color: Colors.green,
                          height: 15,
                          width: 15,
                        );
                      },
                    ),
                  ),
                ),
                Text("EconomicClass", style: TextStylUi.normalBold()),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                      itemCount: 5 * 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              childAspectRatio: 1,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1),
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
                            color: Colors.green,
                            height: 15,
                            width: 15,
                            child: Center(child: Text("E${index + 1}")),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Pay Now",
                      style: TextStylUi.simple01(),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
