// ignore_for_file: unused_import

import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:startup/student/stalerts.dart';
import 'package:startup/student/sthome.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:url_launcher/url_launcher.dart';

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
          splashRadius: 20,
          splashSpeedInMilliseconds: 500,
          splashColor: Colors.orange,
          iconSize: 30,
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          backgroundColor: Theme.of(context).colorScheme.primary,
          icons: [Icons.home, Icons.lightbulb_circle, Icons.stars_rounded],
          activeIndex: _bottomNavIndex,

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
  final StreamController<List<YouTubeVideo>> _controller =
      StreamController<List<YouTubeVideo>>();
  static String api_key = "AIzaSyD85dfTsX4od27QmLwiMamPIcPkVFIIYsU";
  List<YouTubeVideo> results = []; //list to store the results
  YoutubeAPI yt = YoutubeAPI(api_key,
      maxResults: 50,
      type:
          "video"); //instantiating object to call api with maximum videos as 6 and type as video
  bool isLoaded =
      false; //this variable lets us to know whether content is loaded or not
  @override
  void initState() {
    super.initState();

    // Fetch data and add it to the stream
    callApi().then((data) {
      _controller.sink.add(data);
    });
  }

  Future<List<YouTubeVideo>> callApi() async {
    return yt.search("Table Tennis Tutorials");
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await callApi();
      },
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Learn",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder(
            stream: _controller.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                    child: Center(child: Text("ERROR FETCHING DATA")));
              } else if (snapshot.hasData) {
                return SliverList.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      String url = snapshot.data![index].url;
                      return GestureDetector(
                        onTap: () async {
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw "COULD NOT LAUNCH THE LINK";
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(62, 62, 66, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Image.network(
                                    snapshot.data![index].thumbnail.medium.url!,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: AutoSizeText(
                                    snapshot.data![index].title,
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        "Duration : ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      AutoSizeText(
                                        snapshot.data![index].duration == null
                                            ? "Duration Unavailable"
                                            : snapshot.data![index].duration!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }));
              } else {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text("No data to show"),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
