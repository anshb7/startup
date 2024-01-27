import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup/bloc/auth_bloc.dart';

class sthome extends StatefulWidget {
  const sthome({super.key});

  @override
  State<sthome> createState() => _sthomeState();
}

class _sthomeState extends State<sthome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            actions: [
              IconButton(
                  icon: Icon(Icons.logout_sharp),
                  onPressed: () async {
                    var sp = await SharedPreferences.getInstance();
                    sp.setBool("isLoggedIn", false);
                    BlocProvider.of<AuthenticationBloc>(context).add(SignOut());
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context, true);
                    } else {
                      Navigator.pushReplacementNamed(context, '/');
                    }
                  }),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/stprofile");
                  },
                  icon: Icon(
                    Icons.person_2_rounded,
                    color: Colors.black,
                  ))
            ],
            title: Text(
              "Hello,Ansh!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Profile Details",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(62, 62, 66, 1),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Report Card",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(62, 62, 66, 1),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Leaderboard",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                child: ListView.builder(
                  itemBuilder: (BuildContext, ccontext) => ListTile(
                    leading: AutoSizeText(
                      "[Rank]",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    title: AutoSizeText(
                      "[Name]",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    trailing: AutoSizeText(
                      "[Points]",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  itemCount: 5,
                ),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(62, 62, 66, 1),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
