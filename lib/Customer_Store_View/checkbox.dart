// import 'package:flutter/material.dart';

// class CheckboxGroup extends StatefulWidget {
//   @override
//   _CheckboxGroupState createState() => _CheckboxGroupState();
// }

// class _CheckboxGroupState extends State<CheckboxGroup> {
//   List<bool> checkedItems = List<bool>.filled(3, false);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 3,
//       itemBuilder: (BuildContext context, int index) {
//         return CheckboxListTile(
//           title: Text(_getItemName(index)),
//           value: checkedItems[index],
//           onChanged: (bool? value) {
//             setState(() {
//               checkedItems[index] = value ?? false;
//             });
//           },
//         );
//       },
//     );
//   }

//   String _getItemName(int index) {
//     switch (index) {
//       case 0:
//         return 'Table 1';
//       case 1:
//         return 'Table 2';
//       case 2:
//         return 'Table 3';
//       default:
//         return '';
//     }
//   }
// }
