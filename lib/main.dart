import 'package:beautonomi/provider/main_provider.dart';
import 'package:beautonomi/screens/auth/auth_screen.dart';
import 'package:beautonomi/screens/auth/sign_in_bottomsheet.dart';
import 'package:beautonomi/screens/home_screen/category_screen.dart';
import 'package:beautonomi/screens/home_screen/home_screen.dart';
import 'package:beautonomi/screens/home_screen/my_booking_screen.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation/bottom_navigation.dart';
import 'bottom_navigation/bottom_try.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializApp(); //will initialize firebase in our appliation
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return ChangeNotifierProvider<MainProvider>(
          create: (context) => MainProvider(),
          builder: (context, child) => MaterialApp(
            title: "Hair by levy",
            theme: ThemeData(
              splashColor: kMainColor,
              unselectedWidgetColor: kSecondaryColor,
              scaffoldBackgroundColor: kMainColor,
              fontFamily: "Poppins",
              primaryColor: const Color(0xff1D2D61), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kMainColor),
            ),
            debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            home: const AuthScreen(),
          ),
        );
      },
      designSize: const Size(428, 926),
    );
  }
}
