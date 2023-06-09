
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/Business/business_menu.dart';
import 'package:my_app/Business/business_home_page.dart';
import 'package:my_app/Business/business_table_view.dart';
import 'package:my_app/Business/business_table_list.dart';
class Table_List {
  final String table,seats;
  List<String> categories = [];

  Table_List({required this.table, required this.seats,required this.categories});
  String getTable(){
    return table;
  }

  String getSeats(){
    return seats;
  }

  List<String> getCategories(){
    return categories;
  }
}






//===============gia na ginontai click polla================//

// import 'package:flutter/material.dart';

// class ButtonList extends StatefulWidget {
//   @override
//   _ButtonListState createState() => _ButtonListState();
// }

// class _ButtonListState extends State<ButtonList> {
//   List<bool> isSelected = [false, false, false];
//   List<String> buttonNames = ['Apple', 'Banana', 'Mango'];
//   List<int> reservedIndices = [];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: 3,
//             itemBuilder: (BuildContext context, int index) {
//               return Container(
//                 margin: EdgeInsets.symmetric(vertical: 8.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       isSelected[index] = !isSelected[index];
//                     });
//                   },
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                       (Set<MaterialState> states) {
//                         if (isSelected[index]) {
//                           return Colors.green;
//                         }
//                         return Colors.blue;
//                       },
//                     ),
//                   ),
//                   child: Text(buttonNames[index]),
//                 ),
//               );
//             },
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             reservedIndices.clear();
//             for (int i = 0; i < isSelected.length; i++) {
//               if (isSelected[i]) {
//                 reservedIndices.add(i);
//               }
//             }
//             print('Reserved Buttons: $reservedIndices');
//           },
//           child: Text('Reserve'),
//         ),
//       ],
//     );
//   }
// }
