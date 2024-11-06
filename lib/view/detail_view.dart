import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ticketbook/model_view/api_provider.dart';
import 'package:ticketbook/ui/color.dart';
import 'package:ticketbook/ui/mediaquery.dart';
import 'package:ticketbook/ui/text_styl_ui.dart';
import 'package:ticketbook/view/allticket_view.dart';
import 'package:ticketbook/view/seat_view.dart';

class DetailFlight extends StatefulWidget {
  final int index;
  const DetailFlight({super.key, required this.index});

  @override
  State<DetailFlight> createState() => _DetailFlightState();
}

class _DetailFlightState extends State<DetailFlight> {
  // This should be your payment link or any URL you want to launch.
  @override
  void initState() {
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).seatSelect = 1;
    Provider.of<ApiProvider>(context, listen: false).total = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, apiprovider, _) {
        var detailf = apiprovider.flightfist![widget.index];
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${detailf.departure?.city}",
                            style: TextStylUi.normalBold01()),
                        Text("${detailf.departure?.time?.substring(0, 5)}",
                            style: TextStylUi.simple01()),
                      ],
                    ),
                    Icon(CupertinoIcons.airplane,
                        size: 32.sp, color: ColorClass.palBlue),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${detailf.arrival?.city}",
                            style: TextStylUi.normalBold01()),
                        Text("${detailf.arrival?.time?.substring(0, 5)}",
                            style: TextStylUi.simple01())
                      ],
                    )
                  ],
                ),
                SizedBox(height: allMediaQuery(context, 0.012)),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.indigoAccent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Flight ID :",
                            style: TextStylUi.simple01W(),
                          ),
                          Text("Flight Number:", style: TextStylUi.simple01W())
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("${detailf.flightId}",
                              style: TextStylUi.simple01W()),
                          Text("${detailf.flightNumber}",
                              style: TextStylUi.simple01W())
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: allMediaQuery(context, 0.01)),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.indigoAccent),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey.shade300),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'AirLine :',
                                  style: TextStylUi.normalBold01(),
                                ),
                                Text(
                                  '${detailf.airline}',
                                  style: TextStylUi.simple01(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: allMediaQuery(context, 0.012)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey.shade300),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Terminal :',
                              style: TextStylUi.simple01(),
                            ),
                            Text(
                              '${detailf.departure?.terminal}',
                              style: TextStylUi.simple01(),
                            ),
                            Text(
                              'Terminal :',
                              style: TextStylUi.simple01(),
                            ),
                            Text(
                              '${detailf.arrival?.terminal}',
                              style: TextStylUi.simple01(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: allMediaQuery(context, 0.012)),
                Text("Amenities", style: TextStylUi.normalBold()),
                SizedBox(height: allMediaQuery(context, 0.012)),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.amber,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: detailf.amenities!.length,
                    itemBuilder: (context, ind) {
                      return Text(
                        "${detailf.amenities![ind]}",
                        style: TextStylUi.simple01(),
                      );
                    },
                  ),
                ),
                SizedBox(height: allMediaQuery(context, 0.012)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "AirCraftType:",
                      style: TextStylUi.simple01(),
                    ),
                    Text(
                      "${detailf.aircraftType}",
                      style: TextStylUi.simple01(),
                    ),
                  ],
                ),
                SizedBox(height: allMediaQuery(context, 0.01)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price:",
                      style: TextStylUi.simple01(),
                    ),
                    Text(
                      "${detailf.price!.toInt()}",
                      style: TextStylUi.simple01(),
                    ),
                  ],
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Seat:",
                        style: TextStylUi.simple01(),
                      ),
                      Text(
                        "${apiprovider.seatSelect}",
                        style: TextStylUi.simple01(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Consumer<ApiProvider>(builder: (context, color, _) {
                      return Dialog(
                        insetPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 270),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          color: Colors.white,
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Spacer(),
                              Text(
                                "Select Seat",
                                style: TextStylUi.simple01(),
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: color.seatColor.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          apiprovider.changeSeat(index + 1);
                                        },
                                        child: Container(
                                          color: color.seatColor[index],
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 11, horizontal: 13.5),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: Text(
                                            "${index + 1}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  if (kDebugMode) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AllticketView(),
                                      ),
                                    );
                                  }
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SeatView(
                                        count: widget.index,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.blue,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10),
                                  child: Text(
                                    "Next",
                                    style: TextStylUi.simple01W(),
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                );
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amberAccent,
                ),
                child: Center(
                  child: Text(
                    "Book",
                    style: TextStylUi.normalBold01(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
