import 'package:flutter/material.dart';


import '../Customer/CurrentLocation.dart';
import '../PagesAuth/Login/login_email.dart';
import '../PagesAuth/Login/login_method.dart';
import '../PagesAuthBusiness/Login/login_email.dart';
import '../PagesAuthBusiness/Login/login_method.dart';

class TeamConnected extends StatefulWidget {
  @override
  TeamConnectedState createState() => TeamConnectedState();
}

class TeamConnectedState extends State<TeamConnected> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Choose Customer/Business'),
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                child: Text(
                  'Customer',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginMethod();
                    },
                  ));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                child: Text(
                  'Business',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                  //   color: Colors.blueAccent,
                  // textColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const BusinessLoginMethod();
                    },
                  ));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                child: Text(
                  'Map',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const CurrentLocationScreen();
                    },
                  ));
                },
              ),
            ),
          ]))),
    );
  }
}
