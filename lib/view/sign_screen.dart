import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ticketbook/model_view/login_provider.dart';
import 'package:ticketbook/ui/color.dart';
import 'package:ticketbook/ui/image.dart';
import 'package:ticketbook/ui/widgets_ui/button_widgets.dart';
import 'package:ticketbook/ui/widgets_ui/text_button.dart';
import 'package:ticketbook/ui/widgets_ui/text_from_feild.dart';
import 'package:ticketbook/view/login_screen.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageArea.signImage), fit: BoxFit.fitHeight),
        ),
        child: Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Container(
                    height: 320.h,
                    width: 350.w,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white30,
                          Colors.transparent,
                          Colors.white38
                        ],
                      ),
                    ),
                    child: Consumer<AuthenProvider>(
                      builder: (context, authenprovider, child) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            child: TextFWidget.fromCus(
                                ColorClass.palWhite,
                                "Name",
                                ColorClass.palWhite,
                                authenprovider.signnameC),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            child: TextFWidget.fromCus(
                                ColorClass.palWhite,
                                "Email",
                                ColorClass.palWhite,
                                authenprovider.signemailC),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            child: TextFWidget.fromCus(
                                ColorClass.palWhite,
                                "Password",
                                ColorClass.palWhite,
                                authenprovider.signpassc),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            child: ButtonWidgets.buttonCus(
                                double.infinity,
                                "Submit",
                                0,
                                5,
                                ColorClass.palWhite,
                                20,
                                FontWeight.w600, () {
                              authenprovider.sign(
                                authenprovider.signemailC.text.toString(),
                                authenprovider.signpassc.text.toString(),
                                () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                authenprovider.signnameC.text.toString(),
                              );
                            }, ColorClass.palwhite10),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: TextsCusB.textButton("Have Account", () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              }, 16, ColorClass.palWhite, FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
