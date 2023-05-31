import 'package:flutter/material.dart';
import 'package:my_app/Customer/popular_choices_customers.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantListCustomer extends StatefulWidget {
  @override
  _RestaurantListCustomerState createState() => _RestaurantListCustomerState();
}

class _RestaurantListCustomerState extends State<RestaurantListCustomer> {
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
              Container(
                height: 900,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(60, 144, 37, 37),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [PopularChoices()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
