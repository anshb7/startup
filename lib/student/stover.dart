// ignore_for_file: unused_import

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:startup/student/stalerts.dart';
import 'package:startup/student/sthome.dart';

class sthomepage extends StatefulWidget {
  const sthomepage({super.key});

  @override
  State<sthomepage> createState() => _sthomepageState();
}

class _sthomepageState extends State<sthomepage> {
  int _bottomNavIndex = 0;
  var screens = [sthome(), stanalytics(), stalert()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: AnimatedBottomNavigationBar(
          iconSize: 30,
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          backgroundColor: Theme.of(context).colorScheme.primary,
          icons: [Icons.home, Icons.analytics, Icons.notifications],
          activeIndex: _bottomNavIndex,

          notchSmoothness: NotchSmoothness.verySmoothEdge,
          gapLocation: GapLocation.none,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          //other params
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: screens[_bottomNavIndex]);
  }
}

class stanalytics extends StatefulWidget {
  const stanalytics({super.key});

  @override
  State<stanalytics> createState() => _stanalyticsState();
}

class _stanalyticsState extends State<stanalytics> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Overview",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(62, 62, 66, 1),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "This week",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(62, 62, 66, 1),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Targets",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(62, 62, 66, 1),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Recommended Playlists",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(62, 62, 66, 1),
                  borderRadius: BorderRadius.circular(20)),
            ),
          )
        ]))
      ],
    );
  }
}
