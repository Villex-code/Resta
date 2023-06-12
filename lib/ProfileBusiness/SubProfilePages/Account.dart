import 'package:flutter/material.dart';
import 'package:my_app/Authentication/UserDocBuilder.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:my_app/PagesAuth/Login/login_method.dart';
import 'package:my_app/Profile/SubProfilePages/IndividualInfo.dart';
import 'package:my_app/backend/BusinessDocBuilder.dart';
import 'package:my_app/backend/business.dart';

import 'package:provider/provider.dart';

import 'package:velocity_x/velocity_x.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' if (dart.library.html) 'dart:html';

class Profile_Account extends StatefulWidget {
  const Profile_Account({Key? key}) : super(key: key);

  @override
  State<Profile_Account> createState() => _Profile_AccountState();
}

class _Profile_AccountState extends State<Profile_Account> {
  double modalHeight = 0.5;

  void _handleScreenTap() {
    FocusScope.of(context).unfocus(); // Dismiss the keyboard
    setState(() {
      modalHeight = 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentBusiness>(context, listen: false);

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('users/${currentUser.user?.uid}');

    // Add this function in your class
    Future<String?> _getImageURL(Reference ref) async {
      try {
        return await ref.getDownloadURL();
      } catch (e) {
        // This will catch errors when the file does not exist
        return null;
      }
    }

    return Scaffold(
      body: SafeArea(
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: BackButton(),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: "Account"
                          .text
                          .bold
                          .size(context.screenWidth * 0.05)
                          .make(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  FutureBuilder(
                    future: _getImageURL(ref),
                    builder: (BuildContext context,
                        AsyncSnapshot<String?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError || snapshot.data == null) {
                        // Replace this with the path to your default image in your assets folder
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Image.asset(
                            'assets/profile_image.webp',
                            height: MediaQuery.of(context).size.width * 0.24,
                            width: MediaQuery.of(context).size.width * 0.24,
                          ),
                        );
                      }
                      return CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data!),
                        radius: MediaQuery.of(context).size.width * 0.18,
                      );
                    },
                  ),
                  Container(
                    height: context.screenWidth * 0.08,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      iconSize: context.screenWidth * 0.04,
                      onPressed: () async {
                        await currentUser.uploadProfilePicture(context);
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),

              (context.screenHeight * 0.03).heightBox,
              "Basic Info".text.bold.size(context.screenWidth * 0.06).make(),
              (context.screenHeight * 0.02).heightBox,

              BusinessDocBuilder(
                collectionName: 'main',
                builder: (BuildContext context, dynamic userData) {
                  if (userData == null) {
                    return Text("No user data");
                  }

                  final Map<String, dynamic>? userDataMap =
                  (userData as DocumentSnapshot).data()
                  as Map<String, dynamic>?;

                  if (userDataMap == null) {
                    return Text("No user data");
                  }

                  String? name = userDataMap['name'] as String?;
                  String? email = userDataMap['email'] as String?;
                  String? phoneNumber = userDataMap['phoneNumber'] as String?;
                  String? address = userDataMap['address'] as String?;
                  String? coordinateX = userDataMap['coordinateX'] as String?;
                  String? coordinateY = userDataMap['coordinateY'] as String?;

                  return Column(
                    children: [
                      ProfileEditField(
                        title: 'Name',
                        fieldKey: 'name',
                        placeholder: name ?? 'Not set yet',
                        verified: false,
                        onTapOutside: () {
                          _handleScreenTap();
                        },
                      ),
                      ProfileEditField(
                        title: 'Email',
                        fieldKey: 'email',
                        placeholder: email ?? 'Not set yet',
                        verified: true,
                        onTapOutside: () {
                          _handleScreenTap();
                        },
                      ),
                      ProfileEditField(
                        title: 'Phone Number',
                        fieldKey: 'phoneNumber',
                        placeholder: phoneNumber ?? 'Not set yet',
                        verified: false,
                        onTapOutside: () {
                          _handleScreenTap();
                        },
                      ),
                      ProfileEditField(
                        title: 'Address',
                        fieldKey: 'address',
                        placeholder: address ?? 'Not set yet',
                        verified: true,
                        onTapOutside: () {
                          _handleScreenTap();
                        },
                      ),
                      ProfileEditField(
                        title: 'CoordinateX',
                        fieldKey: 'coordinateX',
                        placeholder: coordinateX ?? 'Not set yet',
                        verified: true,
                        onTapOutside: () {
                          _handleScreenTap();
                        },
                      ),
                      ProfileEditField(
                        title: 'CoordinateY',
                        fieldKey: 'coordinateY',
                        placeholder: coordinateY ?? 'Not set yet',
                        verified: true,
                        onTapOutside: () {
                          _handleScreenTap();
                        },
                      ),
                    ],
                  );
                },
              ),

              // THIS IS THE BOTTOM
              // YOU DONT HAVE TO CHANGE IT FOR NOW

              // ... other widgets here

              // Add this line
              (context.screenHeight * 0.05).heightBox,
              OutlinedButton(
                onPressed: () {
                  currentUser.unsetUser(); // Set user to null
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginMethod()),
                        (route) =>
                    false, // removes all previous routes in the stack
                  );
                  print('Signed out');
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% of screen's width
                  height: MediaQuery.of(context).size.width *
                      0.14, // 6% of screen's height
                  alignment: Alignment.center,
                  child: "Sign Out"
                      .text
                      .size(context.screenWidth * 0.045)
                      .black
                      .makeCentered(),
                ),
              ),
              (context.screenHeight * 0.02).heightBox,
              "v1.0".text.make(),
            ],
          ),
        ),
      ),
    );
  }
}
