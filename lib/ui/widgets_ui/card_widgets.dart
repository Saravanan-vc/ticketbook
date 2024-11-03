import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticketbook/ui/color.dart';
import 'package:ticketbook/ui/mediaquery.dart';
import 'package:ticketbook/ui/text_styl_ui.dart';

class CardWidgets extends StatelessWidget {
  final String origin;
  final String distination;
  final String aircraftype;
  final String price;
  final String time;
  final String origintime;
  final String distinationtime;
  final int index;
  const CardWidgets(
      {super.key,
      required this.origin,
      required this.distination,
      required this.aircraftype,
      required this.price,
      required this.time,
      required this.origintime,
      required this.distinationtime, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: ColorClass.palTrans,
          border: Border.all(color: ColorClass.palWhite, width: 0.9),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  origin,
                  style: TextStylUi.normalBold(),
                ),
                Icon(
                  CupertinoIcons.airplane,
                  color: ColorClass.palBlue,
                ),
                Text(
                  distination,
                  style: TextStylUi.normalBold(),
                )
              ],
            ),
            SizedBox(height: allMediaQuery(context, 0.001)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Travilling Time:",
                  style: TextStylUi.normalBold(),
                ),
                Text(
                  time,
                  style: TextStylUi.normalBold(),
                )
              ],
            ),
            SizedBox(height: allMediaQuery(context, 0.001)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  origintime,
                  style: TextStylUi.normalBold(),
                ),
                Text(
                  distinationtime,
                  style: TextStylUi.normalBold(),
                )
              ],
            ),
            SizedBox(height: allMediaQuery(context, 0.001)),
            SizedBox(
                width: double.infinity,
                child: Divider(color: ColorClass.palWhite)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  aircraftype,
                  style: TextStylUi.normalBold(),
                ),
                Text(
                  "₹$price",
                  style: TextStylUi.normalBold(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
