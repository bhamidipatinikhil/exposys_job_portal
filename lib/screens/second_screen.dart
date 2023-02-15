import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'applications_page_screen.dart';
import 'exploration_screen.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key, required this.user});
  User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  if (user != null) {
                    return Column(
                      children: [
                        CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                NetworkImage(user.photoURL as String)),
                        Container(
                            margin: EdgeInsets.all(18),
                            padding: EdgeInsets.all(8),
                            decoration:
                                BoxDecoration(border: Border.all(width: 4)),
                            child: Text("Welcome ${user.displayName}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ],
                    );
                  } else {
                    return Text("");
                  }
                }),
                SizedBox(height: 70),
                ElevatedButton(
                  child: Text("See the list of Applications"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ApplicationsPageScreen()));
                  },
                ),
                ElevatedButton(
                    child: Text("Explore the domains"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExplorationScreen()));
                    })
              ]),
        );
      }),
    );
  }
}
