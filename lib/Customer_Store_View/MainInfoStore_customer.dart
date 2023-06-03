import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class MainInfoStore_customer extends StatefulWidget {
  @override
  State<MainInfoStore_customer> createState() => MainInfoStore_customerState();

  String name, address, ratings, reviews, description;
  MainInfoStore_customer(
      {required this.name,
      required this.address,
      required this.ratings,
      required this.reviews,
      required this.description}) {}
}

class MainInfoStore_customerState extends State<MainInfoStore_customer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 431,
      height: 160,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 242, 245, 245),
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                    child: Text(
                      widget.address,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 17,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(18, 6, 6, 6),
                    child: Text(
                      widget.ratings,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  RatingBar.builder(
                    onRatingUpdate: (newValue) => setState(() => newValue),
                    itemBuilder: (context, index) => Icon(
                      Icons.star_rounded,
                      color: Colors.pink,
                    ),
                    direction: Axis.horizontal,
                    initialRating: 3,
                    unratedColor: Colors.black,
                    itemCount: 5,
                    itemSize: 26,
                    glowColor: Colors.blue,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      '(' + widget.reviews + ' reviews)',
                      //style: FlutterFlowTheme.of(context).bodyMedium, //bodyMedium
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
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
                    padding: EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                    child: Text(
                      widget.description,
                      //style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
