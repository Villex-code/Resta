import 'package:flutter/material.dart';
import 'package:my_app/Customer/store_view_from_customer.dart';
import 'package:my_app/Customer/listOfStores_customer.dart';
import 'package:my_app/MainPages/TeamConnected.dart';
import 'package:velocity_x/velocity_x.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 3),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: context.screenWidth,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Container(
                        width: 114,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          // children: [
                          //   ClipRRect(
                          //       borderRadius: BorderRadius.circular(8),
                          //       child: Image.network(
                          //         'https://picsum.photos/seed/916/600',
                          //         width: 212,
                          //         height: 59,
                          //         fit: BoxFit.cover,
                          //       )),
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListOfStoresCustomer(
                                              category: 'Restaurant')),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/916/600',
                                  width: 212,
                                  height: 59,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              'Restaurants',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Container(
                        width: 120,
                        height: 113,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListOfStoresCustomer(
                                              category: 'Bar')),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/289/600',
                                  width: 249,
                                  height: 58,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              'Bars',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Container(
                        width: 137,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListOfStoresCustomer(
                                              category: 'Brunch')),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/840/600',
                                  width: 300,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text('Brunch'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Container(
                        width: 122,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(31, 219, 196, 196),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListOfStoresCustomer(
                                              category: 'Cafe')),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/634/600',
                                  width: 300,
                                  height: 59,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              'Cafe',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
