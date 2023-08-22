import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class studentProfile extends StatelessWidget {
  const studentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: CustomScrollView(shrinkWrap: true, slivers: [
        SliverAppBar.large(
          automaticallyImplyLeading: false,
          title: AutoSizeText(
            "Student Review Details",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        SliverList.list(children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: AutoSizeText(
              "Personal Details",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  "Name : ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                AutoSizeText(
                  "[Demo]",
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  "Age : ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                AutoSizeText(
                  "[Demo]",
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  "Gender : ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                AutoSizeText(
                  "[Demo]",
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  "Batch : ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                AutoSizeText(
                  "[Demo]",
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  "Parent : ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                AutoSizeText(
                  "[Demo]",
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  "Level : ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                AutoSizeText(
                  "[Demo]",
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  "Start Date : ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                AutoSizeText(
                  "[Demo]",
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  "End Date : ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                AutoSizeText(
                  "[Demo]",
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  "Fee Amount : ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                AutoSizeText(
                  "[Demo]",
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  "Phone Number : ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                AutoSizeText(
                  "[Demo]",
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: AutoSizeText(
              "Training Details",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ])
      ]),
    );
  }
}
