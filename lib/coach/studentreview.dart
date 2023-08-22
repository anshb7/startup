import 'package:animated_button/animated_button.dart';
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
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Forehand",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                LinearProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                  value: 0.5,
                  minHeight: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Backhand",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                LinearProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                  value: 0.5,
                  minHeight: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Hand-Eye Coordination",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                LinearProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                  value: 0.5,
                  minHeight: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Flexibility",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                LinearProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                  value: 0.5,
                  minHeight: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Speed",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                LinearProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                  value: 0.5,
                  minHeight: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Focus",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                LinearProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                  value: 0.5,
                  minHeight: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Reflexes",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                LinearProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                  value: 0.5,
                  minHeight: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: AnimatedButton(
                color: Color.fromRGBO(29, 144, 255, 1),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.5,
                onPressed: () {
                  // final isValid =
                  //     formkey.currentState?.validate();
                  // if (isValid!) {
                  //   formkey.currentState?.save();

                  //   try {
                  //     await _signupWithEmailAndPassword(
                  //         context);
                  //     // createuser();
                  //     final snackbar = SnackBar(
                  //       content: Text(
                  //         "Successfully Added!",
                  //         style: TextStyle(
                  //             fontSize: 15,
                  //             color: Colors.white),
                  //       ),
                  //     );
                  //     ScaffoldMessenger.of(context)
                  //         .showSnackBar(snackbar);
                  //     // Navigator.push(
                  //     //     context,
                  //     //     MaterialPageRoute(
                  //     //         builder: ((context) =>
                  //     //             coachDashboard())));
                  //   } catch (e) {
                  //     print(e);
                  //   }
                  // }
                },
                child: AutoSizeText("Publish!",
                    style: Theme.of(context).textTheme.labelSmall),
              ),
            ),
          ),
        ])
      ]),
    );
  }
}
