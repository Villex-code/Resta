import 'package:flutter/material.dart';
import 'package:my_app/Customer_Store_View/store_view_from_customer.dart';
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
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 8, 3),
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
                        width: 120,
                        // height: 100,
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
                                        //ListOfStoresCustomer(category: 'Restaurants')
                                        ListOfStoresCustomer(category: 'Bars'),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA=',
                                  width: 120,
                                  height: 60,
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
                        // height: 100,
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
                                              category: 'Bars')),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://gadttravel.com/blog/wp-content/uploads/2018/09/Drinks-in-bar.png',
                                  width: 120,
                                  height: 60,
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
                        width: 120,
                        // height: 100,
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
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyADx5frF16jsu6BA3ywysjTLWGNZOK9ssQg&usqp=CAU',
                                  width: 120,
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
                        width: 120,
                        // height: 100,
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
                                  'https://www.usatoday.com/gcdn/media/2019/01/18/USATODAY/usatsports/gettyimages-500740897.jpg?crop=1365,768,x0,y0&width=660&height=372&format=pjpg&auto=webp',
                                  width: 120,
                                  height: 60,
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
