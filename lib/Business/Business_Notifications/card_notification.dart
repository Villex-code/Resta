import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/Business/business_menu.dart';

import 'package:my_app/Business/business_add_table.dart';
//import 'package:test_app/home_page.dart';

class CardNotification extends StatelessWidget {
  CardNotification({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      elevation: 50,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/company.png'),
            ),
            Text(' Info'),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Background color
              ),
              icon: Icon(
                Icons.check,
                size: 24.0,
              ),
              label: Text("Accept"),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent, // Background color
              ),
              icon: Icon(
                Icons.cancel,
                size: 24.0,
              ),
              label: Text("Refuse"),
            ),
          ],
        ),
      ),
    );
  }
}