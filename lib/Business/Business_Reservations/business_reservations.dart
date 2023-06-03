
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/Business/business_menu.dart';
import 'package:my_app/Business/main.dart';
import 'package:my_app/Business/Business_Notifications/business_notifications.dart';
//import 'package:test_app/home_page.dart';


class Business_Reservations extends StatefulWidget {
  final String text;
  final String url;
  const Business_Reservations({ super.key, required this.text,required this.url});

  @override
  _Business_Reservations  createState() => _Business_Reservations(text: text,url: url);
  }

  class _Business_Reservations extends State<Business_Reservations> {
    DateTime? datetime = DateTime.now();
    final String text;
    final String url;
    _Business_Reservations({required this.text,required this.url});
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
                      ElevatedButton.icon(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2030)).then((date){
                              setState(() {
                                datetime = date;
                              });
                            });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey, // Background color
                        ),
                        icon: Icon(
                          Icons.calendar_today,
                          size: 25.0,
                        ),
                        label: Text("Choose Date"),
                      ),
                      Card(
                      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
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
                              onPressed: () {

                              },
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
                              onPressed: () {
                              },
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
                    ),
                      Card(
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
                      ),
                    ]
                ),
          ),
              ]),
      ),
      );

    }
 }

