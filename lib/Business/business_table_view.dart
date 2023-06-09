import 'package:flutter/material.dart';
import 'package:my_app/Business/business_add_table.dart';
import 'package:my_app/Business/business_menu.dart';
import 'business_add_table.dart';
import 'business_home_page.dart';
import 'package:my_app/Business/business_each_table.dart';
import 'package:my_app/Business/business_table.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_app/Business/business_table_list.dart';

class Business_TableView extends StatefulWidget {
  List<String> table = [];
  List<String> seats = [];
  List<String> categories = [];
  Business_TableView(
      {required this.table, required this.seats, required this.categories});

  @override
  State<Business_TableView> createState() => _Business_TableViewState();
}

class _Business_TableViewState extends State<Business_TableView> {
  int selectedIndex = -1;

  List<Color> buttonColors = List<Color>.generate(6, (index) => Colors.blue);

  List<String> buttonNames = [
    'Table 1',
    'Table 2',
    'Table 3',
    'Table 4',
    'Table 5',
    'Table 6',
  ];

  List<int> reservedIndices = [];

  final String text = 'Store';

  final String url = 'https://picsum.photos/seed/314/600';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
        child: Container(
          width: double.infinity,
          height: 700,
          child: Stack(children: [
                PageView(
                  controller: PageController(initialPage: 0),
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
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA=',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
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
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA=',
                                // width: 170,
                                // height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
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
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA=',
                                // width: 170,
                                // height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
            Column(
              children: [
                 Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(50, 300, 50, 0),
                    child: ListView.builder(
                    itemCount: widget.table.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                     return Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child:Column(
                          children: [
                            Row(
                                children: [
                                  ElevatedButton(
                                   onPressed: () {
                                    setState(() {
                                    });
                                  },
                                  style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      return buttonColors[index];
                                    },
                                  ),
                                ),
                                child: Text("Table:" + '' +widget.table[index]),
                                ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                      });
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          return buttonColors[index];
                                        },
                                      ),
                                    ),
                                    child: Text("Seats:" + '' + widget.seats[index]),
                                  ),
                              ]),
                         ]),
                    );
                    },
                    ),
                  ),
                 ),
                   Row(children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                            MaterialPageRoute(
                                builder: (context) => Business_AddTable(
                                  text: text, url: url)),
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
                            widget.table = [];
                            widget.seats = [];
                            widget.categories = [];
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  BusinessView.withList(
                                    table: widget.table,
                                    seats: widget.seats,
                                    categories: widget.categories)),
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
                      ]),
              ],
            ),
          ]),
        ),
      ),
    ]);
  }
}
