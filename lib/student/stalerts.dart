import 'package:animated_button/animated_button.dart';
import 'package:async/async.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:startup/bloc/uploadvideobloc/bloc/upload_video_bloc.dart';

// ignore: camel_case_types
class stalert extends StatefulWidget {
  const stalert({super.key});

  @override
  State<stalert> createState() => _stalertState();
}

class _stalertState extends State<stalert> with SingleTickerProviderStateMixin {
  User? user = FirebaseAuth.instance.currentUser;
  late AsyncMemoizer _memoizer;
  String medQ = "";
  String easyQ = "";
  String hardQ = "";
  var _db = FirebaseFirestore.instance;

  Future<void> getQuestion() async {
    return this._memoizer.runOnce(() async {
      await _db
          .collection("Challenges")
          .doc("01.05.2024")
          .collection("Medium")
          .doc("MedQ")
          .get()
          .then((value) {
        value.data()?.forEach((key, value) {
          medQ = value.toString();
        });
      });
      await _db
          .collection("Challenges")
          .doc("01.05.2024")
          .collection("Easy")
          .doc("EasyQ")
          .get()
          .then((value) {
        value.data()?.forEach((key, value) {
          easyQ = value.toString();
        });
      });
      await _db
          .collection("Challenges")
          .doc("01.05.2024")
          .collection("Hard")
          .doc("HardQ")
          .get()
          .then((value) {
        value.data()?.forEach((key, value) {
          hardQ = value.toString();
        });
      });
    });
  }

  late TabController _tabController;
  late final future;
  @override
  void initState() {
    _memoizer = AsyncMemoizer();
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocConsumer<UploadVideoBloc, UploadVideoState>(
        listener: (context, state) {
          if (state is uploadVideoFailure) {
            Fluttertoast.showToast(msg: "Upload failed.Please Retry!");
          }
        },
        builder: (context, state) {
          if (state is UploadVideoLoading) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
              ),
            );
          }
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      "Weekly Challenge",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  TabBar(
                    dividerColor: Colors.transparent,
                    automaticIndicatorColorAdjustment: true,
                    controller: _tabController,
                    indicatorColor: Theme.of(context).colorScheme.secondary,
                    tabs: [
                      Tab(
                        child: Text(
                          "Easy",
                          style: TextStyle(
                            fontFamily: "Nexa",
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Medium",
                          style: TextStyle(
                            fontFamily: "Nexa",
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Hard",
                          style: TextStyle(
                            fontFamily: "Nexa",
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: getQuestion(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                          );
                        }
                        return TabBarView(
                            controller: _tabController,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      " Q. ${easyQ}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.1,
                                    ),
                                    AutoSizeText(
                                      "Record the video and submit!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    AnimatedButton(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        onPressed: () async {
                                          final pickedFile = await ImagePicker()
                                              .pickVideo(
                                                  source: ImageSource.camera);
                                          XFile? xfilepicked = pickedFile;
                                          if (xfilepicked != null) {
                                            BlocProvider.of<UploadVideoBloc>(
                                                    context)
                                                .add(uploadVideo(
                                                    xfilepicked.path,
                                                    user!.phoneNumber
                                                        .toString()));
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "Nothing is selected");
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AutoSizeText(
                                            "Do a Submission through camera!",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: AnimatedButton(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          onPressed: () async {
                                            final pickedFile =
                                                await ImagePicker().pickVideo(
                                                    source:
                                                        ImageSource.gallery);
                                            XFile? xfilepicked = pickedFile;
                                            if (xfilepicked != null) {
                                              BlocProvider.of<UploadVideoBloc>(
                                                      context)
                                                  .add(uploadVideo(
                                                      xfilepicked.path,
                                                      user!.phoneNumber
                                                          .toString()));
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "Nothing is selected");
                                            }
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: AutoSizeText(
                                              "Do a Submission through gallery!",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      " Q. ${medQ}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AutoSizeText(
                                        "Record the video and submit!",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ),
                                    AnimatedButton(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        onPressed: () async {
                                          final pickedFile = await ImagePicker()
                                              .pickVideo(
                                                  source: ImageSource.camera);
                                          XFile? xfilepicked = pickedFile;
                                          if (xfilepicked != null) {
                                            BlocProvider.of<UploadVideoBloc>(
                                                    context)
                                                .add(uploadVideo(
                                                    xfilepicked.path,
                                                    user!.phoneNumber
                                                        .toString()));
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "Nothing is selected");
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AutoSizeText(
                                            "Do a Submission through camera!",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                        )),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: AnimatedButton(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          onPressed: () async {
                                            final pickedFile =
                                                await ImagePicker().pickVideo(
                                                    source:
                                                        ImageSource.gallery);
                                            XFile? xfilepicked = pickedFile;
                                            if (xfilepicked != null) {
                                              BlocProvider.of<UploadVideoBloc>(
                                                      context)
                                                  .add(uploadVideo(
                                                      xfilepicked.path,
                                                      user!.phoneNumber
                                                          .toString()));
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "Nothing is selected");
                                            }
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: AutoSizeText(
                                              "Do a Submission through gallery!",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      " Q. ${hardQ}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.1,
                                    ),
                                    AutoSizeText(
                                      "Record the video and submit!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    AnimatedButton(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        onPressed: () async {
                                          final pickedFile = await ImagePicker()
                                              .pickVideo(
                                                  source: ImageSource.camera);
                                          XFile? xfilepicked = pickedFile;
                                          if (xfilepicked != null) {
                                            BlocProvider.of<UploadVideoBloc>(
                                                    context)
                                                .add(uploadVideo(
                                                    xfilepicked.path,
                                                    user!.phoneNumber
                                                        .toString()));
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "Nothing is selected");
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AutoSizeText(
                                            "Do a Submission through camera!",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: AnimatedButton(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          onPressed: () async {
                                            final pickedFile =
                                                await ImagePicker().pickVideo(
                                                    source:
                                                        ImageSource.gallery);
                                            XFile? xfilepicked = pickedFile;
                                            if (xfilepicked != null) {
                                              BlocProvider.of<UploadVideoBloc>(
                                                      context)
                                                  .add(uploadVideo(
                                                      xfilepicked.path,
                                                      user!.phoneNumber
                                                          .toString()));
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Thanks for submitting,you may go back now.We'll send your reward as soon as possible!");
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "Nothing is selected");
                                            }
                                          },
                                          child: AutoSizeText(
                                            "Do a Submission through a gallery!",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
