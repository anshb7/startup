// ignore_for_file: deprecated_member_use, unused_import

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup/bloc/auth_bloc.dart';
import 'package:startup/coach/coachfees.dart';
import 'package:startup/main.dart';
import 'package:startup/student/barchart.dart';
import 'package:startup/student/piechart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class cdashboard extends StatefulWidget {
  const cdashboard({super.key});

  @override
  State<cdashboard> createState() => _cdashboardState();
}

class _cdashboardState extends State<cdashboard> {
  var screens = [cdash(), cfees()];
  var _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            Navigator.pushNamed(context, "/studentaddition");
          },
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          iconSize: 30,
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          backgroundColor: Theme.of(context).colorScheme.primary,
          icons: [Icons.home, Icons.money_rounded],
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          //other params
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: screens[_bottomNavIndex]);
  }
}

class cdash extends StatefulWidget {
  const cdash({super.key});

  @override
  State<cdash> createState() => _cdashState();
}

class _cdashState extends State<cdash> {
  List<rating> chartdata = [
    rating("Forehand", 9),
    rating("Backhand", 8),
    rating("Services", 7),
    rating("Agility", 10),
    rating("Reflexes", 6),
  ];
  var academyfuture;
  var coachname;
  var academyfinal;
  @override
  void initState() {
    super.initState();
    // Check the user's authentication status
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
    } else {
      // User is authenticated, continue with other initialization logic
      academyfuture = getacademyname();
      coachname = getcoachname();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationInitialState) {
            Navigator.pushReplacementNamed(context, "/");
          }
          if (state is AuthenticationFailureState) {
            // Displaying the error message if the user is not authenticated
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Not Authenticated")));
          }
        },
        builder: (context, state) {
          if (state is AuthenticationLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () async {
              String academyName = await getacademyname();
              String coachName = await getcoachname();

              setState(() {
                academyfinal = academyName;
                coachname = coachName;
              });
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar.large(
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.logout_rounded,
                          color: Colors.black,
                        ),
                        onPressed: () async {
                          var sp = await SharedPreferences.getInstance();
                          sp.setBool("isLoggedIn", false);
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(SignOut());
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context, true);
                          } else {
                            Navigator.pushReplacementNamed(context, '/');
                          }
                          // Navigator.popUntil(context, (route) => false);
                        },
                      ),
                    )
                  ],
                  automaticallyImplyLeading: false,
                  title: FutureBuilder<String>(
                    future: getcoachname(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      }
                      final coachname = snapshot.data;
                      return Text(
                        "Hello, ${coachname!.substring(0, 1).toUpperCase()}${coachname.substring(1, coachname.length).toLowerCase()}!",
                        style: Theme.of(context).textTheme.titleLarge,
                      );
                    },
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                FutureBuilder<String>(
                    future: academyfuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SliverFillRemaining(
                            child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return SliverFillRemaining(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }
                      final academyfinal = snapshot.data;
                      return StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("Academies")
                              .doc(academyfinal)
                              .collection("Students")
                              .snapshots(),
                          builder: ((context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SliverFillRemaining(
                                  child: CircularProgressIndicator());
                            }
                            final userSnapshot = snapshot.data?.docs;
                            //             var user = FirebaseAuth.instance.currentUser;
                            // var academyName = await FirebaseFirestore.instance
                            //     .collection('Coaches')
                            //     .doc(user!.uid.toString())
                            //     .get();

                            return SliverList(
                                delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return GFListTile(
                                    onTap: () {
                                      showModalBottomSheet(
                                          enableDrag: true,
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(41),
                                                  topRight:
                                                      Radius.circular(41))),
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      (BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  40),
                                                          topRight:
                                                              Radius.circular(
                                                                  40))),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 500,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: CustomScrollView(
                                                      slivers: [
                                                        SliverList(
                                                            delegate:
                                                                SliverChildListDelegate([
                                                          Center(
                                                            child: AutoSizeText(
                                                              "${userSnapshot[index]['name']}",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleSmall,
                                                            ),
                                                          ),
                                                          Center(
                                                            child: AutoSizeText(
                                                              "age:  ${userSnapshot[index]['age']}",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleMedium,
                                                            ),
                                                          ),
                                                          Center(
                                                            child: AutoSizeText(
                                                              "session: ${userSnapshot[index]['session']}",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleMedium,
                                                            ),
                                                          ),
                                                          Center(
                                                            child: AutoSizeText(
                                                              "gender: ${userSnapshot[index]['gender']}",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleMedium,
                                                            ),
                                                          ),
                                                        ])),
                                                        SliverToBoxAdapter(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Text(
                                                                "Statistics",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleSmall,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SliverToBoxAdapter(
                                                          child:
                                                              SfCartesianChart(
                                                                  primaryXAxis:
                                                                      CategoryAxis(),
                                                                  // Chart title
                                                                  title: ChartTitle(
                                                                      text:
                                                                          'Metrics',
                                                                      textStyle: TextStyle(
                                                                          color: Colors
                                                                              .white)),
                                                                  // Enable legend

                                                                  // Enable tooltip
                                                                  tooltipBehavior:
                                                                      TooltipBehavior(
                                                                          enable:
                                                                              true),
                                                                  series: <ChartSeries<
                                                                      rating,
                                                                      String>>[
                                                                LineSeries<
                                                                        rating,
                                                                        String>(
                                                                    isVisible:
                                                                        true,
                                                                    enableTooltip:
                                                                        true,
                                                                    color: Theme
                                                                            .of(
                                                                                context)
                                                                        .colorScheme
                                                                        .secondary,
                                                                    dataSource: [
                                                                      rating(
                                                                          "Forehand",
                                                                          userSnapshot[index]
                                                                              [
                                                                              'forehand']),
                                                                      rating(
                                                                          "Backhand",
                                                                          userSnapshot[index]
                                                                              [
                                                                              'bh']),
                                                                      rating(
                                                                          "Services",
                                                                          userSnapshot[index]
                                                                              [
                                                                              'ser']),
                                                                      rating(
                                                                          "Agility",
                                                                          userSnapshot[index]
                                                                              [
                                                                              'ag']),
                                                                      rating(
                                                                          "Reflexes",
                                                                          userSnapshot[index]
                                                                              [
                                                                              'ref']),
                                                                      rating(
                                                                          "Flexibility",
                                                                          userSnapshot[index]
                                                                              [
                                                                              'fl']),
                                                                      rating(
                                                                          "Stamina",
                                                                          userSnapshot[index]
                                                                              [
                                                                              'st']),
                                                                    ],
                                                                    xValueMapper: (rating
                                                                                sales,
                                                                            _) =>
                                                                        sales
                                                                            .name,
                                                                    yValueMapper: (rating
                                                                                sales,
                                                                            _) =>
                                                                        sales
                                                                            .ratings,

                                                                    // Enab0le data label
                                                                    dataLabelSettings:
                                                                        DataLabelSettings(
                                                                            isVisible:
                                                                                true))
                                                              ]),
                                                        ),
                                                        SliverToBoxAdapter(
                                                          child: Divider(
                                                            thickness: 0.1,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SliverToBoxAdapter(
                                                          child: barchart(),
                                                        ),
                                                        SliverToBoxAdapter(
                                                          child: Divider(
                                                            thickness: 0.1,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SliverToBoxAdapter(
                                                            child: Container(
                                                                color: Theme
                                                                        .of(
                                                                            context)
                                                                    .colorScheme
                                                                    .primary,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.3,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.3,
                                                                child:
                                                                    PieChart())),
                                                      ]),
                                                ));
                                          });
                                    },
                                    radius: 20,
                                    avatar: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80')),
                                    enabled: true,
                                    shadow: BoxShadow(
                                        color: Colors.white,
                                        offset: Offset.infinite,
                                        spreadRadius: 50),
                                    color: Color.fromRGBO(62, 62, 66, 1),
                                    title: Text(
                                      userSnapshot![index]['name'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    subTitle: Text(
                                      "Age: ${userSnapshot[index]['age']}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    icon: Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                        onPressed: () async {
                                          await FirebaseFirestore.instance
                                              .collection("Academies")
                                              .doc(academyfinal)
                                              .collection("Students")
                                              .doc(userSnapshot[index].id)
                                              .delete();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('Item deleted'),
                                          ));
                                        },
                                        icon: Icon(
                                          Icons.delete_rounded,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    description: Column(
                                      children: [
                                        Text(
                                          userSnapshot[index]['session'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.height *
                                            0.020),
                                    margin: EdgeInsets.all(5));
                              },
                              childCount: snapshot.data!.docs.length,
                            ));
                          }));
                    })
              ],
            ),
          );
        },
      ),
    );
  }

  Future<String> getacademyname() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var academyName = await FirebaseFirestore.instance
          .collection('Coaches')
          .doc(user.uid)
          .get();
      var academy = academyName.data()!['academyName'];
      print(academy);
      return academy;
    }
    return ''; // Return a default value or handle the null case as needed
  }

  Future<String> getcoachname() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var academyName = await FirebaseFirestore.instance
          .collection('Coaches')
          .doc(user.uid)
          .get();
      var coach = academyName.data()!['name'];
      print(coach);
      return coach;
    }
    return ''; // Return a default value or handle the null case as needed
  }
}

class rating {
  String name;
  final double ratings;
  rating(this.name, this.ratings);
}
