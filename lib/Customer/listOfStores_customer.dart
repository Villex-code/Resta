import 'package:flutter/material.dart';
import 'package:my_app/Customer/popular_choices_customers.dart';
import 'package:my_app/Customer/store_in_list_customer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
                //width: 400,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white12,
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    StoreInList(),
                    StoreInList(),
                    StoreInList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
