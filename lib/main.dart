import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:my_app/Customer_Store_View/store_view_from_customer.dart';
import 'package:my_app/Customer/customer_homepage.dart';

import 'package:my_app/MainPages/TeamConnected.dart';
import 'package:my_app/PagesAuth/Login/login_method.dart';
import 'package:my_app/backend/business.dart';
import 'MainPages/WelcomePage.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Authentication/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CurrentUser(),
        ),
        ChangeNotifierProvider(
          create: (context) => CurrentBusiness(),
        ),
      ],
      child: MaterialApp(
        title: 'Resta',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WelcomePage(),
      ),
    );
  }
}
