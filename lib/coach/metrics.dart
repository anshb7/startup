import 'package:flutter/material.dart';
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
  double _value = -0;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: CustomScrollView(shrinkWrap: true, slivers: [
          SliverAppBar.large(
            automaticallyImplyLeading: false,
            title: Text(
              "Metric addition",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Forehand",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  valueIndicatorColor:
                      Colors.blue, // This is what you are asking for
                  inactiveTrackColor: Color(0xFF8D8E98), // Custom Gray Color
                  activeTrackColor: Colors.white,
                  thumbColor: Colors.red,
                  overlayColor: Color(0x29EB1555), // Custom Thumb overlay Color
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                ),
                child: Slider(
                  inactiveColor: Colors.white,
                  activeColor: Color.fromRGBO(29, 144, 255, 1),
                  min: 0.0,
                  max: 100.0,
                  value: _value,
                  onChanged: (dynamic value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Backhand",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SfSlider(
                inactiveColor: Colors.white,
                activeColor: Color.fromRGBO(29, 144, 255, 1),
                min: 0.0,
                max: 100.0,
                value: _value,
                interval: 20,
                stepSize: 20,
                showTicks: true,
                showLabels: true,
                enableTooltip: true,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Hand Eye Coordination",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SfSlider(
                inactiveColor: Colors.white,
                activeColor: Color.fromRGBO(29, 144, 255, 1),
                min: 0.0,
                max: 100.0,
                value: _value,
                interval: 20,
                stepSize: 20,
                showTicks: true,
                showLabels: true,
                enableTooltip: true,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Flexibility",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SfSlider(
                inactiveColor: Colors.white,
                activeColor: Color.fromRGBO(29, 144, 255, 1),
                min: 0.0,
                max: 100.0,
                value: _value,
                interval: 20,
                stepSize: 20,
                showTicks: true,
                showLabels: true,
                enableTooltip: true,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Speed",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SfSlider(
                inactiveColor: Colors.white,
                activeColor: Color.fromRGBO(29, 144, 255, 1),
                min: 0.0,
                max: 100.0,
                value: _value,
                interval: 20,
                stepSize: 20,
                showTicks: true,
                showLabels: true,
                enableTooltip: true,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Focus",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SfSlider(
                inactiveColor: Colors.white,
                activeColor: Color.fromRGBO(29, 144, 255, 1),
                min: 0.0,
                max: 100.0,
                value: _value,
                interval: 20,
                stepSize: 20,
                showTicks: true,
                showLabels: true,
                enableTooltip: true,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Reflexes",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SfSlider(
                inactiveColor: Colors.white,
                activeColor: Color.fromRGBO(29, 144, 255, 1),
                min: 0.0,
                max: 100.0,
                value: _value,
                interval: 20,
                stepSize: 20,
                showTicks: true,
                showLabels: true,
                enableTooltip: true,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ]),
          )
        ]));
  }
}

class Data {
  late final DateTime x;
  final double? y;
  Data({required this.x, required this.y});
}
