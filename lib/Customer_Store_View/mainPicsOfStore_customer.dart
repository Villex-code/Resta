import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class MainPicsOfStore_Customer extends StatefulWidget {
  @override
  State<MainPicsOfStore_Customer> createState() =>
      MainPicsOfStore_CustomerState();
}

class MainPicsOfStore_CustomerState extends State<MainPicsOfStore_Customer> {
  @override
  Widget build(BuildContext context) {
    final currentBusiness =
        Provider.of<CurrentBusiness>(context, listen: false);
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 290,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
              child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('business')
                    .doc(currentBusiness.businessId)
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError || !snapshot.hasData) {
                    return Text("Error loading data");
                  }

                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  List<String> pictureUrls = data.containsKey('pictures')
                      ? List<String>.from(data['pictures'])
                      : [];

                  return PageView(
                    controller: PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: pictureUrls.map((url) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: FadeInImage.assetNetwork(
                          placeholder:
                              'assets/placeholder.png', // local placeholder image
                          image: url,
                          fit: BoxFit.cover,
                          width: 300,
                          height: 200,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              'https://toohotel.com/wp-content/uploads/2022/09/TOO_restaurant_Panoramique_vue_Paris_Seine_Tour_Eiffel_2.jpg',
                              width: 300,
                              height: 200,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
