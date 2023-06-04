import 'package:flutter/material.dart';
import 'package:my_app/Customer_Store_View/store_image_customer.dart';
import 'package:velocity_x/velocity_x.dart';

class StoreInList extends StatefulWidget {
  const StoreInList({super.key});

  @override
  State<StoreInList> createState() => _StoreInListState();
}

class _StoreInListState extends State<StoreInList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
      child: Container(
        // width: 230,
        // height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              StoreImage(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Container(
                  //context.screenWidth
                  width: context.screenWidth * 0.63,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '[Store name]',
                                // style:
                                //     FlutterFlowTheme.of(context)
                                //         .bodyMedium,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.star_rate,
                                color: Colors.white,
                                size: 17,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                child: Text(
                                  '3,7',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                child: Text(
                                  '(500)',
                                  // style:
                                  //     FlutterFlowTheme.of(context)
                                  //         .bodyMedium,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Bar,Restaurant',
                                  // style:
                                  //     FlutterFlowTheme.of(context)
                                  //         .bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Capacity: 30',
                                // style:
                                //     FlutterFlowTheme.of(context)
                                //         .bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
