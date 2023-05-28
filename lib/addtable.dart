import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_app/menu.dart';
import 'package:test_app/main.dart';
import 'package:test_app/table_view.dart';
class AddTable extends StatelessWidget {
  const AddTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.push(
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
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter table',
            ),
          ),
        ),
       Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter seats',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(150.0,50.0,0,0),
          child:ElevatedButton.icon(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.cyan, // Background color
          ),
          icon: Icon(
            Icons.add,
            size: 24.0,
          ),
          label: Text("Add Table"),
        ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(150.0,80.0,0,0),
            child:Text(
                  'To upload your menu, please follow these guidelines:'
                  '– Image type: jpg or png'
                  '– Image width: 700 pixels'
                  '– Image height: 990 pixels '
            ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(150.0,80.0,0,0),
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
      ],
        ),
    ),
    ]),
    );
  }
}