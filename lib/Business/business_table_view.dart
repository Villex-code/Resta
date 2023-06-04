import 'package:flutter/material.dart';
import 'package:my_app/Business/business_add_table.dart';
import 'package:my_app/Business/business_menu.dart';
import 'business_add_table.dart';
import 'business_home_page.dart';
import 'package:my_app/Business/business_each_table.dart';
import 'package:my_app/Business/business_table.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_app/Business/business_table_list.dart';


class Business_TableView extends StatelessWidget {
  List<Table_List> tableList = [];
  List<String> table = [];
  List<String> seats = [];
  List<String> categories = [];
  Business_TableView({required this.table,required this.seats,required this.categories});

  final String text = 'Store' ;
  final String url = 'https://picsum.photos/seed/314/600' ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child:Container(
              width: double.infinity,
              height: 700,
              child: Stack(
                  children: [
                    PageView(
                        controller:
                        PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                          child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(8),
                                child: Image.network(
                                'https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA=',
                                fit: BoxFit.cover,
                                ),
                             ),
                            ),
                            Spacer(),
                            Container(
                              padding: new EdgeInsets.only(top: 16.0),
                              width: context.screenWidth * 1,
                              height: 350,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(18))
                              ),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Column(
                                children: [
                                  Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Table',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'OoohBaby',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                       ),
                                    ),
                                    Spacer(),
                                    Text('Seats',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'OoohBaby',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                    ),),
                                    Spacer(),
                                    Text('Categories',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'OoohBaby',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ]
                            ),
                                  NewTable(table: table,seats: seats,categories: categories),
                            ]),
                            ),
                            ),
                            Row(
                              children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                  Business_AddTable(text: text, url: url)),
                                  );
                                },
                               style: ElevatedButton.styleFrom(
                                  primary: Colors.grey, // Background color
                                ),
                                icon: Icon(
                                  Icons.upload_sharp,
                                  size: 15.0,
                                ),
                                label: Text("Upload Table View"),
                                ),
                            Spacer(),
                            ElevatedButton.icon(
                              onPressed: () {
                                table = [];
                                seats = [];
                                categories = [];
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      BusinessView.withList(table: table,seats: seats,categories: categories)),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey, // Background color
                              ),
                              icon: Icon(
                                Icons.remove_circle_outline,
                                size: 15.0,
                              ),
                              label: Text("Remove Table View"),
                            ),
                            ]
                            )
                            ],
                            ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8, 8, 8, 8),
                            child:Container(
                              // width: 200,
                              // height: 1000,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    onTap: () {
                                    },
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA=',
                                        // width: 170,
                                        // height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: new EdgeInsets.only(top: 16.0),
                                    width: context.screenWidth * 1,
                                    height: 350,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(18))
                                    ),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                          children: [
                                            Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Table',
                                                    style: TextStyle(
                                                      decoration: TextDecoration.underline,
                                                      fontFamily: 'OoohBaby',
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w800,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text('Seats',
                                                    style: TextStyle(
                                                      decoration: TextDecoration.underline,
                                                      fontFamily: 'OoohBaby',
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w800,
                                                    ),),
                                                  Spacer(),
                                                  Text('Categories',
                                                    style: TextStyle(
                                                      decoration: TextDecoration.underline,
                                                      fontFamily: 'OoohBaby',
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w800,
                                                    ),
                                                  ),
                                                ]
                                            ),
                                            NewTable(table: table,seats: seats,categories: categories),
                                          ]),
                                    ),
                                  ),
                                  Row(
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) =>  Business_AddTable(text: text,url: url)),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.grey, // Background color
                                          ),
                                          icon: Icon(
                                            Icons.upload_sharp,
                                            size: 15.0,
                                          ),
                                          label: Text("Upload Table View"),
                                        ),
                                        Spacer(),
                                        ElevatedButton.icon(

                                          onPressed: () {
                                            table = [];
                                            seats = [];
                                            categories = [];
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) =>
                                                  BusinessView.withList(table: table,seats: seats,categories: categories)),
                                            );

                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.grey, // Background color
                                          ),
                                          icon: Icon(
                                            Icons.remove_circle_outline,
                                            size: 15.0,
                                          ),
                                          label: Text("Remove Table View"),
                                        ),
                                      ]
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8, 8, 8, 8),
                            child:Container(
                              // width: 200,
                              // height: 1000,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    onTap: () {
                                    },
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA=',
                                        // width: 170,
                                        // height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: new EdgeInsets.only(top: 16.0),
                                    width: context.screenWidth * 1,
                                    height: 350,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(18))
                                    ),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                          children: [
                                            Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Table',
                                                    style: TextStyle(
                                                      decoration: TextDecoration.underline,
                                                      fontFamily: 'OoohBaby',
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w800,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text('Seats',
                                                    style: TextStyle(
                                                      decoration: TextDecoration.underline,
                                                      fontFamily: 'OoohBaby',
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w800,
                                                    ),),
                                                  Spacer(),
                                                  Text('Categories',
                                                    style: TextStyle(
                                                      decoration: TextDecoration.underline,
                                                      fontFamily: 'OoohBaby',
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w800,
                                                    ),
                                                  ),
                                                ]
                                            ),
                                            NewTable(table: table,seats: seats,categories: categories),
                                          ]),
                                    ),
                                  ),
                                  Row(
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) =>  Business_AddTable(text: text,url: url)),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.grey, // Background color
                                          ),
                                          icon: Icon(
                                            Icons.upload_sharp,
                                            size: 15.0,
                                          ),
                                          label: Text("Upload Table View"),
                                        ),
                                        Spacer(),
                                        ElevatedButton.icon(

                                          onPressed: () {
                                            table = [];
                                            seats = [];
                                            categories = [];
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) =>
                                                  BusinessView.withList(table: table,seats: seats,categories: categories)),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.grey, // Background color
                                          ),
                                          icon: Icon(
                                            Icons.remove_circle_outline,
                                            size: 15.0,
                                          ),
                                          label: Text("Remove Table View"),
                                        ),
                                      ]
                                  )
                                ],
                              ),
                            ),
                          ),
                        ] ),
                  ]),
            ),
          ),
        ]);
  }
}
