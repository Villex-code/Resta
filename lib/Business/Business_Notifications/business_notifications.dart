
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/Business/Business_Notifications/card_notification.dart';
import 'package:my_app/Business/business_menu.dart';
import 'package:my_app/Business/main.dart';
import 'package:my_app/Business/business_add_table.dart';
//import 'package:test_app/home_page.dart';

class Business_Notifications extends StatelessWidget {
  final String text;
  final String url;
  Business_Notifications({ super.key, required this.text,required this.url});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/rese_back.jpg'),fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  BusinessView()),
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
                  child:InkWell(
                    onTap:(){
                    },
                    child:Image.network(
                      url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                Text(text),
              ]
          ),
        ),
        body: Stack(
            children:<Widget> [
              SingleChildScrollView(
                child:Column(
                    children: [
                      CardNotification(),
                    ]
                ),
              ),
            ]),
      ),
    );

  }
}

