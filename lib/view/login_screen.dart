import 'package:flutter/material.dart';
import 'package:ticketbook/ui/image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Image.asset(ImageArea.loginImage)
        ],
      ),
    );
  }
}
