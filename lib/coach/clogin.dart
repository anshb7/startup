import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:startup/auth/authrepository.dart';
import 'package:startup/bloc/auth_bloc.dart';
import 'package:string_validator/string_validator.dart';

class clogin extends StatefulWidget {
  const clogin({super.key});

  @override
  State<clogin> createState() => _cloginState();
}

class _cloginState extends State<clogin> {
  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rpassword = TextEditingController();
  bool showspinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: RepositoryProvider(
          create: (context) => AuthRepository(),
          child: BlocProvider(
            create: (context) => AuthBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context)),
            child: Column(
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
                            padding: const EdgeInsets.all(8.0),
                            child: ListView(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 30),
                                      child: AutoSizeText(
                                        "Sign Up!",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 30),
                                  child: TextFormField(
                                    style: TextStyle(
                                        fontFamily: "Nexa",
                                        color: Colors.black),
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
                                        labelText: "Enter Email",
                                        labelStyle:
                                            TextStyle(fontFamily: "Nexa"),
                                        border: OutlineInputBorder(
                                            gapPadding: 2,
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    textInputAction: TextInputAction.next,
                                    onSaved: (newValue) {
                                      setState(() {
                                        email.text = newValue.toString();
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 30),
                                  child: TextFormField(
                                    obscureText: true,
                                    style: TextStyle(
                                        fontFamily: "Nexa",
                                        color: Colors.black),
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                        labelStyle:
                                            TextStyle(fontFamily: "Nexa"),
                                        labelText: "Enter password",
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
                                        password.text = newValue.toString();
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 30),
                                  child: TextFormField(
                                    obscureText: true,
                                    style: TextStyle(
                                        fontFamily: "Nexa",
                                        color: Colors.black),
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                        labelStyle:
                                            TextStyle(fontFamily: "Nexa"),
                                        labelText: " Re Enter passowrd ",
                                        border: OutlineInputBorder(
                                            gapPadding: 2,
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
                                        rpassword.text = newValue.toString();
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        onPressed: () async {
                                          final isValid =
                                              formkey.currentState?.validate();
                                          if (isValid!) {
                                            formkey.currentState?.save();
                                            setState(() {
                                              showspinner = true;
                                            });

                                            try {
                                              await AuthBloc(
                                                      authRepository:
                                                          AuthRepository())
                                                  .authRepository
                                                  .signUp(
                                                      email: email.text,
                                                      password: password.text);
                                              // createuser();
                                              final snackbar = SnackBar(
                                                content: Text(
                                                  "Successfully Added!",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackbar);
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: ((context) =>
                                              //             coachDashboard())));
                                            } catch (e) {
                                              print(e);
                                            }
                                            setState(() {
                                              showspinner = false;
                                            });
                                          }
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
