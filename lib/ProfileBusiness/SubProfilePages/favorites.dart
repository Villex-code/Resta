import 'package:flutter/material.dart';
import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_app/theme/app_theme.dart';
import 'package:my_app/Authentication/UserDocBuilder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class Restaurant {
  final String id;
  final String name;
  final String address;
  final String imageUrl;
  final String phone;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.phone,
  });
}

class _FavoritesState extends State<Favorites> {
  // Mock data for restaurants
  // final List<Restaurant> restaurants = [
  //   Restaurant(
  //     name: 'Restaurant One',
  //     availability: 'Available',
  //     imageUrl: 'assets/profile_image.webp',
  //     orders: 1,
  //   ),
  //   Restaurant(
  //     name: 'Restaurant Two',
  //     availability: 'Available',
  //     imageUrl: 'assets/profile_image.webp',
  //     orders: 2,
  //   ),
  //   Restaurant(
  //     name: 'Restaurant Three efa container',
  //     availability: 'Closed',
  //     imageUrl: 'assets/profile_image.webp',
  //     orders: 3,
  //   ),
  //   Restaurant(
  //     name: 'Restaurant Four',
  //     availability: 'Closed',
  //     imageUrl: 'assets/profile_image.webp',
  //     orders: 4,
  //   ),
  //   Restaurant(
  //     name: 'Restaurant Five',
  //     availability: 'Available',
  //     imageUrl: 'assets/profile_image.webp',
  //     orders: 5,
  //   ),
  //   Restaurant(
  //     name: 'Restaurant Six',
  //     availability: 'Closed',
  //     imageUrl: 'assets/profile_image.webp',
  //     orders: 6,
  //   ),
  //   Restaurant(
  //     name: 'Restaurant Seven',
  //     availability: 'Available',
  //     imageUrl: 'assets/profile_image.webp',
  //     orders: 7,
  //   ),
  //   Restaurant(
  //     name: 'Restaurant Eight',
  //     availability: 'Closed',
  //     imageUrl: 'assets/profile_image.webp',
  //     orders: 8,
  //   ),
  // ];
  Future<String?> fetchImageURL(String businessId) async {
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
    final currentUser = Provider.of<CurrentBusiness>(context, listen: false);
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
                      child: "Your Favorites"
                          .text
                          .bold
                          .size(context.screenWidth * 0.045)
                          .make(),
                    ),
                  ],
                ),
              ),
              (context.screenHeight * 0.02).heightBox,

              // VxBox(
              //   // Adjust this value as needed
              //   child: Padding(
              //     padding: EdgeInsets.fromLTRB(context.screenWidth * 0.042, 0,
              //         context.screenWidth * 0.042, 0),
              //     child: ListView.builder(
              //       itemCount: restaurants.length,
              //       itemBuilder: (context, index) {
              //         return store(context, restaurants[index]);
              //       },
              //     ),
              //   ),
              // ).size(context.screenWidth, context.screenHeight * 0.875).make(),
              "Explore your past favorite experiences".text.make(),
              (20).heightBox,
              UserDocBuilder(
                collectionName: 'main',
                builder: (BuildContext context, dynamic userData) {
                  if (userData == null) {
                    return Text("No user data");
                  }

                  final Map<String, dynamic>? userDataMap =
                      (userData as DocumentSnapshot).data()
                          as Map<String, dynamic>?;

                  List<String>? favorites =
                      (userDataMap?['favorites'] as List<dynamic>?)
                          ?.cast<String>();

                  return Column(
                    children: [
                      if (favorites != null && favorites.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: favorites.length,
                          itemBuilder: (context, index) {
                            return FutureBuilder<DocumentSnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection('business')
                                  .doc(favorites[index])
                                  .get(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text("Something went wrong");
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic>? data = snapshot.data
                                      ?.data() as Map<String, dynamic>?;

                                  if (data != null) {
                                    return FutureBuilder<String?>(
                                      future: fetchImageURL(favorites[index]),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<String?> snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          String imageUrl =
                                              snapshot.data ?? "Default URL";
                                          Restaurant myrest = Restaurant(
                                            id: favorites[index],
                                            name: data['name'] ??
                                                "Could not find name",
                                            address: data['address'] ??
                                                "Could not find address",
                                            imageUrl: imageUrl,
                                            phone: data['phoneNumber'] ??
                                                "Could not find phoneNumber",
                                          );
                                          return store(context, myrest);
                                        }

                                        if (snapshot.hasError) {
                                          return Text(
                                              'Failed to fetch image for ${favorites[index]}');
                                        }

                                        return CircularProgressIndicator();
                                      },
                                    );
                                  } else {
                                    return (0).heightBox;
                                  }
                                }

                                return CircularProgressIndicator();
                              },
                            );
                          },
                        )
                      else
                        Text("Not favorites yet"),
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

  Widget store(BuildContext context, Restaurant restaurant) {
    // Function to remove a business from favorites
    Future<void> removeFromFavorites(String businessId, String userId) async {
      try {
        FirebaseFirestore.instance.collection('users').doc(userId).update({
          'favorites': FieldValue.arrayRemove([businessId])
        });
      } catch (e) {
        print("Error removing from favorites: $e");
      }
    }

    final currentUser = Provider.of<CurrentUser>(context, listen: false);
    return VxBox(
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: Image.network(
                  restaurant.imageUrl,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/burger_square.jpeg');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.008,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.579,
                            child: Text(
                              restaurant.name,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.049,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          restaurant.address.text
                              .color(AppTheme.colors.grey)
                              .make(),
                          restaurant.phone.text
                              .color(AppTheme.colors.grey)
                              .make(),
                        ],
                      ),
                    ).make(),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: context.screenWidth * 0.01,
            right: context.screenWidth * 0.02,
            child: InkWell(
              onTap: () async {
                await removeFromFavorites(restaurant.id, currentUser.user!.uid);
              },
              child: Icon(
                Icons.favorite,
                color: AppTheme.colors.pink,
              ),
            ),
          )
        ],
      ),
    )
        .size(
          context.screenWidth * 0.8,
          115,
        )
        .roundedSM
        .shadowSm
        .white
        .margin(
          EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.017,
              left: context.screenWidth * 0.02,
              right: context.screenWidth * 0.02),
        )
        .make();
  }
}
