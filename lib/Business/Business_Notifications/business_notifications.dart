import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Business/business_home_page.dart';
import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';

class Business_Notifications extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final currentBusiness =
        Provider.of<CurrentBusiness>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BusinessView()));
          },
        ),
        title: Text("Reservations"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('business')
            .doc(currentBusiness.businessId)
            .collection('reservations')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.data?.docs.isEmpty ?? true) {
            return Text('No reservations found');
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

              return Card(
                elevation: 5, // Add shadow to the card
                child: ListTile(
                  trailing: Icon(Icons.notifications),
                  title: Text("You have a new reservation!"),
                  subtitle: Text(
                      "Table Name: ${data['table_name']}\nTable Capacity: ${data['table_capacity']}\nTime: ${data['time'].toDate().toString()}"),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}