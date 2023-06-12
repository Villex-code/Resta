import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:my_app/Profile/ProfileItem.dart';
import 'package:my_app/ProfileBusiness/SubProfilePages/Account.dart';
import 'package:my_app/ProfileBusiness/SubProfilePages/about_business.dart';
import 'package:my_app/ProfileBusiness/SubProfilePages/favorites.dart';
import 'package:my_app/ProfileBusiness/SubProfilePages/invite_friends.dart';
import 'package:my_app/ProfileBusiness/SubProfilePages/my_reviews.dart';
import 'package:my_app/ProfileBusiness/SubProfilePages/notifications.dart';
import 'package:my_app/ProfileBusiness/SubProfilePages/privacy.dart';
import 'package:my_app/ProfileBusiness/SubProfilePages/restaBusiness.dart';
import 'package:my_app/ProfileBusiness/SubProfilePages/support.dart';
import 'package:my_app/ProfileBusiness/SubProfilePages/notifications.dart';
import 'package:my_app/backend/business.dart';

import 'package:provider/provider.dart';

import 'package:velocity_x/velocity_x.dart';

import 'package:firebase_storage/firebase_storage.dart';

List<Map<String, dynamic>> profileItems = [
  {
    'name': 'Account',
    'icon': Icons.person,
    'destination': const Profile_Account()
  },
  {
    'name': 'Invite Friends',
    'icon': Icons.group_add,
    'destination': InviteFriends()
  },
  {'name': 'My Reviews', 'icon': Icons.star, 'destination': ReviewsPage()},
  {
    'name': 'Privacy',
    'icon': Icons.lock_outline,
    'destination': const Privacy()
  },
  {
    'name': 'Resta for Business',
    'icon': Icons.business,
    'destination': const OnSpotBusiness()
  },
  {
    'name': 'Notifications',
    'icon': Icons.notifications,
    'destination': const NotificationsPage()
  },
  {
    'name': 'Support',
    'icon': Icons.support_agent,
    'destination': SupportPage(),
  },
  {'name': 'About Resta', 'icon': Icons.info, 'destination': const About()},
];

class UberProfile extends StatefulWidget {
  const UberProfile({Key? key}) : super(key: key);

  @override
  State<UberProfile> createState() => _UberProfileState();
}

class _UberProfileState extends State<UberProfile> {
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentBusiness>(context, listen: false);

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('users/${currentUser.user?.uid}');

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Future<String?> _getImageURL(String businessId) async {
      try {
        DocumentSnapshot docSnap =
            await firestore.collection('business').doc(businessId).get();

        if (docSnap.exists) {
          Map<String, dynamic> data = docSnap.data() as Map<String, dynamic>;
          String? pictureURL =
              data.containsKey('picture_main') ? data['picture_main'] : null;
          return pictureURL;
        } else {
          print('No such document!');
          return null;
        }
      } catch (e) {
        // This will catch errors related to Firestore
        print(e);
        return null;
      }
    }

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
                      child: "Profile"
                          .text
                          .bold
                          .size(context.screenWidth * 0.05)
                          .make(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.03, // Left padding
                  0, // Top padding
                  MediaQuery.of(context).size.width * 0.03, // Right padding
                  0, // Bottom padding
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.03, // Left padding
                    0, // Top padding
                    MediaQuery.of(context).size.width * 0.03, // Right padding
                    0, // Bottom padding
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FutureBuilder(
                              future: currentUser.readData("name"),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text("Error: ${snapshot.error}");
                                } else {
                                  return VxBox(
                                    child: Text(
                                      snapshot.data ?? "Name not set",
                                      style: TextStyle(
                                          fontSize: context.screenWidth * 0.065,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ).make();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Profile_Account(),
                            ),
                          );
                          setState(() {});
                        },
                        child: FutureBuilder(
                          future: _getImageURL(currentUser.businessId!),
                          builder: (BuildContext context,
                              AsyncSnapshot<String?> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }
                            if (snapshot.hasError || snapshot.data == null) {
                              // Replace this with the path to your default image in your assets folder
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: Image.asset(
                                  'assets/profile_image.webp',
                                  height:
                                      MediaQuery.of(context).size.width * 0.20,
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                ),
                              );
                            }
                            return CircleAvatar(
                              backgroundImage: NetworkImage(snapshot.data!),
                              radius: MediaQuery.of(context).size.width * 0.12,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              (context.screenHeight * 0.02).heightBox,
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.01, // Left padding
                  0, // Top padding
                  MediaQuery.of(context).size.width * 0.01, // Right padding
                  0, // Bottom padding
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                ),
              ),
              (context.screenHeight * 0.02).heightBox,
              VxBox()
                  .size(context.screenWidth, context.screenHeight * 0.01)
                  .color(Colors.grey)
                  .make(),
              // Add profile items
              (context.screenHeight * 0.02).heightBox,
              ...profileItems.map((item) {
                return ProfileItem(
                  name: item['name'],
                  icon: item['icon'],
                  destination: item['destination'],
                );
              }).toList(),

              (context.screenHeight * 0.02).heightBox,
              "v1.0".text.make(),
              VxBox().size(10, 30).make()
            ],
          ),
        ),
      ),
    );
  }
}
