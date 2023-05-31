import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/Business/business_menu.dart';
import 'package:my_app/Business/business_home_page.dart';
import 'package:my_app/Business/business_table_view.dart';
//import 'package:test_app/home_page.dart';

class AddTable extends StatefulWidget{
  const AddTable({super.key});
  @override
  _AddTable createState() => _AddTable();
}
class _AddTable extends State<AddTable>{
  final TextEditingController tableNumber = TextEditingController();
  final TextEditingController tableSeats = TextEditingController();
  bool? smokeArea = false;
  bool? noSmokeArea = false;
  bool? specialNeeds = false;
  bool? food = false;
  bool? drink = false;
  String? table;
  String? seats;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TableView()),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/company.png'),
                ),
                SizedBox(width: 20.0,),
                Text('Company name'),
              ]
          ),
        ),
        body: Stack(
            children:<Widget> [
        SingleChildScrollView(
        child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            controller: tableNumber,
            keyboardType: TextInputType.name,
            onSaved: (value) {
              tableNumber.text = value!;
            },
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter table',
            ),
          ),
        ),
       Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
          controller: tableSeats,
          keyboardType: TextInputType.name,
          onSaved: (value) {
            tableSeats.text = value!;
          },
          textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter seats',
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 430,
              height: 700,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose for each table,several categories',
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 20), //TextStyle
                  ), //Text
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ), //SizedBox
                      Text(
                        'Smoke area: ',
                        style: TextStyle(fontSize: 17.0),
                      ), //Text
                      SizedBox(width: 10), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: this.smokeArea,
                        onChanged: (bool? value) {
                          setState(() {
                            this.smokeArea = value;
                          });
                        },
                      ),
                    ], //<Widget>[]
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ), //SizedBox
                      Text(
                        'No smoke area: ',
                        style: TextStyle(fontSize: 17.0),
                      ), //Text
                      SizedBox(width: 10), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: this.noSmokeArea,
                        onChanged: (bool? value) {
                          setState(() {
                            this.noSmokeArea = value;
                          });
                        },
                      ),
                    ], //<Widget>[]
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ), //SizedBox
                      Text(
                        'Special needs: ',
                        style: TextStyle(fontSize: 17.0),
                      ), //Text
                      SizedBox(width: 10), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: this.specialNeeds,
                        onChanged: (bool? value) {
                          setState(() {
                            this.specialNeeds = value;
                          });
                        },
                      ),
                    ], //<Widget>[]
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ), //SizedBox
                      Text(
                        'For food: ',
                        style: TextStyle(fontSize: 17.0,),
                      ), //Text
                      SizedBox(width: 10), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: this.food,
                        onChanged: (bool? value) {
                          setState(() {
                            this.food = value;
                          });
                        },
                      ),
                    ], //<Widget>[]
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ), //SizedBox
                      Text(
                        'For drink: ',
                        style: TextStyle(fontSize: 17.0),
                      ), //Text
                      SizedBox(width: 10), //SizedBox
                      /** Checkbox Widget **/
                      Checkbox(
                        value: this.drink,
                        onChanged: (bool? value) {
                          setState(() {
                            this.drink = value;
                          });
                        },
                      ),
                    ], //<Widget>[]
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(120.0,40.0,0,0),
                    child:ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          table = tableNumber.text;
                          seats = tableSeats.text;
                          tableNumber.text = ' ';
                          tableSeats.text = ' ';
                          smokeArea = false;
                          noSmokeArea = false;
                          specialNeeds = false;
                          food = false;
                          drink = false;
                          print(tableNumber);
                          print(tableSeats);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan, // Background color
                      ),
                      icon: Icon(
                        Icons.upload,
                        size: 24.0,
                      ),
                      label: Text("Add Table"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0,40.0,0,0),
                    child:Text(
                      'To upload your table view, please follow these guidelines:',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0,10.0,0,0),
                    child:Text(
                      '– Image type: jpg or png',
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0,10.0,0,0),
                    child:Text(
                      '– Image width: 700 pixels',
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0,10.0,0,0),
                    child:Text(
                      '– Image height: 990 pixels ',
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(120.0,80.0,0,0),
                    child:ElevatedButton.icon(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan, // Background color
                    ),
                    icon: Icon(
                      Icons.add_a_photo_outlined,
                      size: 24.0,
                    ),
                    label: Text("Add Photo"),
                    ),
                  ),
                ]
              ),
              ), //Column
            ), //SizedBox
          ), //Padding//Card

      ],
        ),
    ),
    ]),
    );
  }
}