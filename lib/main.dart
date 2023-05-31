import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:my_app/Business/store_view.dart';
import 'package:my_app/Customer/customer_view.dart';

import 'package:my_app/PagesAuth/Login/login_method.dart';

import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:my_app/Authentication/auth.dart';

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
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        title: 'Resta',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SeeCustomer_View(),
      ),
    );
  }
}