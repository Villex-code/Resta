import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Business/business_table_list.dart';
import 'package:my_app/backend/BusinessDocBuilder.dart';
import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';

class NewTable extends StatefulWidget {
  List<String> table = [];
  List<String> seats = [];
  List<String> categories = [];
  NewTable(
      {required this.table, required this.seats, required this.categories});
  @override
  _Table createState() => _Table();
}

class _Table extends State<NewTable> {
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentBusiness>(context, listen: false);
    return BusinessDocBuilder(
      collectionName: 'tables',
      builder: (BuildContext context, dynamic documents) {
        // Cast documents to List<DocumentSnapshot> if necessary
        final List<DocumentSnapshot> documentList =
            documents as List<DocumentSnapshot>;
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: documentList.length,
              itemBuilder: (context, index) {
                // Access individual review document
                final reviewData =
                    documentList[index].data() as Map<String, dynamic>;
                final name = reviewData['table_name'];
                final capacity = reviewData['table_capacity'];
                final category = reviewData['table_category'].toString();

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(name ?? "No table name found"),
                    Text(capacity.toString() ?? "No capacity found"),
                    Text(category)
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
