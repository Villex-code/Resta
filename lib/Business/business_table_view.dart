import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Business/business_add_table.dart';
import 'package:my_app/Business/business_menu.dart';
import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';
import 'business_add_table.dart';
import 'business_home_page.dart';
import 'package:my_app/Business/business_each_table.dart';
import 'package:my_app/Business/business_table.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_app/Business/business_table_list.dart';

class Business_TableView extends StatefulWidget {
  List<String> table = [];
  List<String> seats = [];
  List<String> categories = [];
  Business_TableView(
      {required this.table, required this.seats, required this.categories});

  @override
  State<Business_TableView> createState() => _Business_TableViewState();
}

class _Business_TableViewState extends State<Business_TableView> {

  final _formKey = GlobalKey<FormState>();
  final _tableNameController = TextEditingController();
  final _tableCapacityController = TextEditingController();

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchTables(String businessId) {
    return FirebaseFirestore.instance
        .collection('business')
        .doc(businessId)
        .collection('tables')
        .snapshots();
  }

  Future<void> deleteTable(String businessId, String tableId) {
    return FirebaseFirestore.instance
        .collection('business')
        .doc(businessId)
        .collection('tables')
        .doc(tableId)
        .delete();
  }

  Future<void> addTable(
      String businessId, String tableName, String tableCapacity) async {
    CollectionReference tables = FirebaseFirestore.instance
        .collection('business')
        .doc(businessId)
        .collection('tables');

    return tables
        .add({
          'table_name': tableName,
          'table_capacity': tableCapacity,
          'available': true
        })
        .then((value) => print("Table Added"))
        .catchError((error) => print("Failed to add table: $error"));
  }

  @override
  void dispose() {
    _tableNameController.dispose();
    _tableCapacityController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final currentBusiness =
        Provider.of<CurrentBusiness>(context, listen: false);

    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: fetchTables(currentBusiness.businessId!),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                List<QueryDocumentSnapshot<Map<String, dynamic>>> tables =
                    snapshot.data!.docs;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: tables.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> table = tables[index].data();
                    String tableName = table['table_name'];
                    String tableCapacity = table['table_capacity'].toString();

                    return ListTile(
                      title: Text(tableName),
                      subtitle: Text('Capacity: $tableCapacity'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteTable(
                          currentBusiness.businessId!,
                          tables[index].id,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Add Table'),
                      content: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextFormField(
                              controller: _tableNameController,
                              decoration: const InputDecoration(
                                labelText: 'Table Name',

                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter table name';
                                }
                                return null;
                              },
                            ),

                            TextFormField(
                              controller: _tableCapacityController,
                              decoration: const InputDecoration(
                                labelText: 'Table Capacity',

                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter table capacity';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),

                      actions: [
                        ElevatedButton(

                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              addTable(
                                currentBusiness.businessId!,
                                _tableNameController.text,
                                _tableCapacityController.text,
                              );
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text('Add Table'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Add Table'),
            ),
            (50).heightBox,
          ],
        ),
      ),
    );
  }
}
