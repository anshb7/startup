// ignore_for_file: unused_import

import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart' hide LabelPlacement;
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class metricaddition extends StatefulWidget {
  const metricaddition({super.key});

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
        body: Column(
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
                              label: imp[metrics[index]]!.toDouble().toString(),
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
                onPressed: () {
                  //Navigator.pushNamed(context, '/')
                },
                child: AutoSizeText(
                  "Submit!",
                  style: Theme.of(context).textTheme.headlineSmall,
                ))
          ],
        ));
  }
}
