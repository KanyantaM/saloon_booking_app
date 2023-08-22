import 'package:beautonomi/blocs/branches/branch_bloc.dart';
import 'package:beautonomi/blocs/crud/baber/baber_bloc.dart';
import 'package:beautonomi/firebase_options.dart';
import 'package:beautonomi/screens/auth/auth_screen.dart';
import 'package:beautonomi/screens/home_screen/home_screen.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'blocs/auth/auth_bloc.dart';
import 'data/repositories/auth_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Will initialize Firebase in your application
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
          //child: BlocProvider(
          //create: ((context) => AuthBloc(
          //  authRepository:
          //    RepositoryProvider.of<AuthRepository>(context))),
        ),
        BlocProvider(
          create: ((context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context))),
        ),
        BlocProvider(create: ((context)=>BaberBloc())),
        BlocProvider(create: ((context)=>BranchBloc())),
        // Add more BlocProviders as needed
      ],
      child: ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
              title: "Hair by levy",
              theme: ThemeData(
                splashColor: kMainColor,
                unselectedWidgetColor: kSecondaryColor,
                scaffoldBackgroundColor: kMainColor,
                fontFamily: "Poppins",
                primaryColor: const Color(0xff1D2D61),
                colorScheme:
                    ColorScheme.fromSwatch().copyWith(secondary: kMainColor),
              ),
              debugShowMaterialGrid: false,
              debugShowCheckedModeBanner: false,
              home: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return const HomeScreen();
                  } else {
                    return const AuthScreen();
                  }
                }),
              ));
        },
        designSize: const Size(428, 926),
      ),
    );
  }
}
