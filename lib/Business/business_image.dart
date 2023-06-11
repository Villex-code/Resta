import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Business/business_add_table.dart';
import 'package:my_app/Business/business_menu.dart';
import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';

import 'package:velocity_x/velocity_x.dart';

class BusinessImage extends StatefulWidget {
  const BusinessImage({Key? key}) : super(key: key);

  @override
  State<BusinessImage> createState() => _BusinessImageState();
}

class _BusinessImageState extends State<BusinessImage> {
  Future<DocumentSnapshot> fetchBusinessData(String businessId) async {
    return FirebaseFirestore.instance
        .collection('business')
        .doc(businessId)
        .get();
  }

  Future<void> removePicture(String businessId, String pictureUrl) async {
    final doc =
        FirebaseFirestore.instance.collection('business').doc(businessId);

    await doc.update({
      'pictures': FieldValue.arrayRemove([pictureUrl]),
    });

    // Refresh UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentBusiness =
        Provider.of<CurrentBusiness>(context, listen: false);

    return FutureBuilder<DocumentSnapshot>(
      future: fetchBusinessData(currentBusiness.businessId!),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        List<dynamic> tableViews = data.containsKey('pictures')
            ? List.from(data['pictures'])
            : ['https://picsum.photos/seed/314/600'];

        return Container(
          width: 396,
          height: 290,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [

              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 290,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                        child: PageView(
                          controller: PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: tableViews.map<Widget>((tableView) {
                            return Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    tableView,
                                    width: context.screenWidth,
                                    height: 200,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      // you can return your default image here
                                      return Image.network(
                                        'https://picsum.photos/seed/314/600', // Default image
                                        width: 300,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 10,
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      removePicture(currentBusiness.businessId!,
                                          tableView);
                                    },

                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
