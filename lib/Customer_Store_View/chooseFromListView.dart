import 'package:flutter/material.dart';

class ButtonList extends StatefulWidget {
  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 2, 8, 3),
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (selectedIndex != -1) {
                          reservedIndices.add(selectedIndex);
                        }
                        selectedIndex = index;
                        buttonColors = List<Color>.generate(6, (i) {
                          if (i == index) {
                            return Color.fromARGB(255, 161, 186, 187);
                          }
                          return Color.fromARGB(255, 124, 162, 195);
                        });
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          return buttonColors[index];
                        },
                      ),
                    ),
                    child: Text(buttonNames[index]),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 30, 8, 0),
          child: SizedBox(
            height: 48.0,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                if (selectedIndex != -1) {
                  print('Reserved Button: ${buttonNames[selectedIndex]}');
                } else {
                  print('No button selected');
                }
              },
              child: Text('Reserve'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 51, 200, 208)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
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




