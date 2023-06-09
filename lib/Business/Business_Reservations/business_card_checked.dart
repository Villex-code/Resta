import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/Business/business_menu.dart';

import 'package:my_app/Business/Business_Notifications/business_notifications.dart';
//import 'package:test_app/home_page.dart';

class BusinessCardChecked extends StatefulWidget {
  BusinessCardChecked({super.key});

  @override
  _BusinessCardChecked createState() => _BusinessCardChecked();
}

class _BusinessCardChecked extends State<BusinessCardChecked> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/company.png'),
            ),
            Text('Rserve Info'),
          ],
        ),
      ),
    );
  }
}
