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
  User? userr = FirebaseAuth.instance.currentUser;
  final TextEditingController _controller = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  bool areDues = false;
  Future<void> fetchdues() async {
    await FirebaseFirestore.instance
        .collection(userr!.uid.toString())
        .doc()
        .collection("payments")
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        return areDues = false;
      } else {
        return areDues = true;
      }
    });
  }

  void initState() {
    fetchdues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
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
                  areDues
                      ? Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: ((context, index) => Container()),
                            itemCount: 5,
                          ),
                        )
                      : Center(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.18,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AutoSizeText(
                                """No dues to show!If you want dues to show remind some people first.""",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                            AnimatedButton(
                                width:
                                    MediaQuery.of(context).size.height * 0.13,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                onPressed: () {},
                                child: Text(
                                  "Remind",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ))
                          ],
                        ))
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchAnchor(builder:
                        (BuildContext context, SearchController controller) {
                      return SearchBar(
                        controller: _controller,
                        padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 16.0)),
                        onTap: () {
                          controller.openView();
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        leading: const Icon(Icons.search),
                      );
                    }, suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              controller.closeView(item);
                            });
                          },
                        );
                      });
                    }),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: ((context, index) => Container(
                            height: MediaQuery.of(context).size.height * 0.14,
                            width: double.infinity,
                            child: GFListTile(
                                radius: 20,
                                avatar: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80')),
                                enabled: true,
                                shadow: BoxShadow(
                                    color: Colors.white,
                                    offset: Offset.infinite,
                                    spreadRadius: 30),
                                color: Color.fromRGBO(62, 62, 66, 1),
                                title: Text(
                                  "Mr.Chandalia",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                subTitle: Text(
                                  " Rs 2000",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                description: Text(
                                  "Date Credited : [Date]",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.020),
                                margin: EdgeInsets.all(5)),
                          )),
                      itemCount: 5,
                    ),
                  )
                ],
              ),
            ])));
  }
}
