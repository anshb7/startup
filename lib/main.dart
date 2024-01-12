// ignore_for_file: unused_import

import 'dart:developer';
import 'dart:ffi';
import 'package:animated_button/animated_button.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoid/async.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup/animation.dart';
import 'package:startup/auth/authrepository.dart';
import 'package:startup/bloc/auth_bloc.dart';
import 'package:startup/bloc/bloc/stadd_bloc.dart';
import 'package:startup/bloc/coachdb/bloc/coachdb_bloc.dart';
import 'package:startup/coach/academyreg.dart';
import 'package:startup/coach/clogin.dart';
import 'package:startup/coach/coachdashboard.dart';
import 'package:startup/coach/coachfees.dart';
import 'package:startup/student/slogin.dart';
import 'package:startup/student/ssignup.dart';
import 'package:startup/student/stalerts.dart';
import 'package:startup/coach/csignup.dart';
import 'package:startup/coach/cstudentaddition.dart';
import 'package:startup/coach/metrics.dart';
import 'package:startup/coach/studentreview.dart';
import 'package:startup/database/databaseprov.dart';
import 'package:startup/student/stalerts.dart';
import 'package:startup/student/sthome.dart';
import 'package:startup/student/stover.dart';
import 'package:startup/student/studentprofile.dart';
import 'package:uuid/uuid.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Future.delayed(Duration(seconds: 5));
  // ignore: unused_local_variable
  String? apsntoken = await FirebaseMessaging.instance.getAPNSToken();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => DatabaseService(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => StaddBloc(
                databaseService:
                    RepositoryProvider.of<DatabaseService>(context)),
          ),
          BlocProvider(create: (context) => AuthenticationBloc()),
          BlocProvider(
            create: (context) => CoachdbBloc(
                databaseService:
                    RepositoryProvider.of<DatabaseService>(context)),
          ),
        ],
        child: MaterialApp(
          routes: {
            '/': (context) => cfees(),
            '/cdashboard': (context) => cdashboard(),
            'csignup': (context) => clogin(),
            'clogin': (context) => csignin(),
            '/studentaddition': (context) => studentaddition(),
            '/slogin': (context) => slogin(),
            '/ssignup': (context) => ssignup(),
            '/stprofile': (context) => stprofile()
            //'/metric': (context) => metricaddition()
          },
          theme: ThemeData(
            iconButtonTheme: IconButtonThemeData(
                style: ButtonStyle(
                    iconColor: MaterialStateProperty.all<Color>(Colors.black),
                    iconSize: MaterialStatePropertyAll(16))),
            textTheme: const TextTheme(
                displayMedium: TextStyle(
                    fontFamily: "Nexa",
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                headlineLarge: TextStyle(
                  fontFamily: "Nexa",
                  fontSize: 35,
                  color: Colors.black,
                ),
                labelSmall: TextStyle(
                  fontFamily: "Nexa",
                  fontSize: 14,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                headlineSmall: TextStyle(
                    fontFamily: "Nexa",
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                headlineMedium: TextStyle(
                    fontFamily: "Nexa",
                    fontSize: 12,
                    color: Color.fromRGBO(29, 144, 255, 1),
                    fontWeight: FontWeight.w400),
                titleMedium: TextStyle(
                    fontFamily: "Nexa",
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
                titleSmall: TextStyle(
                    fontFamily: "Nexa",
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                titleLarge: TextStyle(
                    fontFamily: "Nexa",
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: Color.fromRGBO(247, 175, 6, 1),
                primary: Color.fromRGBO(26, 26, 26, 1)),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var _firebasemessaging = FirebaseMessaging.instance;

  bool isLoggedIn = false;
  bool isUidRegistered = false;
  bool isRegistered = false;
  Future<void> loginstate() async {
    var sharedpref = await SharedPreferences.getInstance();
    //print(sharedpref);
    isLoggedIn = sharedpref.getBool("isLoggedIn") ?? false;
    isUidRegistered = sharedpref.getBool("isUidRegistered") ?? false;
    //print(isCoachLoggedIn);
    isRegistered = sharedpref.getBool("isRegistered") ?? false;
    //print(isCoachReg);
  }

  Future<void> initNotif() async {
    await _firebasemessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    final fcmtoken = await _firebasemessaging.getToken();
    print('$fcmtoken');
  }

  void initState() {
    loginstate();
    initNotif();
    super.initState();
  }

  User? user = FirebaseAuth.instance.currentUser;

  final List<String> imageList = [
    "https://cdn.dribbble.com/users/4643902/screenshots/17759596/media/1873de7f0db5446fe244bd757c7bcd8e.jpg?compress=1&resize=1600x1200&vertical=center",
    "https://img.freepik.com/free-vector/hello-wording-comic-speech-bubble-pop-art-style_1150-39959.jpg?w=2000",
    'https://cdn.dribbble.com/users/1270214/screenshots/6561699/gamification-toms-stals-flat-illustration-phantoms-closeup.png'
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loginstate(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (isLoggedIn && isUidRegistered) {
              return sthomepage();
            }
            if (isLoggedIn && isRegistered) {
              return cdashboard();
            }
            if (isLoggedIn && isRegistered == false) {
              return academyReg();
            }
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.primary,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  "Athleap",
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://cdn.dribbble.com/users/4643902/screenshots/17759596/media/1873de7f0db5446fe244bd757c7bcd8e.jpg?compress=1&resize=1600x1200&vertical=center"))),
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.fill,
                        child: AutoSizeText(
                          "Train.Dream.Achieve.",
                          minFontSize: 15,
                          style: TextStyle(
                            fontFamily: "Nexa",
                            fontSize: 35,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: AutoSizeText(
                          "All your sports performance at one place!",
                          minFontSize: 15,
                          style: Theme.of(context).textTheme.labelSmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.8,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            AnimatedButton(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.5,
                                shadowDegree: ShadowDegree.dark,
                                onPressed: () {
                                  Navigator.pushNamed(context, "/slogin");
                                },
                                child: AutoSizeText(
                                  "Sign in with Email",
                                  style: Theme.of(context).textTheme.labelSmall,
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            AnimatedButton(
                                color: Theme.of(context).colorScheme.primary,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.5,
                                shadowDegree: ShadowDegree.light,
                                onPressed: () {},
                                child: AutoSizeText(
                                  "Sign in with Google",
                                  style: Theme.of(context).textTheme.labelSmall,
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            AnimatedButton(
                                color: Color.fromRGBO(254, 171, 30, 1),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.5,
                                shadowDegree: ShadowDegree.dark,
                                onPressed: () {
                                  Navigator.pushNamed(context, 'clogin');
                                },
                                child: AutoSizeText(
                                  "Are you a coach?",
                                  style: Theme.of(context).textTheme.labelSmall,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
