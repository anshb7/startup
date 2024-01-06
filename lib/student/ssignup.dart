import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup/student/slogin.dart';
import 'package:string_validator/string_validator.dart';

import '../bloc/auth_bloc.dart';

class ssignup extends StatefulWidget {
  const ssignup({super.key});

  @override
  State<ssignup> createState() => _ssignupState();
}

class _ssignupState extends State<ssignup> {
  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rpassword = TextEditingController();
  Future<void> _signupWithEmailAndPassword(context) async {
    if (formkey.currentState!.validate()) {
      BlocProvider.of<AuthenticationBloc>(context).add(
        SignUpUser(email.text, password.text),
      );
    }
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
          if (state is AuthenticationSuccessState) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => slogin()));
          }
          if (state is AuthenticationFailureState) {
            // Displaying the error message if the user is not authenticated
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Not Authenticated")));
          }
        }, builder: (context, state) {
          if (state is AuthenticationLoadingState) {
            // Displaying the loading indicator while the user is signing up
            return const Center(child: CircularProgressIndicator());
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
                    "The Dreamer.",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    "Create your account!",
                    style: Theme.of(context).textTheme.headlineSmall,
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
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
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
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
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
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        labelStyle:
                                            TextStyle(fontFamily: "Nexa"),
                                        labelText: " Re Enter password ",
                                        border: OutlineInputBorder(
                                            gapPadding: 2,
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value?.isEmpty == true) {
                                        return "Input can't be null";
                                        // } else if (value. != password.text) {
                                        //   return 'Passwords do not match';
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        onPressed: () async {
                                          final isValid =
                                              formkey.currentState?.validate();
                                          if (isValid!) {
                                            formkey.currentState?.save();

                                            try {
                                              // await _signupWithEmailAndPassword(
                                              //       context);
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
            );
          }
          return Container();
        }));
  }
}
