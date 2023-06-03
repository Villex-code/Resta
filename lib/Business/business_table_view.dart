import 'package:flutter/material.dart';
import 'package:my_app/Business/business_add_table.dart';
import 'package:my_app/Business/business_menu.dart';
import 'package:my_app/Business/main.dart';


import 'business_add_table.dart';
import 'business_home_page.dart';
//import 'package:test_app/home_page.dart';

class Business_TableView extends StatelessWidget {
  const Business_TableView({super.key});
<<<<<<< Updated upstream
=======
  final String text = 'Store' ;
  final String url = 'https://picsum.photos/seed/314/600' ;
>>>>>>> Stashed changes

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/table1.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BusinessView()),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Row(children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/company.png'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text('Company name'),
          ]),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 100,
                child: Center(
                    child: Text("Table View",
                        style: TextStyle(
                            fontFamily: 'OoohBaby',
                            fontSize: 50,
                            color: Colors.white))),
              ),
              SizedBox(
                height: 30.0,
              ),
              Image.asset('assets/table_view.jpg'),
            ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Business_AddTable()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey, // Background color
              ),
              icon: Icon(
                Icons.upload,
                size: 24.0,
              ),
              label: Text('Upload Table View'),
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Business_AddTable()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey, // Background color
              ),
              icon: Icon(
                Icons.edit,
                size: 24.0,
              ),
              label: Text('Edit Table View'),
            ),
          ),
        ]),
      ),
    );
=======
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
                          EachTable(),
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
>>>>>>> Stashed changes
  }
}
