import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_app/ProfileBusiness/MainProfile.dart';
import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_app/Business/Business_Reservations/business_reservations.dart';
import 'package:my_app/Business/business_add_table.dart';
import 'package:my_app/Business/business_menu.dart';
import 'package:my_app/Business/Business_Notifications/business_notifications.dart';
import 'package:my_app/Business/business_table_view.dart';
import 'package:my_app/Business/business_image.dart';
import 'package:my_app/Business/business_each_table.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_app/Business/business_table_list.dart';
import 'package:my_app/Business/business_table.dart';

class BusinessView extends StatefulWidget {
  // Default or unnamed constructor
  BusinessView({super.key});
  List<String> table = [];
  List<String> seats = [];
  List<String> categories = [];
  BusinessView.withList(
      {required this.table, required this.seats, required this.categories});
  @override
  _BusinessView createState() => _BusinessView();
}

class _BusinessView extends State<BusinessView> {
  Color color = Colors.red;
  final String text = 'Store';
  final String url = 'https://picsum.photos/seed/314/600';

  @override
  Widget build(BuildContext context) {
    final currentBusiness = Provider.of<CurrentBusiness>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Container(
              height: 300,
              child: BusinessImage(),
            ),
            Container(
              width: 431,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('business')
                    .doc(currentBusiness.businessId)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.data?.exists != true) {
                    return Text('No business found');
                  }

                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                                child: Text(
                                  data['name'],
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 32,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 14, 0),
                                child: InkWell(
                                  onTap: () async {
                                    // upload new photos
                                    await currentBusiness
                                        .uploadAdditionalPicture();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.add_a_photo_outlined,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                                child: Text(
                                  data['address'],
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(18, 6, 6, 6),
                                child: Text(
                                  data['rating'],
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              RatingBar.builder(
                                onRatingUpdate: (newValue) =>
                                    setState(() => newValue),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star_rounded,
                                  color: Colors.pink,
                                ),
                                direction: Axis.horizontal,
                                initialRating: double.parse(data['rating'])
                                    .floorToDouble(),
                                unratedColor: Colors.black,
                                itemCount: 5,
                                itemSize: 26,
                                glowColor: Colors.blue,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Text(
                                  '(${data['number_of_reviews']} reviews)',
                                  //style: FlutterFlowTheme.of(context).bodyMedium, //bodyMedium
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 130,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          size: 24.0,
                                        ),
                                        Text(
                                          'Description',
                                          style: TextStyle(
                                            fontFamily: 'Outfit',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                            child: Text(
                              data['description'] ?? "Description here",
                              //style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              width: 390,
              height: 850,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Container(
                                width: 65,
                                height: 65,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Business_MenuView()),
                                    );
                                  },
                                  child: Image.network(
                                    url,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'MENU',
                                style: TextStyle(
                                    fontFamily: 'OoohBaby',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Center(
                        child: Text(
                          'TABLE VIEW',
                          style: TextStyle(
                              fontFamily: 'OoohBaby',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      LimitedBox(
                        maxHeight: 500,
                        child: Business_TableView(
                            table: widget.table,
                            seats: widget.seats,
                            categories: widget.categories),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox.fromSize(
              size: Size(85, 85), // button width and height
              child: ClipOval(
                child: Material(
                  color: Colors.white, // button color
                  child: InkWell(
                    splashColor: Colors.pinkAccent, // splash color
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Business_Reservations(
                                text: text,
                                url: url,
                                table: widget.table,
                                seats: widget.seats,
                                categories: widget.categories)),
                      );
                    }, // button pressed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.table_restaurant),
                        Text('Tables') // icontext
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox.fromSize(
              size: Size(85, 85), // button width and height
              child: ClipOval(
                child: Material(
                  color: Colors.white, // button color
                  child: InkWell(
                    splashColor: Colors.pinkAccent, // splash color
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Business_Notifications()),
                      );
                    }, // button pressed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.notifications_active),
                        Text('Reservations'), // icon// text
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox.fromSize(
              size: Size(70, 70), // button width and height
              child: ClipOval(
                child: Material(
                  color: Colors.white, // button color
                  child: InkWell(
                    splashColor: Colors.pinkAccent, // splash color
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UberProfile()),
                      );
                    }, // button pressed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.person), // icon/ t
                        Text('Profile'), // ext
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
