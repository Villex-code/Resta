import 'package:flutter/material.dart';
import 'package:my_app/Business/business_add_table.dart';
import 'package:my_app/Business/business_home_page.dart';

class Business_TableList extends StatefulWidget {
  @override
  _Business_TableListState createState() => _Business_TableListState();
}

class _Business_TableListState extends State<Business_TableList> {
  List<String> table = [];
  List<String> seats = [];
  List<String> categories = [];
  final String text = 'Store';
  final String url = 'https://picsum.photos/seed/314/600';
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
            child: Row(children: [
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
                  table = [];
                  seats = [];
                  categories = [];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BusinessView.withList(
                                table: table,
                                seats: seats,
                                categories: categories)),
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
          ),
        ),
      ],
    );
  }
}





