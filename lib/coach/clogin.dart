import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup/bloc/auth_bloc.dart';
import 'package:startup/coach/academyreg.dart';
import 'package:startup/main.dart';
import 'package:string_validator/string_validator.dart';

class csignin extends StatefulWidget {
  const csignin({super.key});

  @override
  State<csignin> createState() => _csigninState();
}

class _csigninState extends State<csignin> {
  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => academyReg()));
          }
          if (state is AuthError) {
            // Displaying the error message if the user is not authenticated
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        }, builder: (context, state) {
          if (state is Loading) {
            // Displaying the loading indicator while the user is signing up
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          }
          if (state is unAuthenticated) {
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
                                              await _authenticateWithEmailAndPassword(
                                                  context);

                                              final snackbar = SnackBar(
                                                content: Text(
                                                  "Successfully LoggedIn!",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackbar);
                                              // var sp = await SharedPreferences
                                              //     .getInstance();
                                              // sp.setBool(
                                              //     MyHomePageState.coachkey,
                                              //     true);

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

  Future<void> _authenticateWithEmailAndPassword(context) async {
    if (formkey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        signInRequested(email.text, password.text, false),
      );
    }
  }
}
