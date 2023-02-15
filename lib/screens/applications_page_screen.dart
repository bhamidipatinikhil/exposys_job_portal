import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ApplicationsPageScreen extends StatefulWidget {
  const ApplicationsPageScreen({Key? key}) : super(key: key);

  @override
  _ApplicationsPageScreenState createState() => _ApplicationsPageScreenState();
}

class _ApplicationsPageScreenState extends State<ApplicationsPageScreen> {
  Stream collectionStream =
      FirebaseFirestore.instance.collection('registrations').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("List of Applications")),
        body: StreamBuilder(
            stream: collectionStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text("An Error occurred");
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading.. Please check your internet connection");
              }

              return ListView(
                  children: snapshot.data!.docs
                      .map<Widget>((DocumentSnapshot document) {
                final data = document.data()! as Map<String, dynamic>;
                return ListTile(
                    title: Text(data['Name'] as String),
                    subtitle: Text(data['Email ID'] as String),
                    trailing: Text(data['Applied For'] as String));
              }).toList() as List<Widget>);
            }));
  }
}
