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
            padding: EdgeInsetsDirectional.fromSTEB(8, 13, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: context.screenWidth * 0.3,
                  height: 100,
                  decoration: BoxDecoration(
                      //color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                  child: Container(
                    //khbujbhb
                    // width: 100,
                    height: 100,
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
                        'https://media.istockphoto.com/id/1209654046/vector/user-avatar-profile-icon-black-vector-illustration.jpg?s=612x612&w=0&k=20&c=EOYXACjtZmZQ5IsZ0UUp1iNmZ9q2xl1BD1VvN6tZ2UI=',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: context.screenWidth * 0.6,
                  height: 100,
                  decoration: BoxDecoration(
                      //color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(23, 15, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Hello Mr. Vasilis!',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 22, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18, 0, 0, 0),
                                  child: Icon(
                                    Icons.location_pin,
                                    //color: FlutterFlowTheme.of(context).secondaryText,
                                    size: 28,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3, 0, 0, 0),
                                  child: Text(
                                    'We are in Πατησίων 76.',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF232130),
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(22, 0, 0, 0),
                //   child: Icon(
                //     Icons.location_pin,
                //     //color: C,
                //     size: 34,
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                //   child: Text(
                //     'We are in Ipokratous 27.',
                //     textAlign: TextAlign.start,
                //     style: TextStyle(
                //       fontFamily: 'Montserrat-Light',
                //       color: Color(0xFF232130),
                //       fontSize: 16,
                //       //fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          // Row(
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     Padding(
          //       padding: EdgeInsetsDirectional.fromSTEB(120, 8, 8, 8),
          //       child: Text(
          //         'Good Morning Mr. Dimos!',
          //         style: TextStyle(
          //           fontFamily: 'Readex Pro',
          //           fontSize: 22,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
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
