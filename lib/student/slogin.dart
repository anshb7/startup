import 'dart:math';

import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup/student/otpScreen.dart';
import 'package:startup/student/stover.dart';
import 'package:string_validator/string_validator.dart';

import '../bloc/auth_bloc.dart';

class slogin extends StatefulWidget {
  const slogin({super.key});

  @override
  State<slogin> createState() => _sloginState();
}

class _sloginState extends State<slogin> {
  final _firebaseAuth = FirebaseAuth.instance;
  String verificationID = "";
  final formkey = GlobalKey<FormState>();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController uid = TextEditingController();
  TextEditingController acadName = TextEditingController();
  bool loggedIn = false;
  bool uidregistered = false;
  var allS = FirebaseFirestore.instance.collection("AllStudents");

  Future<void> storeAndGenKey(String s1, String s2) async {
    String? a = "";
    var _messaging = FirebaseMessaging.instance;
    a = await _messaging.getToken();
    print('$a');
    await FirebaseFirestore.instance
        .collection("Academies")
        .doc(s1)
        .collection("Students")
        .doc(s2)
        .update({"userToken": '$a'});
  }

  Future<void> _authenticateWithPhone(context) async {
    if (formkey.currentState!.validate()) {
      BlocProvider.of<AuthenticationBloc>(context)
          .add(OTPcodesent(phoneNo.text));
    }
    var prefs = await SharedPreferences.getInstance();
    loggedIn = prefs.getBool("isLoggedIn") ?? false;
    uidregistered = prefs.getBool("isUidRegistered") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
          if (state is authCodeSent) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => otpScreen(
                          phoneNo: phoneNo.text,
                        )));
          }
          if (state is AuthenticationSuccessState &&
              loggedIn &&
              uidregistered) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => sthomepage()));
          }
          if (state is AuthenticationFailureState) {
            // Displaying the error message if the user is not authenticated
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Not Authentication")));
          }
        }, builder: (context, state) {
          if (state is AuthenticationLoadingState) {
            // Displaying the loading indicator while the user is signing up
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          }
          if (state is AuthenticationInitialState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    "Login to your account!",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    "Let's get this started",
                    style: Theme.of(context).textTheme.headlineSmall,
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
                    child: Form(
                        key: formkey,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 30),
                                    child: AutoSizeText(
                                      "Sign In!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                      fontFamily: "Nexa", color: Colors.black),
                                  validator: (value) {
                                    if (!isInt(value.toString())) {
                                      return "Invalid Input";
                                    } else if (value?.isEmpty == true) {
                                      return "Input can't be null";
                                    } else {
                                      return null;
                                    }
                                  },
                                  autocorrect: true,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      labelText: "Enter Phone No.",
                                      labelStyle: TextStyle(fontFamily: "Nexa"),
                                      border: OutlineInputBorder(
                                          gapPadding: 2,
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  textInputAction: TextInputAction.next,
                                  onSaved: (newValue) {
                                    setState(() {
                                      phoneNo.text =
                                          "+91" + newValue.toString();
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
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
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      labelText: "Enter UniqueID",
                                      labelStyle: TextStyle(fontFamily: "Nexa"),
                                      border: OutlineInputBorder(
                                          gapPadding: 2,
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  textInputAction: TextInputAction.next,
                                  onSaved: (newValue) {
                                    setState(() {
                                      uid.text = newValue.toString();
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: AnimatedButton(
                                      color: Color.fromRGBO(26, 26, 26, 1),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      onPressed: () async {
                                        final isValid =
                                            formkey.currentState?.validate();
                                        formkey.currentState?.save();

                                        allS
                                            .doc("AnshTGE1-o__AO")
                                            .get()
                                            .then((value) async {
                                          if (value.exists) {
                                            if (isValid!) {
                                              try {
                                                // var sp = await SharedPreferences
                                                //     .getInstance();
                                                // sp.setBool("isLoggedIn", true);
                                                // sp.setBool(
                                                //     "isUidRegistered", true);
                                                await _authenticateWithPhone(
                                                    context);
                                                // await storeAndGenKey(
                                                //     acadName.text, uid.text);

                                                // final snackbar = SnackBar(
                                                //   content: Text(
                                                //     "Successfully Added!",
                                                //     style: TextStyle(
                                                //         fontSize: 15,
                                                //         color: Colors.white),
                                                //   ),
                                                // );
                                                // ScaffoldMessenger.of(context)
                                                //     .showSnackBar(snackbar);
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: ((context) =>
                                                //             coachDashboard())));
                                              } catch (e) {
                                                print(e);
                                              }
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Wrong UniqueID")));
                                          }
                                        });
                                      },
                                      child: Text("Submit! ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))),
                  ),
                ),
              ],
            );
          }
          return Container();
        }));
  }
}
