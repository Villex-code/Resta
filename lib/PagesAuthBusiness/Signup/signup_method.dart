import 'package:flutter/material.dart';
import 'package:my_app/MainPages/Homepage.dart';
import 'package:my_app/PagesAuth/Login/login_method.dart';
import 'package:my_app/PagesAuth/SignUp/signup_email.dart';
import 'package:my_app/PagesAuth/SignUp/signup_phone.dart';
import 'package:my_app/PagesAuth/SignupComponents/signup_container.dart';
import 'package:my_app/PagesAuthBusiness/Login/login_method.dart';
import 'package:my_app/PagesAuthBusiness/Signup/signup_phone.dart';

import 'package:my_app/theme/app_theme.dart';

import 'package:my_app/Authentication/auth.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:velocity_x/velocity_x.dart';

class BusinessSignupMethod extends StatelessWidget {
  const BusinessSignupMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context, listen: false);
    final AuthService _auth = AuthService();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.023,
                20,
                MediaQuery.of(context).size.width * 0.023,
                5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/qrcode_logo_small.png',
                    height: MediaQuery.of(context).size.width * 0.22),
                Text(
                  'OnSpot Business',
                  style: TextStyle(
                      color: AppTheme.colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Create an account and order in seconds.',
                  style: TextStyle(color: AppTheme.colors.green, fontSize: 15),
                ),
                SizedBox(height: 30),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SignupEmailPage();
                      },
                    ));
                  },
                  child: const SignupMethodBlock(
                      image: ('assets/user_logo_small.png'),
                      text: 'Sign Up With Email'),
                ),
                SizedBox(height: 15),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const BusinessSignupPhone();
                      },
                    ));
                  },
                  child: const SignupMethodBlock(
                      image: ('assets/user_logo_small.png'),
                      text: 'Sign Up With Phone'),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () async {
                    try {
                      User? user = await _auth.signInWithGoogle();

                      if (user != null) {
                        await currentUser.setUser(user);
                        print(user!.uid);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                        );
                      } else {
                        print("User not found");
                      }
                    } catch (e) {
                      print(
                          "There was an exception while registering with google");
                      print(e);
                    }
                  },
                  child: const SignupMethodBlock(
                      image: ('assets/google_logo_small.png'),
                      text: 'Sign Up With Google'),
                ),
                SizedBox(height: 15),
                const SignupMethodBlock(
                    image: ('assets/apple_logo_small.png'),
                    text: 'Sign Up With Apple'),
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
                (15).heightBox,
                Text(
                  'By continuing, you agree to our Terms of Service and acknoledge that you have read our Privacy Policy & Coockie Policy to learn how we manage your data and maintain your privacy.',
                  style: TextStyle(
                    color: AppTheme.colors.grey,
                    fontSize: MediaQuery.of(context).size.width * 0.028,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                RawMaterialButton(
                  onPressed: () {},
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const BusinessLoginMethod();
                        },
                      ));
                    },
                    child: Text(
                      'Already have an account?',
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
