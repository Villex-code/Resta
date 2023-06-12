import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Business/business_home_page.dart';
import 'package:my_app/Business/business_menu.dart';

import 'package:my_app/Business/Business_Notifications/business_notifications.dart';
import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
//import 'package:test_app/home_page.dart';

class Business_Reservations extends StatefulWidget {
  final String text;
  final String url;
  List<String> table = [];
  List<String> seats = [];
  List<String> categories = [];
  Business_Reservations(
      {super.key,
      required this.text,
      required this.url,
      required this.table,
      required this.seats,
      required this.categories});

  @override
  _Business_Reservations createState() =>
      _Business_Reservations(text: text, url: url);
}

class _Business_Reservations extends State<Business_Reservations> {
  DateTime? datetime = DateTime.now();
  final String text;
  final String url;
  _Business_Reservations({required this.text, required this.url});

  Stream<QuerySnapshot> getTablesStream(String businessId) {
    return FirebaseFirestore.instance
        .collection('business')
        .doc(businessId)
        .collection('tables')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final currentBusiness = Provider.of<CurrentBusiness>(context, listen: true);

    return StreamBuilder<QuerySnapshot>(
      stream: getTablesStream(currentBusiness.businessId!),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BusinessView()), // replace NextPage() with your destination page
                );
              },
            ),
            //... Rest of your AppBar code
          ),
          body: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return Card(
                color: data['available']
                    ? Colors.green[100]
                    : Colors.red[100], // Green when available, Red otherwise
                margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/company.png'),
                          ),
                          Text(data['table_name']),
                          Text(
                              'Capacity: ${data['table_capacity'].toString()}'),
                          Text(data['available']
                              ? 'Available'
                              : 'Not Available'),
                        ],
                      ),
                      (20).heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () async {
                              // Handle table reservation
                              document.reference.update({'available': false});
                            },
                            child: Text("Reserve"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Handle table clear
                              document.reference.update({'available': true});
                            },
                            child: Text("Clear Table"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
