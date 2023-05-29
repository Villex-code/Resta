import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:my_app/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/Authentication/UserDocBuilder.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  Future<String?> getDownloadURL(String businessId) async {
    try {
      final ref = FirebaseStorage.instance
          .ref('business/$businessId/profile_picture.jpg');
      String url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      // Log the error or handle it as appropriate for your needs.
      print("Failed to fetch image URL for businessId: $businessId, error: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.03, // Left padding
                  0, // Top padding
                  MediaQuery.of(context).size.width * 0.03, // Right padding
                  0, // Bottom padding
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: BackButton(),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: "Reviews"
                          .text
                          .bold
                          .size(context.screenWidth * 0.046)
                          .make(),
                    ),
                  ],
                ),
              ),
              "Explore Your Past Reviews and Inspire the Community to Continuously Improve and Serve You Better"
                  .text
                  .center
                  .make()
                  .box
                  .p16
                  .make(),
              UserDocBuilder(
                collectionName: 'reviews',
                builder: (BuildContext context, dynamic documents) {
                  // Cast documents to List<DocumentSnapshot> if necessary
                  final List<DocumentSnapshot> documentList =
                      documents as List<DocumentSnapshot>;
                  return Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: documentList.length,
                        itemBuilder: (context, index) {
                          // Access individual review document
                          final reviewData = documentList[index].data()
                              as Map<String, dynamic>;
                          final rating = reviewData['rating'];
                          final message = reviewData['message'];
                          final id = reviewData['businessId'];
                          final name = reviewData['name'] as String?;
                          final address = reviewData['address'] as String?;
                          final imageUrl = reviewData['imageUrl'] as String?;
                          final price = reviewData['price'] as String?;
                          final order = reviewData['order'] as String?;
                          final orderTotal =
                              reviewData['orderTotal'] as String?;
                          final paymentMethod =
                              reviewData['paymentMethod'] as String?;
                          final time = reviewData['time'] as Timestamp?;

                          final orderDisplay = order ?? "No order found";
                          final orderTotalDisplay = orderTotal ?? "";
                          final paymentMethodDisplay =
                              paymentMethod ?? "No payment method found";

                          final ratingDisplay = rating != null
                              ? rating.toString()
                              : 'Rating not found';
                          final messageDisplay = message ?? "No message";

                          final displayId = id ?? 'ID not found';
                          final displayName = name ?? 'Name not found';
                          final displayAddress = address ?? 'Address not found';
                          final displayImageUrl =
                              imageUrl ?? 'Image URL not found';

                          final displayTime =
                              time ?? Timestamp.fromDate(DateTime.now());

                          return FutureBuilder<String?>(
                            future: getDownloadURL(displayId),
                            builder: (BuildContext context,
                                AsyncSnapshot<String?> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator(); // or your placeholder widget
                              } else {
                                if (snapshot.hasError) {
                                  print('Error: ${snapshot.error}');
                                }
                                String myurl =
                                    snapshot.data ?? "No image found";

                                return ListTile(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(displayId),
                                      Text(displayName),
                                      Text(displayId),
                                      Text(displayAddress),
                                      Text(messageDisplay),
                                      Text(ratingDisplay),
                                      Text(myurl),
                                    ],
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
