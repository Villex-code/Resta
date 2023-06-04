import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' if (dart.library.html) 'dart:html';
import 'package:flutter/material.dart';

class CurrentBusiness extends ChangeNotifier {
  User? _user;
  DocumentReference? _userDoc;
  String? currCategoryName = 'Select category';

  CollectionReference users = FirebaseFirestore.instance.collection('business');
  String? role;
  String? businessId;
  User? get user => _user;
  String? language = 'english';

  CurrentUser({User? user}) {
    setUser(user);
  }

  Future<void> setUser(User? newUser) async {
    _user = newUser;

    if (_user != null) {
      // // Get the worker's document from the 'workers' collection

      // DocumentSnapshot workerDoc = await FirebaseFirestore.instance
      //     .collection('workers')
      //     .doc(_user!.uid)
      //     .get();
      // print(_user!.uid);

      // // Get the businessId field from the worker's document
      // String businessId = workerDoc.get('businessId');
      // role = workerDoc.get('role');
      // setBusiness(_user!.uid); TODO : Uncomment this in the production
      setBusiness("ZTw3ioV74QVveKEYHIQ1");
    } else {
      _userDoc = null;
    }
    notifyListeners();
  }

  Future<void> setBusiness(String? businessId) async {
    if (businessId != null) {
      try {
        _userDoc =
            FirebaseFirestore.instance.collection('business').doc(businessId);
        this.businessId = businessId;
      } catch (e) {
        print("Could not setBusiness as $businessId");
        print(e);
      }
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

  Future<void> registerUser(User user) async {
    CollectionReference workers =
        FirebaseFirestore.instance.collection('workers');

    // Assuming you have some information to add to the workers collection
    var workerData = {
      'name': user.displayName,
      'email': user.email,
      'role': "Employee",
      'businessId': ["iu2OfQnIPy2jMk8NTyj"]
    };

    // Set the new worker document in the workers collection with user's uid
    await workers.doc(user.uid).set(workerData);

    // Get the document we just created
    DocumentSnapshot workerSnapshot = await workers.doc(user.uid).get();

    // Get the businessId from the worker's document
    String businessId = workerSnapshot['businessId'];
    role = workerSnapshot['role'];

    // Get the business document based on the businessId
    _userDoc =
        FirebaseFirestore.instance.collection('business').doc(businessId);

    notifyListeners();
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
  //  -------------- ANALYTICS OPERATIONS -----------
  //  -------------- ANALYTICS OPERATIONS -----------
  //  -------------- ANALYTICS OPERATIONS -----------

  Future<void> checkAndUpdateAnalytics_today() async {
    final analyticsRef = _userDoc!.collection('analytics').doc('today');
    final analyticsSnapshot = await analyticsRef.get();
    final analyticsData = analyticsSnapshot.data() as Map<String, dynamic>;

    final serverDate = (analyticsData['date'] as Timestamp).toDate();
    final now = DateTime.now();

    // If the dates are different, back up the data points to yesterday and reset today
    if (serverDate.day != now.day ||
        serverDate.month != now.month ||
        serverDate.year != now.year) {
      // First back up today's data to yesterday if the difference is exactly 1 day
      if (now.difference(serverDate).inDays == 1) {
        final yesterdayRef = _userDoc!.collection('analytics').doc('yesterday');
        await yesterdayRef.update({
          'date': Timestamp.fromDate(DateTime(
              serverDate.year,
              serverDate.month,
              serverDate
                  .day)), // Set date to server date (which was 'today' but now is 'yesterday')
          'revenue': analyticsData['revenue'],
          'orders': analyticsData['orders'],
        });
      }

      // Then reset today's data
      return analyticsRef.update({
        'date': Timestamp.fromDate(DateTime(now.year, now.month, now.day)),
        'revenue': List.filled(24, 0.0),
        'orders': List.filled(24, 0),
      });
    }
  }

  Future<void> checkAndUpdateAnalytics_yesterday() async {
    final analyticsRef = _userDoc!.collection('analytics').doc('yesterday');
    final analyticsSnapshot = await analyticsRef.get();
    final analyticsData = analyticsSnapshot.data() as Map<String, dynamic>;

    final serverDate = (analyticsData['date'] as Timestamp).toDate();
    final now = DateTime.now();

    // If the date is exactly 1 day ago, run the checkAndUpdateAnalytics_today function
    if (now.difference(serverDate).inDays == 1) {
      return checkAndUpdateAnalytics_today();
    }
    // If the date is more than 1 day ago, reset the data points
    else if (now.difference(serverDate).inDays > 1) {
      return analyticsRef.update({
        'date': Timestamp.fromDate(DateTime(
            now.year, now.month, now.day - 1)), // Set date to yesterday
        'revenue': List.filled(24, 0.0),
        'orders': List.filled(24, 0),
      });
    }
  }

  Future<void> checkAndUpdateAnalytics_7days() async {
    final analyticsRef = _userDoc!.collection('analytics').doc('last_7_days');
    final analyticsSnapshot = await analyticsRef.get();
    final analyticsData = analyticsSnapshot.data() as Map<String, dynamic>;

    final serverDate = (analyticsData['date'] as Timestamp).toDate();
    final now = DateTime.now();

    int dayDifference = now.difference(serverDate).inDays;

    // Check if the date is more than 6 days ago, reset the data points
    if (dayDifference > 6) {
      return analyticsRef.update({
        'date': Timestamp.fromDate(DateTime(now.year, now.month, now.day)),
        'revenue': List.filled(7, 0.0),
        'orders': List.filled(7, 0),
      });
    } else {
      List<dynamic> oldRevenue = analyticsData['revenue'];
      List<dynamic> oldOrders = analyticsData['orders'];

      // Shift the data points by the difference in days
      List<dynamic> newRevenue = List.filled(7, 0.0);
      List<dynamic> newOrders = List.filled(7, 0);
      for (int i = 0; i < (7 - dayDifference); i++) {
        newRevenue[i] = oldRevenue[i + dayDifference];
        newOrders[i] = oldOrders[i + dayDifference];
      }

      return analyticsRef.update({
        'date': Timestamp.fromDate(DateTime(now.year, now.month, now.day)),
        'revenue': newRevenue,
        'orders': newOrders,
      });
    }
  }

  Future<void> checkAndUpdateAnalytics_30days() async {
    final analyticsRef = _userDoc!.collection('analytics').doc('last_30_days');
    final analyticsSnapshot = await analyticsRef.get();
    final analyticsData = analyticsSnapshot.data() as Map<String, dynamic>;

    final serverDate = (analyticsData['date'] as Timestamp).toDate();
    final now = DateTime.now();

    int dayDifference = now.difference(serverDate).inDays;

    // Check if the date is more than 29 days ago, reset the data points
    if (dayDifference > 29) {
      return analyticsRef.update({
        'date': Timestamp.fromDate(DateTime(now.year, now.month, now.day)),
        'revenue': List.filled(30, 0.0),
        'orders': List.filled(30, 0),
      });
    } else {
      List<dynamic> oldRevenue = analyticsData['revenue'];
      List<dynamic> oldOrders = analyticsData['orders'];

      // Shift the data points by the difference in days
      List<dynamic> newRevenue = List.filled(30, 0.0);
      List<dynamic> newOrders = List.filled(30, 0);
      for (int i = 0; i < (30 - dayDifference); i++) {
        newRevenue[i] = oldRevenue[i + dayDifference];
        newOrders[i] = oldOrders[i + dayDifference];
      }

      return analyticsRef.update({
        'date': Timestamp.fromDate(DateTime(now.year, now.month, now.day)),
        'revenue': newRevenue,
        'orders': newOrders,
      });
    }
  }

  Future<void> checkAndUpdateAnalytics_lastYear() async {
    final analyticsRef = _userDoc!.collection('analytics').doc('last_year');
    final analyticsSnapshot = await analyticsRef.get();
    final analyticsData = analyticsSnapshot.data() as Map<String, dynamic>;

    final serverDate = (analyticsData['date'] as Timestamp).toDate();
    final now = DateTime.now();

    int monthDifference = differenceInMonths(now, serverDate);

    // Check if the date is more than 11 months ago, reset the data points
    if (monthDifference > 11) {
      return analyticsRef.update({
        'date': Timestamp.fromDate(DateTime(now.year, now.month, now.day)),
        'revenue': List.filled(12, 0.0),
        'orders': List.filled(12, 0),
      });
    } else {
      List<dynamic> oldRevenue = analyticsData['revenue'];
      List<dynamic> oldOrders = analyticsData['orders'];

      // Shift the data points by the difference in months
      List<dynamic> newRevenue = List.filled(12, 0.0);
      List<dynamic> newOrders = List.filled(12, 0);
      for (int i = 0; i < (12 - monthDifference); i++) {
        newRevenue[i] = oldRevenue[i + monthDifference];
        newOrders[i] = oldOrders[i + monthDifference];
      }

      return analyticsRef.update({
        'date': Timestamp.fromDate(DateTime(now.year, now.month, now.day)),
        'revenue': newRevenue,
        'orders': newOrders,
      });
    }
  }

  int differenceInMonths(DateTime date1, DateTime date2) {
    return (date1.year - date2.year) * 12 + date1.month - date2.month;
  }

  Future<Map<String, dynamic>> getAnalyticsData(String timeframe) async {
    final formattedTimeframe = timeframe.toLowerCase().replaceAll(' ', '_');

    if (formattedTimeframe == 'today') {
      await checkAndUpdateAnalytics_today();
    } else if (formattedTimeframe == 'yesterday') {
      await checkAndUpdateAnalytics_yesterday();
    } else if (formattedTimeframe == 'last_7_days') {
      await checkAndUpdateAnalytics_7days();
    } else if (formattedTimeframe == 'last_30_days') {
      await checkAndUpdateAnalytics_30days();
    } else if (formattedTimeframe == 'last_year') {
      await checkAndUpdateAnalytics_lastYear();
    }
    // Add more else if statements if you have other timeframes that need to call different functions

    final analyticsRef =
        _userDoc!.collection('analytics').doc(formattedTimeframe.toLowerCase());
    final analyticsSnapshot = await analyticsRef.get();
    return analyticsSnapshot.data() as Map<String, dynamic>? ?? {};
  }

  Future<void> setAnalyticsData(
      String documentId, Map<String, dynamic> data) async {
    try {
      final formattedDocumentId = documentId.replaceAll(' ', '_');
      await _userDoc
          ?.collection('analytics')
          .doc(formattedDocumentId)
          .set(data);
    } catch (e) {
      print("Failed to set analytics data: $e");
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

  void setCurrCategoryName(String name) {
    this.currCategoryName = name;
    notifyListeners();
  }

  Future<Map<String, dynamic>> getBusinessStructure(String businessId) async {
    DocumentReference businessDoc =
        FirebaseFirestore.instance.collection('business').doc(businessId);
    DocumentSnapshot businessSnapshot = await businessDoc.get();
    if (!businessSnapshot.exists) {
      throw Exception('Business not found');
    }

    Map<String, dynamic> businessData =
        businessSnapshot.data() as Map<String, dynamic>;

    QuerySnapshot categoriesSnapshot =
        await businessDoc.collection('categories').get();
    Map<String, dynamic> categoriesData = {};
    for (QueryDocumentSnapshot categoryDoc in categoriesSnapshot.docs) {
      Map<String, dynamic> categoryData =
          categoryDoc.data() as Map<String, dynamic>;

      QuerySnapshot itemsSnapshot =
          await categoryDoc.reference.collection('items').get();
      Map<String, dynamic> itemsData = {};
      for (QueryDocumentSnapshot itemDoc in itemsSnapshot.docs) {
        itemsData[itemDoc.id] = itemDoc.data();
      }

      categoryData['items'] = itemsData;
      categoriesData[categoryDoc.id] = categoryData;
    }

    businessData['categories'] = categoriesData;

    return businessData;
  }

  Future<List<MyCategory>> getCategoriesWithDetails() async {
    if (_userDoc != null) {
      try {
        QuerySnapshot querySnapshot = await _userDoc!
            .collection('categories')
            .orderBy('position') // to sort by position
            .get();

        List<MyCategory> categories = [];
        for (var doc in querySnapshot.docs) {
          String? pictureURL;
          try {
            pictureURL = await FirebaseStorage.instance
                .ref()
                .child('business/$businessId/categories/${doc.id}/picture.jpg')
                .getDownloadURL();
          } catch (e) {
            print("There was an issue getting the picture URL $e");
            pictureURL = null;
          }

          String? name;
          try {
            name = doc.get('name_$language') as String?;
          } catch (e) {
            print("There was an issue getting the name: $e");
            name = null;
          }
          categories.add(
            MyCategory(
              id: doc.id,
              name: name, // assuming the name field is 'name'
              pictureURL: pictureURL,
            ),
          );
        }

        return categories;
      } catch (e) {
        print("Error reading categories: $e");
        throw e;
      }
    } else {
      throw Exception('No business to read categories for');
    }
  }

  Future<List<String>> getItemsInCategory(String categoryId) async {
    if (_userDoc != null) {
      try {
        QuerySnapshot querySnapshot = await _userDoc!
            .collection('categories')
            .doc(categoryId)
            .collection('items')
            .get();

        List<String> itemIds = [];
        for (var doc in querySnapshot.docs) {
          itemIds.add(doc.id);
        }

        return itemIds;
      } catch (e) {
        print("Error reading items: $e");
        throw e;
      }
    } else {
      throw Exception('No business to read items for');
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getWholeItemInfo(
      String categoryId, String itemId) async {
    if (_userDoc != null) {
      try {
        DocumentSnapshot<Map<String, dynamic>> docSnapshot = await _userDoc!
            .collection("categories")
            .doc(categoryId)
            .collection('items')
            .doc(itemId)
            .get();

        if (docSnapshot.exists) {
          return docSnapshot;
        } else {
          throw Exception('Item not found');
        }
      } catch (e) {
        print("Error reading item: $e");
        throw e;
      }
    } else {
      throw Exception('No business to read item for');
    }
  }
}

class MyCategory {
  String id;
  String? name;
  String? pictureURL;

  MyCategory({required this.id, required this.name, required this.pictureURL});
}
