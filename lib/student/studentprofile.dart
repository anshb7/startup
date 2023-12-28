import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_social_color.dart';
import 'package:startup/student/barchart.dart';
import 'package:startup/student/piechart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class stprofile extends StatefulWidget {
  const stprofile({super.key});

  @override
  State<stprofile> createState() => _stprofileState();
}

class _stprofileState extends State<stprofile> {
  List<rating> chartdata = [
    rating("Forehand", 9),
    rating("Backhand", 8),
    rating("Services", 7),
    rating("Agility", 10),
    rating("Reflexes", 6),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
                        fit: BoxFit.cover)),
              )),
              Positioned(
                  left: 20,
                  top: 50,
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios_new))),
              Positioned(
                  top: MediaQuery.sizeOf(context).height * 0.35,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomScrollView(slivers: [
                          SliverList(
                              delegate: SliverChildListDelegate([
                            Center(
                              child: AutoSizeText(
                                "Ansh Bajaj",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            Center(
                              child: AutoSizeText(
                                "age: 18",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Center(
                              child: AutoSizeText(
                                "session: Morning",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Center(
                              child: AutoSizeText(
                                "gender: Male",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Ratings",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            )
                          ])),
                          SliverGrid.builder(
                              itemCount: 8,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 400,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AutoSizeText("Forehand",
                                              style: TextStyle(
                                                fontFamily: "Nexa",
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        AutoSizeText("7",
                                            style: TextStyle(
                                              fontFamily: "Nexa",
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              })),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Statistics",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: SfCartesianChart(
                                primaryXAxis: CategoryAxis(),
                                // Chart title
                                title: ChartTitle(
                                    text: 'Metrics',
                                    textStyle: TextStyle(color: Colors.white)),
                                // Enable legend

                                // Enable tooltip
                                tooltipBehavior: TooltipBehavior(enable: true),
                                series: <ChartSeries<rating, String>>[
                                  LineSeries<rating, String>(
                                      isVisible: true,
                                      enableTooltip: true,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      dataSource: chartdata,
                                      xValueMapper: (rating sales, _) =>
                                          sales.name,
                                      yValueMapper: (rating sales, _) =>
                                          sales.ratings,

                                      // Enab0le data label
                                      dataLabelSettings:
                                          DataLabelSettings(isVisible: true))
                                ]),
                          ),
                          SliverToBoxAdapter(
                            child: Divider(
                              thickness: 0.1,
                              color: Colors.white,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: barchart(),
                          ),
                          SliverToBoxAdapter(
                            child: Divider(
                              thickness: 0.1,
                              color: Colors.white,
                            ),
                          ),
                          SliverToBoxAdapter(
                              child: Container(
                                  color: Theme.of(context).colorScheme.primary,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: PieChart())),
                        ]),
                      )))
            ],
          )),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class rating {
  String name;
  final double ratings;
  rating(this.name, this.ratings);
}
