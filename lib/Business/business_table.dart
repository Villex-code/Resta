import 'package:flutter/material.dart';
import 'package:my_app/Business/business_table_list.dart';

class NewTable extends StatefulWidget {

  Table_List newtable;
  NewTable({ required this.newtable});
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.newtable.table),
          Spacer(),
          Text(widget.newtable.seats),
          Spacer(),
          Row(
            children: widget.newtable.categories.map((categorie) {
              return Text(categorie);
            }).toList(),
          ),
        ]
    );
  }
}

class _NoTable extends State<NewTable> {

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(''),
          Spacer(),
          Text(''),
          Spacer(),
          Text(''),
        ]
    );
  }
}



