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
import 'package:ticketbook/view/home_view.dart';
import 'package:ticketbook/view/sign_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageArea.loginImage), fit: BoxFit.fitHeight),
          ),
          child: Consumer<AuthenProvider>(
            builder: (context, authenprovider, child) => Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    height: 250.h,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: TextFWidget.fromCus(
                              ColorClass.palWhite,
                              "Email",
                              ColorClass.palWhite,
                              authenprovider.mailcontroller),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: TextFWidget.fromCus(
                              ColorClass.palWhite,
                              "Password",
                              ColorClass.palWhite,
                              authenprovider.passcontroller),
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
                            authenprovider.login(
                              authenprovider.mailcontroller.text.toString(),
                              authenprovider.passcontroller.text.toString(),
                              () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const HomeView(),
                                  ),
                                );
                              },
                            );
                          }, ColorClass.palwhite10),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: TextsCusB.textButton("No Account", () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const SignScreen(),
                                ),
                              );
                            }, 16, ColorClass.palBlue, FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
