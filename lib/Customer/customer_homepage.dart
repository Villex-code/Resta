import 'package:flutter/material.dart';
import 'package:my_app/Customer/categories_customers.dart';
import 'package:my_app/Customer/firstinfo_customer.dart';
import 'package:my_app/Customer/map_customers.dart';
import 'package:my_app/Customer/popular_choices_customers.dart';
import 'package:my_app/Profile/MainProfile.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Authentication/user.dart';

class SeeCustomer_View extends StatefulWidget {
  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<SeeCustomer_View> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final currentUser = Provider.of<CurrentUser>(context, listen: false);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 233, 233),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 420,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(60, 144, 37, 37),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [FirstInfoCustomer()],
                ),
              ),
              Container(
                height: 144,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [Categories()],
                ),
              ),
              Container(
                height: 900,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(60, 144, 37, 37),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [PopularChoices()],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
