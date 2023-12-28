import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  const PieChart({super.key});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  @override
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Win %', 47),
      ChartData('Loss %', 53),
    ];
    return Scaffold(
        body: Center(
            child: Container(
                color: Theme.of(context).colorScheme.primary,
                child: SfCircularChart(
                    legend: Legend(
                        isVisible: true,
                        textStyle: TextStyle(color: Colors.white)),
                    title: ChartTitle(
                        text: "Win/Loss Percentage",
                        textStyle: TextStyle(color: Colors.white)),
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartData, String>(
                          name: "WIN/LOSS Percentage",
                          dataSource: chartData,
                          dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              // Avoid labels intersection
                              labelIntersectAction: LabelIntersectAction.shift,
                              labelPosition: ChartDataLabelPosition.outside,
                              connectorLineSettings: ConnectorLineSettings(
                                  type: ConnectorType.curve, length: '25%')),
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y)
                    ]))));
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
