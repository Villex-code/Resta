import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/Business/business_menu.dart';

import 'package:my_app/Business/Business_Notifications/business_notifications.dart';
//import 'package:test_app/home_page.dart';

class BusinessCardUnChecked extends StatefulWidget {
  const BusinessCardUnChecked({super.key});

  @override
  _BusinessCardUnChecked createState() => _BusinessCardUnChecked();
}

class _BusinessCardUnChecked extends State<BusinessCardUnChecked> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
            Text('Rserve Info'),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent, // Background color
              ),
              icon: Icon(
                Icons.check,
                size: 24.0,
              ),
              label: Text("Validate"),
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
              label: Text("Cancel"),
            ),
          ],
        ),
      ),
    );
  }
}
