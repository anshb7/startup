import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class studentaddition extends StatefulWidget {
  const studentaddition({super.key});

  @override
  State<studentaddition> createState() => _studentadditionState();
}

class _studentadditionState extends State<studentaddition> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar.large(
              automaticallyImplyLeading: false,
              title: Text(
                "Add a Student",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              child: AutoSizeText(
                                "Student Registration",
                                style: Theme.of(context).textTheme.titleSmall,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: TextFormField(
                            style: TextStyle(
                                fontFamily: "Nexa", color: Colors.white),
                            autocorrect: true,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: "Nexa", color: Colors.white),
                                labelText: " Enter Name ",
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 2,
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  gapPadding: 2,
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 8,
                                        color:
                                            Colors.greenAccent), //<-- SEE HERE

                                    gapPadding: 2,
                                    borderRadius: BorderRadius.circular(20))),
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
                                //rpassword.text = newValue.toString();
                              });
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: "Nexa", color: Colors.white),
                                autocorrect: true,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      fontFamily: "Nexa", color: Colors.white),
                                  labelText: "Age",
                                  focusColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    gapPadding: 2,
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    gapPadding: 2,
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.white),
                                  ),
                                ),
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
                                    //rpassword.text = newValue.toString();
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: "Nexa", color: Colors.white),
                                autocorrect: true,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      fontFamily: "Nexa", color: Colors.white),
                                  labelText: "Age",
                                  focusColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    gapPadding: 2,
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    gapPadding: 2,
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.white),
                                  ),
                                ),
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
                                    //rpassword.text = newValue.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       vertical: 5, horizontal: 30),
                        //   child: TextFormField(
                        //     style: TextStyle(
                        //         fontFamily: "Nexa", color: Colors.white),
                        //     autocorrect: true,
                        //     decoration: InputDecoration(
                        //         labelStyle: TextStyle(
                        //             fontFamily: "Nexa", color: Colors.white),
                        //         labelText: " Re Enter password ",
                        //         focusColor: Colors.white,
                        //         focusedBorder: OutlineInputBorder(
                        //           gapPadding: 2,
                        //           borderRadius: BorderRadius.circular(20),
                        //           borderSide:
                        //               BorderSide(width: 2, color: Colors.white),
                        //         ),
                        //         enabledBorder: OutlineInputBorder(
                        //           gapPadding: 2,
                        //           borderRadius: BorderRadius.circular(20),
                        //           borderSide:
                        //               BorderSide(width: 2, color: Colors.white),
                        //         ),
                        //         border: OutlineInputBorder(
                        //             borderSide: BorderSide(
                        //                 width: 8,
                        //                 color:
                        //                     Colors.greenAccent), //<-- SEE HERE

                        //             gapPadding: 2,
                        //             borderRadius: BorderRadius.circular(20))),
                        //     textInputAction: TextInputAction.next,
                        //     validator: (value) {
                        //       if (value?.isEmpty == true) {
                        //         return "Input can't be null";
                        //         // } else if (value. != password.text) {
                        //         //   return 'Passwords do not match';
                        //       } else {
                        //         return null;
                        //       }
                        //     },
                        //     onSaved: (newValue) {
                        //       setState(() {
                        //         //rpassword.text = newValue.toString();
                        //       });
                        //     },
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: TextFormField(
                            style: TextStyle(
                                fontFamily: "Nexa", color: Colors.white),
                            autocorrect: true,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: "Nexa", color: Colors.white),
                                labelText: " Select Batch ",
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 2,
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  gapPadding: 2,
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 8,
                                        color:
                                            Colors.greenAccent), //<-- SEE HERE

                                    gapPadding: 2,
                                    borderRadius: BorderRadius.circular(20))),
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
                                //rpassword.text = newValue.toString();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: TextFormField(
                            style: TextStyle(
                                fontFamily: "Nexa", color: Colors.white),
                            autocorrect: true,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: "Nexa", color: Colors.white),
                                labelText: " Contact Number ",
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 2,
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  gapPadding: 2,
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 8,
                                        color:
                                            Colors.greenAccent), //<-- SEE HERE

                                    gapPadding: 2,
                                    borderRadius: BorderRadius.circular(20))),
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
                                //rpassword.text = newValue.toString();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: TextFormField(
                            style: TextStyle(
                                fontFamily: "Nexa", color: Colors.white),
                            autocorrect: true,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: "Nexa", color: Colors.white),
                                labelText: " Parent's Name ",
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 2,
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  gapPadding: 2,
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 8,
                                        color:
                                            Colors.greenAccent), //<-- SEE HERE

                                    gapPadding: 2,
                                    borderRadius: BorderRadius.circular(20))),
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
                                //rpassword.text = newValue.toString();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: TextFormField(
                            style: TextStyle(
                                fontFamily: "Nexa", color: Colors.white),
                            autocorrect: true,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: "Nexa", color: Colors.white),
                                labelText: " Parent's Number ",
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 2,
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  gapPadding: 2,
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 8,
                                        color:
                                            Colors.greenAccent), //<-- SEE HERE

                                    gapPadding: 2,
                                    borderRadius: BorderRadius.circular(20))),
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
                                //rpassword.text = newValue.toString();
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
                                color: Color.fromRGBO(29, 144, 255, 1),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.5,
                                onPressed: () async {
                                  // final isValid =
                                  //     formkey.currentState?.validate();
                                  // if (isValid!) {
                                  //   formkey.currentState?.save();

                                  //   try {
                                  //     await _signupWithEmailAndPassword(
                                  //         context);
                                  //     // createuser();
                                  //     final snackbar = SnackBar(
                                  //       content: Text(
                                  //         "Successfully Added!",
                                  //         style: TextStyle(
                                  //             fontSize: 15,
                                  //             color: Colors.white),
                                  //       ),
                                  //     );
                                  //     ScaffoldMessenger.of(context)
                                  //         .showSnackBar(snackbar);
                                  //     // Navigator.push(
                                  //     //     context,
                                  //     //     MaterialPageRoute(
                                  //     //         builder: ((context) =>
                                  //     //             coachDashboard())));
                                  //   } catch (e) {
                                  //     print(e);
                                  //   }
                                  // }
                                },
                                child: Text("Submit! ",
                                    style:
                                        Theme.of(context).textTheme.labelSmall),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ]))
          ],
        ));
  }
}
