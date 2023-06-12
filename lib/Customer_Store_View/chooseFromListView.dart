import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Customer/thank_you.dart';
import 'package:velocity_x/velocity_x.dart';

class ButtonList extends StatefulWidget {
  final String id;

  const ButtonList({Key? key, required this.id}) : super(key: key);

  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  int selectedIndex = -1;
  late Stream<QuerySnapshot> tableStream;
  late List<QueryDocumentSnapshot> tables;

  @override
  void initState() {
    super.initState();
    tableStream = FirebaseFirestore.instance
        .collection('business')
        .doc(widget.id)
        .collection('tables')
        .snapshots();
  }

  Future<void> reserveTable(QueryDocumentSnapshot table) async {
    print('Reserved Table: ${table['table_name']}');
    await table.reference.update({'available': false});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 2, 8, 3),
            child: StreamBuilder<QuerySnapshot>(
              stream: tableStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading');
                }

                tables = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: tables.length,
                  itemBuilder: (BuildContext context, int index) {
                    final tableData =
                        tables[index].data() as Map<String, dynamic>;
                    final isAvailable = tableData['available'] as bool;
                    final tableName = tableData['table_name'] as String;
                    final tableCapacity =
                        tableData['table_capacity'].toString() as String;

                    return Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: isAvailable
                            ? () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              }
                            : null,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return isAvailable ? Colors.blue : Colors.grey;
                            },
                          ),
                        ),
                        child: Column(children: [
                          (10).heightBox,
                          Text(tableName),
                          Text("Capacity $tableCapacity")
                        ]),
                      ),
                    );
                  },
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
              onPressed: selectedIndex != -1
                  ? () async {
                      await reserveTable(tables[selectedIndex]);

                      // Get the table data
                      final tableData =
                          tables[selectedIndex].data() as Map<String, dynamic>;

                      // Get the current time
                      DateTime now = DateTime.now();

                      // Create a new reservation document
                      await FirebaseFirestore.instance
                          .collection('business')
                          .doc(widget.id)
                          .collection('reservations')
                          .add({
                        'table_name': tableData['table_name'],
                        'table_capacity': tableData['table_capacity'],
                        'time': now, // Firestore Timestamp
                      });

                      setState(() {
                        selectedIndex = -1;
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThankYou(),
                        ),
                      );
                    }
                  : null,
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
