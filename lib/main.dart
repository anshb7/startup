// ignore_for_file: unused_import

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:animated_button/animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoid/async.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup/animation.dart';
import 'package:startup/auth/authrepository.dart';
import 'package:startup/bloc/auth_bloc.dart';
import 'package:intl/intl.dart';
import 'package:startup/bloc/bloc/stadd_bloc.dart';
import 'package:startup/bloc/coachdb/bloc/coachdb_bloc.dart';
import 'package:startup/bloc/uploadvideobloc/bloc/upload_video_bloc.dart';
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
import "package:startup/services/notificationservices.dart";

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    // You can also use a `ReCaptchaEnterpriseProvider` provider instance as an
    // argument for `webProvider`
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Safety Net provider
    // 3. Play Integrity provider
    androidProvider: AndroidProvider.debug,
    // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Device Check provider
    // 3. App Attest provider
    // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
    appleProvider: AppleProvider.appAttest,
  );
  print("object");
  print(
      DateFormat("dd.MM.yyyy").format(DateTime.now().add(Duration(days: 30))));
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
              create: (context) => UploadVideoBloc(
                  RepositoryProvider.of<DatabaseService>(context))),
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
            '/': (context) => MyHomePage(),
            '/cdashboard': (context) => cdashboard(),
            'csignup': (context) => clogin(),
            'clogin': (context) => csignin(),
            '/studentaddition': (context) => studentaddition(),
            '/slogin': (context) => slogin(),
            '/ssignup': (context) => ssignup(),

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
                    fontSize: 10,
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
  final easyList = [
    'Bounce the ball on your racket continuously for 1 minute.',
    'Volley the ball back and forth against a wall.',
    'Bounce the ball on the table and catch it with your racket.',
    'Spin the ball on your racket for as long as possible.',
    'Hit the ball against a wall and let it bounce once before hitting it back.',
    'Serve the ball from different positions on the table.',
    'Hit the ball alternating between forehand and backhand strokes.',
    'Serve the ball with different spins (topspin, backspin, sidespin).',
    'Play a game of around-the-table, hitting the ball to different sides of the table.',
    'Serve the ball and catch it with your free hand.',
    'Play a game of table tennis with a handicap (e.g., weaker hand, standing farther from the table).',
    'Serve the ball with different spins and have your partner identify the spin.',
    'Hit the ball with different types of shots (drive, loop, smash, chop).',
    'Serve the ball and hit it back to yourself, alternating between forehand and backhand strokes.',
    'Play a game of solo table tennis, hitting the ball back and forth to yourself.',
    'Hit the ball against a wall and let it bounce twice before hitting it back.',
    'Serve the ball and hit it back to yourself with different spins.',
    'Hit the ball against a wall and let it bounce on different surfaces (floor, table, etc.) before hitting it back.',
    'Play a game of table tennis against a partner, focusing on consistent rally lengths.',
    'Serve the ball with different spins and have your partner return it.',
  ];
  final mediumList = [
    'Serve the ball and hit it back to yourself, alternating between forehand and backhand spins.',
    'Play a game of solo table tennis, hitting the ball with different spins and types of shots.',
    'Serve the ball and hit it back to yourself, alternating between forehand and backhand sidespin.',
    'Hit the ball against a wall and let it bounce three times before hitting it back.',
    'Play a game of table tennis with a handicap (e.g., weaker hand, standing farther from the table, using a different paddle).',
    'Serve the ball with different spins and have your partner identify the spin and return it with a specific shot type.',
    'Hit the ball with different types of shots in a specific sequence (e.g., drive, loop, smash, chop).',
    'Play a game of table tennis against a partner, focusing on consistent rally lengths with different spins and types of shots.',
    'Serve the ball and hit it back to yourself, alternating between forehand and backhand topspin and backspin.',
    'Hit the ball against a wall and let it bounce four times before hitting it back.',
    'Play a game of solo table tennis, hitting the ball with different spins, types of shots, and rally lengths.',
    'Serve the ball and hit it back to yourself, alternating between forehand and backhand sidespin and topspin.',
    'Hit the ball against a wall and let it bounce on different surfaces, incorporating different spins and types of shots.',
    'Play a game of table tennis against a partner, focusing on consistent rally lengths with different spins, types of shots, and rally lengths.',
    'Serve the ball with different spins and have your partner return it with a specific spin and shot type.',
    'Hit the ball with different types of shots in a specific sequence, incorporating different spins and rally lengths.',
    'Play a game of table tennis with multiple handicaps and specific shot requirements (e.g., weaker hand, standing farther from the table, using a different paddle, incorporating specific shot types).',
    'Serve the ball with different spins and have your partner identify the spin, return it with a specific shot type, and incorporate a specific spin.',
    'Hit the ball against a wall and let it bounce five times before hitting it back.',
    'Serve the ball and hit it back to yourself, alternating between forehand and backhand topspin, backspin, and sidespin.',
  ];
  final hardList = [
    'Play a game of solo table tennis, hitting the ball with different spins, types of shots, rally lengths, and incorporating specific shot sequences.',
    'Serve the ball and hit it back to yourself, alternating between forehand and backhand sidespin, topspin, and backspin.',
    'Hit the ball against a wall and let it bounce on different surfaces, incorporating different spins, types of shots, rally lengths, and specific shot sequences.',
    'Play a game of table tennis against a partner, focusing on consistent rally lengths with different spins, types of shots, rally lengths, and specific shot sequences.',
    'Serve the ball with different spins and have your partner return it with a specific spin, shot type, and rally length.',
    'Hit the ball with different types of shots in a specific sequence, incorporating different spins, rally lengths, and specific shot requirements.',
    'Play a game of table tennis with multiple handicaps, specific shot requirements, and incorporating specific shot sequences (e.g., weaker hand, standing farther from the table, using a different paddle, incorporating specific shot types, spins, and rally lengths).',
    'Serve the ball with different spins and have your partner identify the spin, return it with a specific shot type, incorporate a specific spin, and maintain a specific rally length.',
    'Hit the ball against a wall and let it bounce six times before hitting it back.',
    'Serve the ball and hit it back to yourself, alternating between forehand and backhand topspin, backspin, sidespin, and incorporating different types of shots.',
    'Play a game of solo table tennis, hitting the ball with different spins, types of shots, rally lengths, incorporating specific shot sequences, and incorporating different surfaces for the ball to bounce on.',
    'Serve the ball and hit it back to yourself, alternating between forehand and backhand sidespin, topspin, backspin, and incorporating different types of shots.',
    'Hit the ball against a wall and let it bounce on different surfaces, incorporating different spins, types of shots, rally lengths, specific shot sequences, and incorporating different surfaces for the ball to bounce on.',
    'Play a game of table tennis against a partner, focusing on consistent rally lengths with different spins, types of shots, rally lengths, specific shot sequences, and incorporating different surfaces for the ball to bounce on.',
    'Serve the ball with different spins and have your partner return it with a specific spin, shot type, rally length, and incorporating different surfaces for the ball to bounce on.',
    'Hit the ball with different types of shots in a specific sequence, incorporating different spins, rally lengths, specific shot requirements, and incorporating different surfaces for the ball to bounce on.',
    'Play a game of table tennis with multiple handicaps, specific shot requirements, incorporating specific shot sequences, and incorporating different surfaces for the ball to bounce on (e.g., weaker hand, standing farther from the table, using a different paddle, incorporating specific shot types, spins, rally lengths, and surfaces for the ball to bounce on).',
    'Serve the ball with different spins and have your partner identify the spin, return it with a specific shot type, incorporate a specific spin, maintain a specific rally length, and incorporate different surfaces for the ball to bounce on.',
    'Hit the ball against a wall and let it bounce seven times before hitting it back.',
    'Serve the ball and hit it back to yourself, alternating between forehand and backhand topspin, backspin, sidespin, incorporating different types of shots, and incorporating different surfaces for the ball to bounce on.',
  ];

  Future<void> pushChallenge() async {
    final db = FirebaseFirestore.instance;
    DateTime date = DateTime(2024, 5, 1);
    for (var i = 0; i < 20; i++) {
      print(DateFormat("dd.MM.yyyy").format(date));
      await db
          .collection("Challenges")
          .doc(DateFormat("dd.MM.yyyy").format(date))
          .collection("Easy")
          .doc("EasyQ")
          .set({"question": easyList[i]});
      ;
      await db
          .collection("Challenges")
          .doc(DateFormat("dd.MM.yyyy").format(date))
          .collection("Hard")
          .doc("HardQ")
          .set({"question": hardList[i]});

      await db
          .collection("Challenges")
          .doc(DateFormat("dd.MM.yyyy").format(date))
          .collection("Medium")
          .doc("MedQ")
          .set({"question": mediumList[i]});
      date = date.add(Duration(days: 7));
    }
  }
  // void firebaseInit(BuildContext context) {
  //   FirebaseMessaging.onMessage.listen((message) {});
  // }

  late bool isCoachLoggedIn = false;
  late bool isUidRegistered = false;
  late bool isAcadRegistered = false;
  late bool isStudentLoggedIn = false;

  Future<void> loginstate() async {
    var sharedpref = await SharedPreferences.getInstance();
    setState(() {
      isCoachLoggedIn = sharedpref.getBool("isCoachLoggedIn") ?? false;

      isStudentLoggedIn = sharedpref.getBool("isStudentLoggedIn") ?? false;
      isUidRegistered = sharedpref.getBool("isUidRegistered") ?? false;

      isAcadRegistered = sharedpref.getBool("isAcadRegistered") ?? false;
    });

    //print(sharedpref);
  }

  void initState() {
    if (user == null) {
      print("no user");
    } else {
      print("yes user");
    }
    //pushChallenge();
    //setInitialState();
    loginstate();
    //print("isCoachLoggedIn: ${isCoachLoggedIn}");
    //print("isStudentLoggedIn: ${sharedpref.getBool("isStudentLoggedIn")}");
    //print("isUidRegistered: ${sharedpref.getBool("isUidRegistered")}");
    // print("isAcadRegistered: ${isAcadRegistered}");

    super.initState();
  }

  final auth = FirebaseAuth.instance;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  @override
  Widget build(BuildContext context) {
    loginstate();
    //print("isStudentLoggedIn: ${sharedpref.getBool("isStudentLoggedIn")}");
    // print("isUidRegistered: ${sharedpref.getBool("isUidRegistered")}");

    return
        // if (snapshot.connectionState == ConnectionState.done) {
        //   if (isLoggedIn && isUidRegistered) {
        //     return sthomepage();
        //   }
        //   if (isLoggedIn && isRegistered) {
        //     return cdashboard();
        //   }
        //   if (isLoggedIn && isRegistered == false) {
        //     return academyReg();
        //   }

        StreamBuilder(
      stream: auth.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            (!snapshot.data!.isAnonymous) &&
            isCoachLoggedIn &&
            isAcadRegistered) {
          return cdashboard();
        } else if (snapshot.hasData &&
            (!snapshot.data!.isAnonymous) &&
            isStudentLoggedIn &&
            isUidRegistered) {
          return sthomepage();
        } else {
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
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/tt.jpg"))),
                        )),
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
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.7,
                              shadowDegree: ShadowDegree.dark,
                              onPressed: () {
                                Navigator.pushNamed(context, "/slogin");
                              },
                              child: AutoSizeText(
                                "Sign in with Phone Number",
                                style: Theme.of(context).textTheme.labelSmall,
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          AnimatedButton(
                              color: Color.fromRGBO(254, 171, 30, 1),
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.7,
                              shadowDegree: ShadowDegree.dark,
                              onPressed: () {
                                //await pushChallenge();
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
        }
      },
    );
  }
  // } else {
  //   return Center(child: CircularProgressIndicator());
  // }
}
