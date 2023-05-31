import 'package:flutter/material.dart';
import 'package:my_app/Business/business_add_table.dart';
import 'package:my_app/Business/business_menu.dart';
import 'package:my_app/Business/main.dart';



class Business_TableView extends StatelessWidget {
  const Business_TableView({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/table1.jpg'),fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  BusinessView()),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          title:Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/company.png'),
                ),
                SizedBox(width: 20.0,),
                Text('Company name'),
              ]),
        ),
        body:Container(
          child: SingleChildScrollView(
            child: Column(
                children:[
                  Container(
                    height: 100,
                    child: Center(
                        child: Text("Table View", style: TextStyle(fontFamily: 'OoohBaby',fontSize: 50,color:Colors.white))
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Image.asset('assets/table_view.jpg'),
                ]
            ),
          ),
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Business_AddTable()),
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
                    MaterialPageRoute(builder: (context) => const Business_AddTable()),
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
  }
}

