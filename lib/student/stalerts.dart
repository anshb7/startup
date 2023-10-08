import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class stalert extends StatefulWidget {
  const stalert({super.key});

  @override
  State<stalert> createState() => _stalertState();
}

class _stalertState extends State<stalert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Notifications",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AutoSizeText(
                        "Total Fees Paid : ",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      AutoSizeText(
                        "50000",
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AutoSizeText(
                        """Total Outstanding 
            Fees : """,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      AutoSizeText(
                        "5000",
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(62, 62, 66, 1),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: AutoSizeText(
              "Reminders",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
        ListView(
          shrinkWrap: true,
          children: [
            GFListTile(
              onLongPress: () {},
              radius: 20,
              subTitle: AutoSizeText(
                "Dues: ₹2000",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              shadow: BoxShadow(
                  color: Colors.white,
                  offset: Offset.infinite,
                  spreadRadius: 50),
              color: Color.fromRGBO(62, 62, 66, 1),
              title: AutoSizeText(
                "Coach Sameer has reminded you to pay your fees!",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            )
          ],
        )
      ]),
    );
  }
}
