import 'package:flutter/material.dart';
import 'package:my_app/Customer/store_in_list_customer.dart';
import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PopularChoices extends StatefulWidget {
  const PopularChoices({super.key});

  @override
  State<PopularChoices> createState() => _PopularChoicesState();
}

class _PopularChoicesState extends State<PopularChoices> {
  @override
  Widget build(BuildContext context) {
    final currentBusiness =
        Provider.of<CurrentBusiness>(context, listen: false);
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                child: Text(
                  'Popular Choices',
                  style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ),
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.65, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: context.screenWidth,
            height: 600,
            decoration: BoxDecoration(
              color: Color.fromARGB(31, 250, 250, 250),
              borderRadius: BorderRadius.circular(20), //EDWWWWWWWWWWWWW
            ),
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('business').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError || !snapshot.hasData) {
                  return Text('No data found');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;

                    return StoreInList(
                      id: document.id,
                      name: data['name'],
                      address: data['address'],
                      type: data['category'].toString(),
                      //add other fields you have
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// ListView(
//               padding: EdgeInsets.zero,
//               scrollDirection: Axis.vertical,
//               children: [
//                 StoreInList(),
//                 StoreInList(),
//                 StoreInList(),