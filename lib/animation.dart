import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup/coach/coachdashboard.dart';
import 'package:startup/coach/cstudentaddition.dart';

class tick extends StatelessWidget {
  const tick({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                        "images/tick.gif",
                      ))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: AnimatedButton(
              height: MediaQuery.of(context).size.height * 0.06,
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => studentaddition()));
              },
              child: AutoSizeText(
                "Add more students?",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          AutoSizeText(
            "OR",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: AnimatedButton(
              height: MediaQuery.of(context).size.height * 0.06,
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => cdashboard()));
              },
              child: AutoSizeText(
                "Back To Dashboard!",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
