import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup/bloc/auth_bloc.dart';
import 'package:startup/student/sthome.dart';
import 'package:startup/student/stover.dart';
import 'package:startup/widgets/otpbox.dart';
import 'package:string_validator/string_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class otpScreen extends StatefulWidget {
  final String phoneNo;
  const otpScreen({super.key, required this.phoneNo});

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  String smsCode = "";
  final _formKey = GlobalKey<FormState>();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSuccessState) {
            Fluttertoast.showToast(
              msg: "User Added",
              toastLength: Toast
                  .LENGTH_SHORT, // Duration for which the toast should be visible
              gravity:
                  ToastGravity.BOTTOM, // Toast position (TOP, BOTTOM, CENTER)
              backgroundColor: Colors.black
                  .withOpacity(0.8), // Background color of the toast
              textColor: Colors.white, // Text color of the toast message
              fontSize: 16.0, // Font size of the toast message
            );

            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => sthomepage()));
          }
        },
        builder: (context, state) {
          if (state is AuthenticationLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Verification Code",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    AutoSizeText(
                      "We have sent the verification code to ${widget.phoneNo}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: 68,
                                width: MediaQuery.of(context).size.width * 0.11,
                                child: TextFormField(
                                  validator: (value) {
                                    if (!isInt(value.toString())) {
                                      return "Please write a valid number";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onSaved: (value) {
                                    smsCode += value.toString();
                                  },
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: 68,
                                width: MediaQuery.of(context).size.width * 0.11,
                                child: TextFormField(
                                  validator: (value) {
                                    if (!isInt(value.toString())) {
                                      return "Please write a valid number";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onSaved: (value) {
                                    smsCode += value.toString();
                                  },
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: 68,
                                width: MediaQuery.of(context).size.width * 0.11,
                                child: TextFormField(
                                  validator: (value) {
                                    if (!isInt(value.toString())) {
                                      return "Please write a valid number";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onSaved: (value) {
                                    smsCode += value.toString();
                                  },
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: 68,
                                width: MediaQuery.of(context).size.width * 0.11,
                                child: TextFormField(
                                  validator: (value) {
                                    if (!isInt(value.toString())) {
                                      return "Please write a valid number";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onSaved: (value) {
                                    smsCode += value.toString();
                                  },
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: 68,
                                width: MediaQuery.of(context).size.width * 0.11,
                                child: TextFormField(
                                  validator: (value) {
                                    try {
                                      if (!isInt(value.toString())) {
                                        return "Please write a valid number";
                                      }
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onSaved: (value) {
                                    smsCode += value.toString();
                                  },
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: 68,
                                width: MediaQuery.of(context).size.width * 0.11,
                                child: TextFormField(
                                  validator: (value) {
                                    if (!isInt(value.toString())) {
                                      return "Please write a valid number";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black))),
                                  onSaved: (value) {
                                    smsCode += value.toString();
                                  },
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.5,
                            onPressed: () async {
                              print(smsCode);
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(signInwithPhone(smsCode));
                              }
                            },
                            child: Text("Submit! ",
                                style: Theme.of(context).textTheme.labelSmall),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
