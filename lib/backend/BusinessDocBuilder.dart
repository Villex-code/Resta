import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';

class BusinessDocBuilder extends StatelessWidget {
  final String collectionName;
  final Widget Function(BuildContext, dynamic) builder;

  const BusinessDocBuilder({
    Key? key,
    required this.collectionName,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: _getUserStream(context),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          dynamic data = snapshot.data;
          return builder(context, data);
        } else {
          // Default case if no data yet and not waiting
          return Text('No data');
        }
      },
    );
  }

  Stream<dynamic> _getUserStream(BuildContext context) {
    final currentUser = Provider.of<CurrentBusiness>(context, listen: false);
    if (collectionName == 'main') {
      return currentUser.userDocStream;
    } else {
      return currentUser
          .subCollectionStream(collectionName)
          .map((querySnapshot) {
        return querySnapshot.docs;
      });
    }
  }
}
