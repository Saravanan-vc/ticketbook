import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ticketbook/model_view/login_provider.dart';
import 'package:ticketbook/ui/color.dart';
import 'package:ticketbook/view/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: ColorClass.palWhite),
          home: const LoginScreen(),
        );
      },
    );
  }
}


/* 
android   1:241846213505:android:eb63ff46ecc644c7f22680
ios       1:241846213505:ios:8c8dd6c08022020df22680
*/