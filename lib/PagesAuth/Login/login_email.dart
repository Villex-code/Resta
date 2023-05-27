import 'package:flutter/material.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:my_app/MainPages/Homepage.dart';

import 'package:my_app/theme/app_theme.dart';
import 'package:my_app/Authentication/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/services.dart';

class LoginEmailPage extends StatefulWidget {
  const LoginEmailPage({super.key});

  @override
  State<LoginEmailPage> createState() => _LoginEmailPageState();
}

class _LoginEmailPageState extends State<LoginEmailPage> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.03,
                0,
                MediaQuery.of(context).size.width * 0.03,
                MediaQuery.of(context).size.width * 0.03),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.02,
                        10,
                        MediaQuery.of(context).size.width * 0.03,
                        MediaQuery.of(context).size.height * 0.015),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [BackButton()],
                    ),
                  ),
                  Image.asset('assets/qrcode_logo_small.png',
                      height: MediaQuery.of(context).size.width * 0.22),
                  Text(
                    'Log in',
                    style: TextStyle(
                        color: AppTheme.colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Continue using your email.',
                    style:
                        TextStyle(color: AppTheme.colors.green, fontSize: 15),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => setState(() => email = value),
                    decoration: InputDecoration(
                        hintText: "Your Email",
                        prefixIcon: Icon(
                          Icons.mail,
                          color: AppTheme.colors.green,
                        )),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    onChanged: (value) => setState(() => password = value),
                    decoration: InputDecoration(
                        hintText: "Your Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppTheme.colors.green,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      "Forgot Password ?"
                          .text
                          .color(AppTheme.colors.pink)
                          .make(),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'By continuing, you agree to our Terms of Service and acknoledge that you have read our Privacy Policy & Coockie Policy to learn how we manage your data and maintain your privacy.',
                    style: TextStyle(
                      color: AppTheme.colors.grey,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  RawMaterialButton(
                    onPressed: () async {
                      try {
                        User? user = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (user == null) {
                          throw FirebaseAuthException(
                              message: "No user found", code: "ERROR_NO_USER");
                        }

                        currentUser.setUser(user);

                        print("My name is : ${user.uid}");

                        // If user is signed in, navigate to main page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                        );
                      } catch (e) {
                        print('Error signing in: ${e}');

                        // Show a toast if sign in fails
                        VxToast.show(context, msg: "There was an error");
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.width * 0.14,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppTheme.colors.green),
                      child: Center(
                        child: "Login".text.size(20).white.semiBold.make(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
