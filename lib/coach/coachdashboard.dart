import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:startup/coach/coachfees.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            automaticallyImplyLeading: false,
            title: Text(
              "Hello,Ansh!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          SliverList.builder(
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFListTile(
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
                      "Chandalia",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    subTitle: Text(
                      "20 years old",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    icon: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete_rounded),
                      ),
                    ),
                    description: Column(
                      children: [
                        Text(
                          "Morning: 6-9",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          "Evening: 6-9",
                          style: Theme.of(context).textTheme.headlineMedium,
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.020),
                    margin: EdgeInsets.all(5))),
            itemCount: 6,
          )
        ],
      ),
    );
  }
}
