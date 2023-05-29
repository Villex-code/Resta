import 'package:flutter/material.dart';
import 'package:my_app/Business/store_view.dart';
import 'package:my_app/Customer/customer_view.dart';
import 'package:my_app/MainPages/Homepage.dart';

import 'package:my_app/PagesAuth/Login/login_email.dart';
import 'package:my_app/PagesAuth/SignUp/signup_phone.dart';
import 'package:my_app/PagesAuth/SignupComponents/signup_container.dart';

import 'package:my_app/main.dart';

import 'package:my_app/theme/app_theme.dart';

import 'package:my_app/Authentication/auth.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginMethod extends StatefulWidget {
  const LoginMethod({super.key});

  @override
  State<LoginMethod> createState() => _LoginMethodState();
}

class _LoginMethodState extends State<LoginMethod> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.023,
                0,
                MediaQuery.of(context).size.width * 0.023,
                MediaQuery.of(context).size.height * 0.015),
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
                  'my_app',
                  style: TextStyle(
                      color: AppTheme.colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Login and order in seconds.',
                  style: TextStyle(color: AppTheme.colors.green, fontSize: 15),
                ),
                SizedBox(height: 20),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const LoginEmailPage();
                      },
                    ));
                  },
                  child: const SignupMethodBlock(
                      image: ('assets/user_logo_small.png'),
                      text: 'Continue With Email'),
                ),
                SizedBox(height: 15),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SignupPhonePage();
                      },
                    ));
                  },
                  child: const SignupMethodBlock(
                      image: ('assets/user_logo_small.png'),
                      text: 'Continue With Phone'),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () async {
                    try {
                      User? user = await _auth.signInWithGoogle();

                      if (user != null) {
                        await currentUser.setUser(user);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SeeCustomer_View()),
                        );
                      } else {
                        print("User not found or sign in was cancelled");
                      }
                    } catch (e) {
                      print(
                          "There was an exception while registering with google");
                      print(e);
                    }
                  },
                  child: const SignupMethodBlock(
                    image: ('assets/google_logo_small.png'),
                    text: 'Continue With Google',
                  ),
                ),
                SizedBox(height: 15),
                const SignupMethodBlock(
                    image: ('assets/apple_logo_small.png'),
                    text: 'Continue With Apple'),
                SizedBox(height: 25),
                InkWell(
                  onTap: () async {
                    try {
                      User? user = await _auth.signInAnonymously();

                      if (user != null) {
                        currentUser.setUser(user);

                        currentUser.setData({
                          'name': "Anonymous",
                        });

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                        );
                      } else {
                        print("User not found or sign in was cancelled");
                      }
                    } catch (e) {
                      print(
                          "There was an exception while registering with google");
                      print(e);
                    }
                  },
                  child: "Or Continue Anonymously"
                      .text
                      .color(Colors.black54)
                      .semiBold
                      .make(),
                ),
                SizedBox(height: 15),
                Text(
                  'By continuing, you agree to our Terms of Service and acknoledge that you have read our Privacy Policy & Coockie Policy to learn how we manage your data and maintain your privacy.',
                  style: TextStyle(
                    color: AppTheme.colors.grey,
                    fontSize: MediaQuery.of(context).size.width * 0.028,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                RawMaterialButton(
                  onPressed: () {},
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: AppTheme.colors.pink,
                          fontSize: MediaQuery.of(context).size.width * 0.038),
                    ),
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
