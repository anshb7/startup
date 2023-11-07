// ignore_for_file: deprecated_member_use, unused_import

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is unAuthenticated) {
            Navigator.pushReplacementNamed(context, "/");
          }
          if (state is AuthError) {
            // Displaying the error message if the user is not authenticated
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is Loading) {
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
                          sp.setBool(MyHomePageState.coachkey, false);
                          BlocProvider.of<AuthBloc>(context)
                              .add(SignOutRequested());
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
                        "Hello, $coachname!",
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
