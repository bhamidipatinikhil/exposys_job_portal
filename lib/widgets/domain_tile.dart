import 'package:exposys_registration/widgets/click_page_template.dart';
import 'package:flutter/material.dart';
import 'dart:math';



class DomainTile extends StatelessWidget {
  DomainTile({super.key, required this.matter, required this.clickPage});
  Widget clickPage;
  String matter;

  @override
  Widget build(BuildContext context) {
    Random r = new Random();
    return Container(
        color:
            Color.fromARGB(150, r.nextInt(255), r.nextInt(255), r.nextInt(255)),
        padding: EdgeInsets.all(20),
        child: InkWell(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => clickPage));
            }),
            child: Align(
                alignment: Alignment.topCenter,
                child: Center(
                    child: Text(matter, style: TextStyle(fontSize: 20))))));
  }
}
