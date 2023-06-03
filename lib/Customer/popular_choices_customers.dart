import 'package:flutter/material.dart';
import 'package:my_app/Customer/store_in_list_customer.dart';
import 'package:velocity_x/velocity_x.dart';

class PopularChoices extends StatefulWidget {
  const PopularChoices({super.key});

  @override
  State<PopularChoices> createState() => _PopularChoicesState();
}

class _PopularChoicesState extends State<PopularChoices> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                child: Text(
                  'Popular Choices',
                  style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
              ),
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.65, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: context.screenWidth,
            height: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(31, 250, 250, 250),
              borderRadius: BorderRadius.circular(20), //EDWWWWWWWWWWWWW
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                StoreInList(),
                StoreInList(),
                StoreInList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
