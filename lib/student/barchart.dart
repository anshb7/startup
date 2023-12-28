/// Package imports
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

class barchart extends StatefulWidget {
  const barchart({super.key});

  @override
  State<barchart> createState() => _barchartState();
}

class _barchartState extends State<barchart> {
  List<ChartData>? chartData;
  @override
  void initState() {
    chartData = <ChartData>[
      ChartData(
        x: 'Yashansh',
        y: 10,
        secondSeriesYValue: 5,
      ),
      ChartData(
        x: 'Aditya',
        y: 4,
        secondSeriesYValue: 7,
      ),
      ChartData(
        x: 'Shreyaans',
        y: 7,
        secondSeriesYValue: 3,
      ),
      ChartData(
        x: 'Sarthak',
        y: 9,
        secondSeriesYValue: 9,
      ),
      ChartData(
        x: 'Payas',
        y: 6,
        secondSeriesYValue: 10,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Match Statistics', textStyle: TextStyle(color: Colors.white)),
      legend:
          Legend(isVisible: true, textStyle: TextStyle(color: Colors.white)),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          numberFormat: NumberFormat.compact()),
      series: _getDefaultBarSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<BarSeries<ChartData, String>> _getDefaultBarSeries() {
    return <BarSeries<ChartData, String>>[
      BarSeries<ChartData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartData sales, _) => sales.x as String,
          yValueMapper: (ChartData sales, _) => sales.y,
          name: 'WIN'),
      BarSeries<ChartData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartData sales, _) => sales.x as String,
          yValueMapper: (ChartData sales, _) => sales.secondSeriesYValue,
          name: 'LOSS'),
    ];
  }
}

class ChartData {
  String x = '';
  double y = 0;
  double? secondSeriesYValue;
  ChartData({
    required this.x,
    required this.y,
    required this.secondSeriesYValue,
  });
}
