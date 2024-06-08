import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup/bloc/auth_bloc.dart';
import 'package:startup/main.dart';
import 'package:string_validator/string_validator.dart';

class sthome extends StatefulWidget {
  const sthome({super.key});

  @override
  State<sthome> createState() => _sthomeState();
}

String age = "";
String name = "";
String gender = "";
String session = "";

List<String> attributes = [
  "Forehand",
  "Backhand",
  "Agility",
  "Reflexes",
  "Services",
  "Flexibility"
];

class _sthomeState extends State<sthome> {
  List<String> ratings = ["forehand", "bh", "ag", "ref", "ser", "fl"];
  late double rewP = 0;
  @override
  void initState() {
    getProfileDetails();
    calRewardPoints();
    setState(() {});
    super.initState();
  }

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationInitialState) {
            Navigator.popUntil(context, (route) => true);
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                      icon: Icon(Icons.logout_sharp),
                      onPressed: () async {
                        // var sp = await SharedPreferences.getInstance();
                        // sp.setBool("isLoggedIn", false);
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(SignOut());
                        Navigator.popUntil(context, ModalRoute.withName("/"));
                      }),
                ],
                title: Text(
                  "Hello!",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Profile Details",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Name: ${name} ",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              Text(
                                "Gender: ${gender}",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              Text(
                                "Age: ${age} ",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              Text(
                                "Session: ${session}",
                                style: Theme.of(context).textTheme.labelSmall,
                              )
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg"))),
                          )
                        ],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(62, 62, 66, 1),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Player Statistics",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("AllStudents")
                        .where("ppNo",
                            isEqualTo:
                                toDouble(user!.phoneNumber!.substring(3, 13)))
                        .snapshots(),
                    builder: (context, snapshot) {
                      final data;
                      if (snapshot.hasData) {
                        data = snapshot.data!.docs;
                        return GridView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 6,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1, crossAxisCount: 3),
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridTile(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(62, 62, 66, 1),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AutoSizeText(attributes[index],
                                              style: TextStyle(
                                                fontFamily: "Nexa",
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        AutoSizeText(
                                            data[0][ratings[index]].toString(),
                                            style: TextStyle(
                                              fontFamily: "Nexa",
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }));
                      } else {
                        return Center(child: Text("Data has error"));
                      }
                    }),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Total Reward Points",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${rewP.toInt().toString()}",
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: "Nexa",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(62, 62, 66, 1),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ]))
            ],
          );
        },
      ),
    );
  }

  Future<void> getProfileDetails() async {
    final uPhno = user!.phoneNumber;
    print(uPhno!.substring(3, 13));
    await FirebaseFirestore.instance
        .collection("AllStudents")
        .where("ppNo", isEqualTo: toDouble(uPhno.substring(3, 13)))
        .get()
        .then((value) {
      value.docs.forEach((element) {
        age = element.data()["age"].toString();
        gender = element.data()["gender"].toString();
        session = element.data()["session"].toString();
        name = element.data()["name"].toString();
      });
    });
    setState(() {});
  }

  Future<void> calRewardPoints() async {
    final uPhno = user!.phoneNumber;
    double c = 0;
    await FirebaseFirestore.instance
        .collection("Rewards")
        .doc(uPhno.toString())
        .collection("Submissions")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        c += element.data()["rewardPoints"];
      });
    });
    rewP = c;
  }
}
