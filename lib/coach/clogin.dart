import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class clogin extends StatefulWidget {
  const clogin({super.key});

  @override
  State<clogin> createState() => _cloginState();
}

class _cloginState extends State<clogin> {
  final formkey = GlobalKey<FormState>();
  String name = "";
  String emailId = "";
  double phoneNo = 0;
  String sportName = "";
  String academyName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              "The person behind all of it.",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              "Create your account",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: Text(
                      "Please Fill In The Following Details:",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Cera",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: TextField(
                      style: TextStyle(fontFamily: "Cera"),
                      controller: email,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontFamily: "Cera"),
                          hintText: "Enter Your Email ID",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: TextField(
                      style: TextStyle(fontFamily: "Cera"),
                      obscureText: true,
                      controller: password,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontFamily: "Cera"),
                          hintText: "Enter Desired Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          showspinner = true;
                        });
                        try {
                          final SnackBar snackBar;
                          snackBar = SnackBar(
                              content:
                                  Text("User is successfully registered!"));
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.pushNamed(context, '/coachlogin');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                        setState(() {
                          //showspinner = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: Text(
                        "Submit! ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Cera"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
