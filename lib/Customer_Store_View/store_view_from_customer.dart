import 'package:flutter/material.dart';
import 'package:my_app/Customer_Store_View/MainInfoStore_customer.dart';
import 'package:my_app/Customer_Store_View/checkbox.dart';
import 'package:my_app/Customer_Store_View/chooseFromListView.dart';
import 'package:my_app/Customer_Store_View/customer_table_view.dart';
import 'package:my_app/Customer_Store_View/mainPicsOfStore_customer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class SeeStoreViewfromCustomer extends StatefulWidget {
  @override
  SeeStoreViewfromCustomerState createState() =>
      SeeStoreViewfromCustomerState();

  String name, address, ratings, reviews, description, id;
  SeeStoreViewfromCustomer(
      {required this.name,
      required this.address,
      required this.ratings,
      required this.reviews,
      required this.description,
      required this.id}) {}
}

class SeeStoreViewfromCustomerState extends State<SeeStoreViewfromCustomer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 245, 245),
      //Color.fromARGB(255, 242, 245, 245)
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 396,
                height: 290,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 245, 245),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            MainPicsOfStore_Customer(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MainInfoStore_customer(
                  id: widget.id,
                  name: widget.name,
                  address: widget.address,
                  ratings: widget.ratings,
                  reviews: widget.reviews,
                  description: widget.description),
              CustomerTableView(id: widget.id),
            ],
          ),
        ),
      ),
    );
  }
}
