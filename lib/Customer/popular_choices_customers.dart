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
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Text(
                  'Popular Choices',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w200,
                  ),
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
            //width: 400,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white12,
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
