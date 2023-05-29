import 'package:flutter/material.dart';
import 'package:my_app/Customer/searchbar_customer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Profile/MainProfile.dart';
import 'map_customers.dart';

class FirstInfoCustomer extends StatefulWidget {
  const FirstInfoCustomer({super.key});

  @override
  State<FirstInfoCustomer> createState() => _FirstInfoCustomerState();
}

class _FirstInfoCustomerState extends State<FirstInfoCustomer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UberProfile()),
                      );
                    },
                    child: Image.network(
                      'https://picsum.photos/seed/936/600',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                  child: Text(
                    'We are in Ipokratous 27.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF232130),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Text(
                  'Good Morning Mr. Dimos!',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SearchBarCustomer(),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [MapCustomer()],
          ),
        ],
      ),
    );
  }
}
