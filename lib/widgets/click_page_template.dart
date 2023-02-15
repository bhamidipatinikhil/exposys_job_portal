import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exposys_registration/screens/applications_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ClickPageTemplate extends StatelessWidget {
  ClickPageTemplate(
      {super.key, required this.title, required this.description});
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title), centerTitle: true),
        body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Text("DESCRIPTION",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SelectableText(description,
                        style: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic)),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  child: Text("Apply"),
                  onPressed: () {
                    CollectionReference registrations =
                        FirebaseFirestore.instance.collection('registrations');

                    final user = FirebaseAuth.instance.currentUser;

                    registrations.add({
                      "Name": user!.displayName,
                      "Email ID": user.email,
                      "Applied For": title
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ApplicationsPageScreen()));
                  },
                )
              ],
            )));
  }
}
