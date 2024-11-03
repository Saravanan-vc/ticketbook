import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ticketbook/model_view/api_provider.dart';
import 'package:ticketbook/model_view/login_provider.dart';
import 'package:ticketbook/ui/color.dart';
import 'package:ticketbook/ui/image.dart';
import 'package:ticketbook/ui/mediaquery.dart';
import 'package:ticketbook/ui/text_styl_ui.dart';
import 'package:ticketbook/ui/widgets_ui/card_widgets.dart';
import 'package:ticketbook/ui/widgets_ui/text_from_feild.dart';
import 'package:ticketbook/view/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? name;
  @override
  void initState() {
    name = Provider.of<AuthenProvider>(context, listen: false).userName;
    Provider.of<ApiProvider>(context, listen: false).controllingSeach();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageArea.wallImage), fit: BoxFit.fitHeight),
          ),
          child: Consumer<ApiProvider>(
            builder: (context, apiprovider, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: allMediaQuery(context, 0.08)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Consumer<AuthenProvider>(
                      builder: (context, authenpriver, _) => Text(
                          "Hi ${authenpriver.userName ?? box.get(01)}",
                          style: TextStylUi.normalBold()),
                    ),
                  ),
                  SizedBox(height: allMediaQuery(context, 0.001)),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Where You want to fly ?",
                          style: TextStylUi.normalBold01())),
                  SizedBox(height: allMediaQuery(context, 0.04)),
                  Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFWidget.fromCus(ColorClass.palWhite,
                                "From", ColorClass.palBlack, apiprovider.from),
                          ),
                          SizedBox(height: allMediaQuery(context, 0.02)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFWidget.fromCus(ColorClass.palWhite,
                                "To", ColorClass.palBlack, apiprovider.to),
                          ),
                        ],
                      ),
                      Positioned(
                          right: 10,
                          top: 24,
                          child: Image.asset(ImageArea.arrowImage))
                    ],
                  ),
                  SizedBox(height: allMediaQuery(context, 0.04)),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailFlight(index: index))),
                          child: CardWidgets(
                            origin:
                                "${apiprovider.flightlist[index].departure?.city}",
                            distination:
                                "${apiprovider.flightlist[index].arrival?.city}",
                            aircraftype:
                                "${apiprovider.flightlist[index].aircraftType}",
                            price:
                                "${apiprovider.flightlist[index].price?.toInt()}",
                            time: "${apiprovider.flightlist[index].duration}",
                            distinationtime:
                                "${apiprovider.flightlist[index].arrival?.time?.substring(0, 5)}",
                            origintime:
                                "${apiprovider.flightlist[index].departure?.time?.substring(0, 5)}",
                            index: index,
                          ),
                        );
                      },
                      itemCount: apiprovider.flightlist.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
