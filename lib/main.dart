import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup/auth/authrepository.dart';
import 'package:startup/bloc/auth_bloc.dart';
import 'package:startup/bloc/coachdb/bloc/coachdb_bloc.dart';
import 'package:startup/coach/clogin.dart';

import 'package:startup/coach/csignup.dart';
import 'package:startup/coach/cstudentaddition.dart';
import 'package:startup/database/databaseprov.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
            create: (context) => AuthBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context)),
          ),
          BlocProvider(
            create: (context) => CoachdbBloc(
                databaseService:
                    RepositoryProvider.of<DatabaseService>(context)),
          ),
        ],
        child: MaterialApp(
          routes: {
            '/': (context) => studentaddition(), //MyHomePage(),
            'csignup': (context) => clogin(),
            'clogin': (context) => csignin(),
            '/studentaddition': (context) => studentaddition(),
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
                  color: Colors.white,
                ),
                labelSmall: TextStyle(
                  fontFamily: "Nexa",
                  fontSize: 17,
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
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                titleLarge: TextStyle(
                    fontFamily: "Nexa",
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: Color.fromRGBO(29, 144, 255, 1),
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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imageList = [
    "https://cdn.dribbble.com/users/4643902/screenshots/17759596/media/1873de7f0db5446fe244bd757c7bcd8e.jpg?compress=1&resize=1600x1200&vertical=center",
    "https://img.freepik.com/free-vector/hello-wording-comic-speech-bubble-pop-art-style_1150-39959.jpg?w=2000",
    'https://cdn.dribbble.com/users/1270214/screenshots/6561699/gamification-toms-stals-flat-illustration-phantoms-closeup.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text("Athleap"),
        elevation: 0,
      ),
      body: Center(
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
              fit: BoxFit.contain,
              child: AutoSizeText(
                "Train.Dream.Achieve.",
                minFontSize: 15,
                style: Theme.of(context).textTheme.headlineLarge,
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
                      width: MediaQuery.of(context).size.width * 0.5,
                      shadowDegree: ShadowDegree.dark,
                      onPressed: () {},
                      child: AutoSizeText(
                        "Sign in with Email",
                        style: Theme.of(context).textTheme.labelSmall,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  AnimatedButton(
                      color: Theme.of(context).colorScheme.primary,
                      height: MediaQuery.of(context).size.height * 0.05,
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
                      height: MediaQuery.of(context).size.height * 0.05,
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
    );
  }
}
