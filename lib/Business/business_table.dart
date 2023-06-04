import 'package:flutter/material.dart';
import 'package:my_app/Business/business_table_list.dart';

class NewTable extends StatefulWidget {

  List<String> table = [];
  List<String> seats = [];
  List<String> categories = [];
  NewTable({ required this.table,required this.seats,required this.categories});

  //String table,seats;
 // List<String> categories;

  @override
  _Table createState() => _Table();

}

class _Table extends State<NewTable> {

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /*Container(
            child:ListView(
              children: widget.table.map((strone){
                return Container(
                  child: Text(strone),
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  color: Colors.green[100],
                );
              }).toList(),
            ),
          ),*/
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.table.map((item) {
                return Text(item);}).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.seats.map((item) {
              return Text(item);}).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.categories.map((item) {
              return Text(item);}).toList(),
          ),
        ]
    );
  }
}



