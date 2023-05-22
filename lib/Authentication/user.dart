import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' if (dart.library.html) 'dart:html';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  User? _user;
  DocumentReference? _userDoc;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  User? get user => _user;

  CurrentUser({User? user}) {
    setUser(user);
  }

  Future<void> setUser(User? newUser) async {
    _user = newUser;
    if (_user != null) {
      _userDoc = users.doc(_user!.uid);
    } else {
      _userDoc = null;
    }
    notifyListeners();
  }

  void unsetUser() {
    _user = null;
    _userDoc = null;
    notifyListeners();
  }

  Stream<DocumentSnapshot> get userDocStream {
    if (_userDoc != null) {
      return _userDoc!.snapshots();
    } else {
      // Return an empty stream
      return Stream<DocumentSnapshot>.empty();
    }
  }

  Stream<QuerySnapshot> subCollectionStream(String subCollectionName) {
    if (_userDoc != null) {
      final CollectionReference subCollectionRef =
          _userDoc!.collection(subCollectionName);
      return subCollectionRef.snapshots().handleError((error) {
        print('Error reading sub-collection "$subCollectionName": $error');
        // Return an empty stream if the sub-collection doesn't exist or encounters an error
        return Stream<QuerySnapshot>.empty();
      });
    } else {
      // Return an empty stream
      return Stream<QuerySnapshot>.empty();
    }
  }

  Future<void> setData(Map<String, dynamic> data) async {
    if (_userDoc != null) {
      return _userDoc!.set(data, SetOptions(merge: true));
    }
    throw Exception('No user to set data for');
  }

  Future<dynamic> readData(String key) async {
    if (_userDoc != null) {
      try {
        DocumentSnapshot userSnapshot = await _userDoc!.get();

        Map<String, dynamic>? data =
            userSnapshot.data() as Map<String, dynamic>?;

        if (data != null && data.containsKey(key)) {
          return data[key];
        } else {
          print("Key not found in data: $key");
          return null;
        }
      } catch (e) {
        print("Error reading user data: $e");
        return null;
      }
    } else {
      throw Exception('No user to read data for');
    }
  }

  Future<QuerySnapshot> readSubCollectionData(String subCollectionName) async {
    if (_userDoc != null) {
      try {
        return await _userDoc!.collection(subCollectionName).get();
      } catch (e) {
        print("Error reading user sub-collection data: $e");
        throw e;
      }
    } else {
      throw Exception('No user to read sub-collection data for');
    }
  }

  Future<void> uploadProfilePicture(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File image = File(pickedFile.path);
      try {
        // Create a reference to the location you want to upload to in Firebase Storage
        Reference storageReference =
            FirebaseStorage.instance.ref().child('users/${_user?.uid}');

        // Upload the file to Firebase Storage
        await storageReference.putFile(image);

        // After the upload is complete, call setState to rebuild the widget.
        // This will cause the FutureBuilder to be run again, and hence
        // the new image to be displayed.
      } catch (e) {
        // e.g, e.code == 'canceled'
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to upload image: $e')));
      }
    }
  }
}
