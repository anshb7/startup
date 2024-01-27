// ignore_for_file: unused_import

import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:intl/intl.dart';
import 'package:nanoid/non_secure.dart';
import 'package:startup/animation.dart';
import 'package:startup/bloc/bloc/stadd_bloc.dart';
import 'package:startup/coach/coachdashboard.dart';
import 'package:startup/models/student.dart';
import 'package:syncfusion_flutter_charts/charts.dart' hide LabelPlacement;
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

// ignore: must_be_immutable
class metricaddition extends StatefulWidget {
  String academyId = '';
  String name = "";
  double age = 0;
  String gender = '';
  String session = '';
  String parentname = "";
  double ppNo = 0;
  metricaddition(
      {super.key,
      required this.academyId,
      required this.name,
      required this.age,
      required this.gender,
      required this.parentname,
      required this.ppNo,
      required this.session});

  @override
  State<metricaddition> createState() => _metricadditionState();
}

class _metricadditionState extends State<metricaddition> {
  double _value = 0;
  final formkey = GlobalKey<FormState>();
  List<String> metrics = [
    "Forehand",
    "Backhand",
    "Agility",
    "Flexibility",
    "Services",
    "Stamina",
    "Reflexes"
  ];
  List<double> values = [0, 0, 0, 0, 0, 0, 0];
  Map<String, double> imp = {
    "Forehand": 0,
    "Backhand": 0,
    "Agility": 0,
    "Flexibility": 0,
    "Services": 0,
    "Stamina": 0,
    "Reflexes": 0
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(
            "Metric Addition",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: BlocConsumer<StaddBloc, StaddState>(
          listener: (context, state) {
            if (state is sentstdata) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => tick(),
                  ));
            } else if (state is DatabaseError) {
              showDialog(
                  context: context,
                  builder: (context) => Center(
                        child: Text('Database Error'),
                      ));
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(6),
                            height: MediaQuery.of(context).size.height * 0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(62, 62, 66, 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  metrics[index],
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Slider(
                                  divisions: 10,
                                  activeColor:
                                      Theme.of(context).colorScheme.primary,
                                  min: 0.0,
                                  max: 10,
                                  value: imp[metrics[index]]!.toDouble(),
                                  label: imp[metrics[index]]!
                                      .toDouble()
                                      .toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      imp[metrics[index]] = value;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        )),
                    itemCount: 7,
                  ),
                ),
                AnimatedButton(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: () async {
                      String sID = '${widget.name}' + nanoid(10).toString();
                      try {
                        // await FirebaseFirestore.instance
                        //     .collection("Academies")
                        //     .doc(widget.academyId)
                        //     .collection("Students")
                        //     .doc(sID)
                        //     .set(studentInfo(
                        //             academyId: '${widget.academyId}',
                        //             name: '${widget.name}',
                        //             age: widget.age,
                        //             gender: widget.gender,
                        //             session: widget.session,
                        //             parentname: widget.parentname,
                        //             ppNo: widget.ppNo,
                        //             fh: imp['Forehand']!,
                        //             bh: imp['Backhand']!,
                        //             ag: imp['Agility']!,
                        //             fl: imp['Flexibility']!,
                        //             ser: imp['Services']!,
                        //             st: imp['Stamina']!,
                        //             ref: imp['Reflexes']!)
                        //         .toJson());
                        await _sendstudentdatatoacaddemies(
                            context, sID, widget.academyId);
                        await _sendstudentdata(context, sID);
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: AutoSizeText(
                      "Submit!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ))
              ],
            );
          },
        ));
  }

  Future<void> _sendstudentdata(context, String uiid) async {
    BlocProvider.of<StaddBloc>(context).add(sendstdata(
        academyId: '${widget.academyId}',
        name: '${widget.name}',
        age: widget.age,
        gender: widget.gender,
        session: widget.session,
        parentname: widget.parentname,
        ppNo: widget.ppNo,
        fh: imp['Forehand']!,
        bh: imp['Backhand']!,
        ag: imp['Agility']!,
        fl: imp['Flexibility']!,
        ser: imp['Services']!,
        st: imp['Stamina']!,
        ref: imp['Reflexes']!,
        userToken: "",
        uid: uiid));
  }

  Future<void> _sendstudentdatatoacaddemies(
      context, String uiid, String aid) async {
    BlocProvider.of<StaddBloc>(context).add(sendstdata(
      academyId: '${widget.academyId}',
      name: '${widget.name}',
      age: widget.age,
      gender: widget.gender,
      session: widget.session,
      parentname: widget.parentname,
      ppNo: widget.ppNo,
      fh: imp['Forehand']!,
      bh: imp['Backhand']!,
      ag: imp['Agility']!,
      fl: imp['Flexibility']!,
      ser: imp['Services']!,
      st: imp['Stamina']!,
      ref: imp['Reflexes']!,
      userToken: "",
      uid: uiid,
    ));
  }
}
