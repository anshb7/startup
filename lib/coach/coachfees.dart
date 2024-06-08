import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class cfees extends StatefulWidget {
  const cfees({super.key});

  @override
  State<cfees> createState() => _cfeesState();
}

class _cfeesState extends State<cfees> {
  Future<String> getacademyname() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var academyName = await FirebaseFirestore.instance
          .collection('Coaches')
          .doc(user.uid)
          .get();
      var academy = academyName.data()!['academyName'];
      print(academy);
      return academy;
    }
    return ''; // Return a default value or handle the null case as needed
  }

  @override
  User? userr = FirebaseAuth.instance.currentUser;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      "Dues",
                      style: TextStyle(
                        fontFamily: "Nexa",
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Paid",
                      style: TextStyle(
                        fontFamily: "Nexa",
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              title: Text(
                "Payments",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: TabBarView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                                  "Lifetime Revenue :",
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
                                  "Monthly Revenue : ",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                AutoSizeText(
                                  "9000",
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
                    child: Center(
                      child: AutoSizeText(
                        "This feature will be available soon!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  )

                  // Expanded(
                  //   child: StreamBuilder<QuerySnapshot>(
                  //       stream: FirebaseFirestore.instance
                  //           .collection("Coaches")
                  //           .doc(userr!.uid.toString())
                  //           .collection("payments")
                  //           .where("isDue", isEqualTo: 1)
                  //           .snapshots(),
                  //       builder: (context, snapshot) {
                  //         if (snapshot.connectionState ==
                  //             ConnectionState.waiting) {
                  //           return Center(child: CircularProgressIndicator());
                  //         } else if (!snapshot.hasData) {
                  //           return Center(
                  //             child: Text(
                  //               "No dues to show!",
                  //               style: Theme.of(context).textTheme.labelSmall,
                  //             ),
                  //           );
                  //         } else {
                  //           final userdata = snapshot.data!.docs;
                  //           return ListView.builder(
                  //             itemBuilder: (context, index) {
                  //               return Container(
                  //                 margin: const EdgeInsets.only(top: 8),
                  //                 padding: const EdgeInsets.symmetric(
                  //                     horizontal: 14),
                  //                 height: 100,
                  //                 color: Colors.amber,
                  //               );
                  //             },
                  //             itemCount: userdata.length,
                  //           );
                  //         }
                  //       }),
                  // ),
                ],
              ),
              Column(
                children: [
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
                                  "Lifetime Revenue :",
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
                                  "Monthly Revenue : ",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                AutoSizeText(
                                  "9000",
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
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: SearchAnchor(builder:
                  //       (BuildContext context, SearchController controller) {
                  //     return SearchBar(
                  //       controller: _controller,
                  //       padding: const MaterialStatePropertyAll<EdgeInsets>(
                  //           EdgeInsets.symmetric(horizontal: 16.0)),
                  //       onTap: () {
                  //         controller.openView();
                  //       },
                  //       onChanged: (_) {
                  //         controller.openView();
                  //       },
                  //       leading: const Icon(Icons.search),
                  //     );
                  //   }, suggestionsBuilder:
                  //       (BuildContext context, SearchController controller) {
                  //     return List<ListTile>.generate(5, (int index) {
                  //       final String item = 'item $index';
                  //       return ListTile(
                  //         title: Text(item),
                  //         onTap: () {
                  //           setState(() {
                  //             controller.closeView(item);
                  //           });
                  //         },
                  //       );
                  //     });
                  //   }),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: AutoSizeText(
                        "This feature will be available soon!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  )
                ],
              ),
            ])));
  }
}
