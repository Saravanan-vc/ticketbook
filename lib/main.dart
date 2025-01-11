import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketbook/model_view/api_provider.dart';
import 'package:ticketbook/model_view/login_provider.dart';
import 'package:ticketbook/model_view/payed_provider.dart';
import 'package:ticketbook/ui/color.dart';
import 'package:ticketbook/view/home_view.dart';
import 'package:ticketbook/view/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  box = await Hive.openBox('Data');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenProvider()),
        ChangeNotifierProvider(create: (context) => ApiProvider()),
        ChangeNotifierProvider(create: (context) => PayedProvider())
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
            theme: ThemeData(
                scaffoldBackgroundColor: ColorClass.palWhite,
                appBarTheme: AppBarTheme(color: ColorClass.palWhite)),
            home: const SplashScreen());
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<ApiProvider>(context, listen: false).gettinData();
    sharedpreferencescheck(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.palWhite,
    );
  }

  //check the user is login or not
  sharedpreferencescheck(context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? login = sharedPreferences.getBool("check");
    debugPrint("statement");
    Future.delayed((const Duration(seconds: 3)), () {
      if (login == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }
}

//changes
//second time changing
/* 
android   1:241846213505:android:eb63ff46ecc644c7f22680
ios       1:241846213505:ios:8c8dd6c08022020df22680
*/
