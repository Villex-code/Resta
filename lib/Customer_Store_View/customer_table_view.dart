import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'chooseFromListView.dart';

class CustomerTableView extends StatefulWidget {
  final String id;
  const CustomerTableView({super.key, required this.id});

  @override
  State<CustomerTableView> createState() => _CustomerTableViewState();
}

class _CustomerTableViewState extends State<CustomerTableView> {
  Future<String?> _getMenuURL(String businessId) async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('business')
          .doc(businessId)
          .get();

      final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return data['menu'];
    } catch (e) {
      print('Error retrieving menu URL: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentBusiness =
        Provider.of<CurrentBusiness>(context, listen: false);
    return Container(
      width: 390,
      height: 850, //ALLAZW AYTO GIA NA MEGALWSEI TE KENO METAJY KRATISI
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 242, 245, 245),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: FutureBuilder<String?>(
                  future: _getMenuURL(currentBusiness.businessId!),
                  builder:
                      (BuildContext context, AsyncSnapshot<String?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text('Error loading menu URL');
                    }

                    final String? menuURL = snapshot.data;
                    final hasMenuURL = menuURL != null && menuURL.isNotEmpty;

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: GestureDetector(
                            onTap: hasMenuURL
                                ? () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          child: SizedBox(
                                            child: Image.network(
                                              menuURL!,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Center(
                                                  child: Text(
                                                      'Failed to load menu image'),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                : null,
                            child: Container(
                              width: 65,
                              height: 65,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Color.fromARGB(255, 201, 201, 201)),
                              ),
                              child: hasMenuURL
                                  ? Image.network(
                                      'https://cdn-icons-png.flaticon.com/512/4677/4677389.png',
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(Icons.image_not_supported),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'MENU',
                            //style:FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Text(
                        'TABLE VIEW',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 700,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 245, 245)),
                      child: Stack(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 7, 0, 30),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Container(
                                // width: 200,
                                // height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FutureBuilder<String?>(
                                      future: currentBusiness
                                          .getTableViewPicture('table_view'),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<String?> snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        }

                                        if (snapshot.hasError) {
                                          return Text(
                                              'Error loading table view image');
                                        }

                                        final String? tableViewImageURL =
                                            snapshot.data;

                                        if (tableViewImageURL != null) {
                                          return Image.network(
                                            tableViewImageURL,
                                            height: 250,
                                            width: context.screenWidth,
                                            fit: BoxFit.fill,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              // If an error occurred while loading the image, return the asset image
                                              return Image.asset(
                                                'assets/table_view.jpeg',
                                                height: 250,
                                                width: context.screenWidth,
                                                fit: BoxFit.fill,
                                              );
                                            },
                                          );
                                        } else {
                                          return Image.asset(
                                            'assets/table_view.jpeg',
                                            height: 250,
                                            width: context.screenWidth,
                                            fit: BoxFit.fill,
                                          ); // Replace with your placeholder asset image
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 2, 8, 10),
                                      child: Container(
                                        width: context.screenWidth * 0.7,
                                        height: 350,
                                        decoration: BoxDecoration(
                                            //color
                                            ),
                                        child: ButtonList(id: widget.id),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
