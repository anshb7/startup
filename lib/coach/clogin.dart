import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class clogin extends StatefulWidget {
  const clogin({super.key});

  @override
  State<clogin> createState() => _cloginState();
}

class _cloginState extends State<clogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              "The person behind all of it.",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              "Create your account",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8)),
              child: Form(child: Container()),
            ),
          )
        ],
      ),
    );
  }
}
