// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:ffi';

import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nanoid/async.dart';
import 'package:startup/coach/metrics.dart';
import 'package:string_validator/string_validator.dart';

List<String> listt = <String>['M', 'F'];
List<String> batch = <String>['Morning', 'Evening'];

class studentaddition extends StatefulWidget {
  const studentaddition({super.key});

  @override
  State<studentaddition> createState() => _studentadditionState();
}

class _studentadditionState extends State<studentaddition> {
  final user = FirebaseAuth.instance.currentUser;
  String dropdownValue = listt.first;
  var dropdownbatchValue = batch.first;
  TextEditingController gendercontroller = new TextEditingController();
  TextEditingController sessioncontroller = new TextEditingController();
  var academy = '';
  String name = "";
  double age = 0;
  String gender = '';
  String session = '';
  String parentname = "";
  double ppNo = 0;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
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
                    child: Column(
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
                            showCursor: true,
                            cursorColor: Colors.white,
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
                                name = newValue.toString();
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
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: TextFormField(
                                  showCursor: true,
                                  cursorColor: Colors.white,
                                  style: TextStyle(
                                      fontFamily: "Nexa", color: Colors.white),
                                  autocorrect: true,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        fontFamily: "Nexa",
                                        color: Colors.white),
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
                                      age = double.parse(newValue.toString());
                                      //rpassword.text = newValue.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.26,
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.19,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      borderRadius: BorderRadius.circular(20),
                                      value: dropdownValue,
                                      dropdownColor: Colors.black,
                                      icon: Icon(Icons.arrow_downward),
                                      elevation: 16,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Nexa",
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          dropdownValue = value!;
                                          gendercontroller.text = dropdownValue;
                                        });
                                      },
                                      items: listt
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    style: BorderStyle.solid,
                                    width: 2),
                                borderRadius: BorderRadius.circular(20)),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.19,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    borderRadius: BorderRadius.circular(20),
                                    value: dropdownbatchValue,
                                    dropdownColor: Colors.black,
                                    icon: Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Nexa",
                                    ),
                                    onChanged: (String? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        dropdownbatchValue = value!;
                                        sessioncontroller.text =
                                            dropdownbatchValue;
                                      });
                                    },
                                    items: batch.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: TextFormField(
                            showCursor: true,
                            cursorColor: Colors.white,
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
                                parentname = newValue.toString();
                                //rpassword.text = newValue.toString();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: TextFormField(
                            showCursor: true,
                            cursorColor: Colors.white,
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
                                ppNo = double.parse(newValue.toString());
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
                                color: Theme.of(context).colorScheme.secondary,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.5,
                                onPressed: () async {
                                  formkey.currentState?.save();

                                  if (formkey.currentState!.validate()) {
                                    var academyName = await FirebaseFirestore
                                        .instance
                                        .collection('Coaches')
                                        .doc(user!.uid.toString())
                                        .get();
                                    if (academyName.exists) {
                                      setState(() {
                                        academy =
                                            academyName.data()!['academyName'];
                                        print(academy);
                                      });
                                    }
                                    print(academy);
                                    print(name);
                                    print(gendercontroller.text);
                                    print(parentname);
                                    print(ppNo);
                                    print(sessioncontroller.text);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                metricaddition(
                                                    academyId: academy,
                                                    name: name,
                                                    age: age,
                                                    gender:
                                                        gendercontroller.text,
                                                    parentname: parentname,
                                                    ppNo: ppNo,
                                                    session: sessioncontroller
                                                        .text)));
                                  }
                                },
                                child: Text("Let's Go! ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
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
