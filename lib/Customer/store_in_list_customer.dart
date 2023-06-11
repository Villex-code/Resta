import 'package:flutter/material.dart';
import 'package:my_app/Customer_Store_View/store_image_customer.dart';
import 'package:velocity_x/velocity_x.dart';

class StoreInList extends StatefulWidget {
  final String id;
  final String? name;
  final String? address;
  final String? type;
  final String? rating;
  final String? number_of_reviews;
  final String? capacity;

  const StoreInList(
      {super.key,
      required this.id,
      required this.name,
      required this.address,
      required this.type,
      required this.rating,
      required this.number_of_reviews,
      required this.capacity});

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
              StoreImage(id: widget.id),
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
                                widget.name!,
                                // style:
                                //     FlutterFlowTheme.of(context)
                                //         .bodyMedium,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                widget.address ?? "No address set",
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
                                  widget.rating ?? '-',
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
                                  '(${widget.number_of_reviews ?? "-"})',
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
                                  widget.type!,
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
                                'Capacity: ${widget.capacity}',
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
