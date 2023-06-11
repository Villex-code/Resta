import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/Business/Business_Notifications/card_notification.dart';
import 'package:my_app/Business/business_home_page.dart';
import 'package:my_app/Business/business_menu.dart';

import 'package:my_app/Business/business_add_table.dart';
//import 'package:test_app/home_page.dart';

class Business_Notifications extends StatelessWidget {
  final String text;
  final String url;
  List<String> table = [];
  List<String> seats = [];
  List<String> categories = [];
  Business_Notifications(
      {super.key,
        required this.text,
        required this.url,
        required this.table,
        required this.seats,
        required this.categories});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.white,),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => BusinessView.withList(
                        table: table, seats: seats, categories: categories)),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 45,
                  height: 45,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(text),
              ]),
        ),
        body: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(children: [
              CardNotification(),
            ]),
          ),
        ]),
      ),
    );
  }
}