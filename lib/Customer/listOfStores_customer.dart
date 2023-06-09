import 'package:flutter/material.dart';
import 'package:my_app/Customer/popular_choices_customers.dart';
import 'package:my_app/Customer/store_in_list_customer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:velocity_x/velocity_x.dart';

class ListOfStoresCustomer extends StatefulWidget {
  @override
  ListOfStoresCustomerState createState() => ListOfStoresCustomerState();

  String category;
  ListOfStoresCustomer({required this.category}) {}
}

class ListOfStoresCustomerState extends State<ListOfStoresCustomer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 233, 233),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 13),
                    child: Text(
                      widget.category,
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w200,
                      ),
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
                  color: Colors.white12,
                ),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('business')
                      .where('category',
                          arrayContains: widget
                              .category) // the where function will do the filtering
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
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
                          rating: data['rating'].toString() ?? '-',
                          number_of_reviews:
                              data['number_of_reviews'].toString() ?? '-',
                          capacity: data['capacity'].toString() ?? '-',
                          //add other fields you have
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
