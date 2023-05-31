import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_app/menu.dart';
import 'package:test_app/main.dart';
import 'package:test_app/notifications.dart';
//import 'package:test_app/home_page.dart';


import 'package:my_app/notifications.dart';


class Reservations extends StatefulWidget {
  const Reservations({super.key});

  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservations> {
  DateTime? datetime = DateTime.now();



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/rese_back.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
          title: Row(children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/company.png'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text('Company name'),
          ]),
        ),
        body: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(children: [
              ElevatedButton.icon(
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2030))
                      .then((date) {
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notifications()),
                          );
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notifications()),
                          );
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
            ]),
          ),
        ]),
      ),
    );
  }
}
