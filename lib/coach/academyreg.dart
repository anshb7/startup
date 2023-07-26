import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class academyReg extends StatefulWidget {
  const academyReg({super.key});

  @override
  State<academyReg> createState() => _academyRegState();
}

class _academyRegState extends State<academyReg> {
  final user = FirebaseAuth.instance.currentUser;

  final formkey = GlobalKey<FormState>();
  String name = "";
  double phoneNo = 0;
  String sportName = "";
  String academyName = "";
  double age = 0;
  double noOfExp = 0;

  CollectionReference coaches =
      FirebaseFirestore.instance.collection("Coaches");
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
              "Academy Registration",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              "Rock and Roll 🚀",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Expanded(
            child: Center(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8)),
                child: Form(
                    key: formkey,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListView(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                child: AutoSizeText(
                                  "Sign In!",
                                  style: Theme.of(context).textTheme.titleLarge,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: "Nexa", color: Colors.black),
                                validator: (value) {
                                  if (isInt(value.toString())) {
                                    return "Invalid Input";
                                  } else if (value?.isEmpty == true) {
                                    return "Input can't be null";
                                  } else {
                                    return null;
                                  }
                                },
                                autocorrect: true,
                                decoration: InputDecoration(
                                    labelText: "Enter Name",
                                    labelStyle: TextStyle(fontFamily: "Nexa"),
                                    border: OutlineInputBorder(
                                        gapPadding: 2,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                textInputAction: TextInputAction.next,
                                onSaved: (newValue) {
                                  setState(() {
                                    name = newValue.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: "Nexa", color: Colors.black),
                                validator: (value) {
                                  if (isInt(value.toString())) {
                                    return "Invalid Input";
                                  } else if (value?.isEmpty == true) {
                                    return "Input can't be null";
                                  } else {
                                    return null;
                                  }
                                },
                                autocorrect: true,
                                decoration: InputDecoration(
                                    labelText: "Enter Age",
                                    labelStyle: TextStyle(fontFamily: "Nexa"),
                                    border: OutlineInputBorder(
                                        gapPadding: 2,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                textInputAction: TextInputAction.next,
                                onSaved: (newValue) {
                                  setState(() {
                                    age = newValue.toString() as double;
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                    fontFamily: "Nexa", color: Colors.black),
                                validator: (value) {
                                  if (isInt(value.toString())) {
                                    return "Invalid Input";
                                  } else if (value?.isEmpty == true) {
                                    return "Input can't be null";
                                  } else {
                                    return null;
                                  }
                                },
                                autocorrect: true,
                                decoration: InputDecoration(
                                    labelText: "Enter PhoneNo",
                                    labelStyle: TextStyle(fontFamily: "Nexa"),
                                    border: OutlineInputBorder(
                                        gapPadding: 2,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                textInputAction: TextInputAction.next,
                                onSaved: (newValue) {
                                  setState(() {
                                    phoneNo = newValue.toString() as double;
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: "Nexa", color: Colors.black),
                                validator: (value) {
                                  if (isInt(value.toString())) {
                                    return "Invalid Input";
                                  } else if (value?.isEmpty == true) {
                                    return "Input can't be null";
                                  } else {
                                    return null;
                                  }
                                },
                                autocorrect: true,
                                decoration: InputDecoration(
                                    labelText: "Enter Academy Name",
                                    labelStyle: TextStyle(fontFamily: "Nexa"),
                                    border: OutlineInputBorder(
                                        gapPadding: 2,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                textInputAction: TextInputAction.next,
                                onSaved: (newValue) {
                                  setState(() {
                                    academyName = newValue.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: "Nexa", color: Colors.black),
                                validator: (value) {
                                  if (isInt(value.toString())) {
                                    return "Invalid Input";
                                  } else if (value?.isEmpty == true) {
                                    return "Input can't be null";
                                  } else {
                                    return null;
                                  }
                                },
                                autocorrect: true,
                                decoration: InputDecoration(
                                    labelText: "Enter Sport Name",
                                    labelStyle: TextStyle(fontFamily: "Nexa"),
                                    border: OutlineInputBorder(
                                        gapPadding: 2,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                textInputAction: TextInputAction.next,
                                onSaved: (newValue) {
                                  setState(() {
                                    sportName = newValue.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontFamily: "Nexa", color: Colors.black),
                                autocorrect: true,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(fontFamily: "Nexa"),
                                    labelText: "Enter Years of Experience",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value?.isEmpty == true) {
                                    return "Input can't be null";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (newValue) {
                                  setState(() {
                                    noOfExp = double.parse(newValue.toString());
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Center(
                              child: AnimatedButton(
                                  color: Theme.of(context).colorScheme.primary,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  shadowDegree: ShadowDegree.light,
                                  onPressed: () {},
                                  child: AutoSizeText(
                                    "Let's go!",
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
