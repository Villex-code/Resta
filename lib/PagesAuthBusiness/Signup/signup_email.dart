import 'package:flutter/material.dart';
import 'package:my_app/MainPages/Homepage.dart';

import 'package:my_app/theme/app_theme.dart';
import 'package:my_app/Authentication/auth.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupEmailPage extends StatefulWidget {
  const SignupEmailPage({super.key});

  @override
  State<SignupEmailPage> createState() => _SignupEmailPageState();
}

class _SignupEmailPageState extends State<SignupEmailPage> {
  final AuthService _auth = AuthService();

  // Initialize the text controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifyPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose of the text controllers when the widget is removed from the widget tree
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    verifyPasswordController.dispose();
    super.dispose();
  }

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
                        MediaQuery.of(context).size.height * 0.0,
                        0,
                        MediaQuery.of(context).size.width * 0.03,
                        MediaQuery.of(context).size.width * 0.03),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [BackButton()],
                    ),
                  ),
                  Image.asset('assets/qrcode_logo_small.png',
                      width: MediaQuery.of(context).size.width * 0.22),
                  Text(
                    'Sign up',
                    style: TextStyle(
                        color: AppTheme.colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.096,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Make an account, using your email.',
                    style: TextStyle(
                        color: AppTheme.colors.green,
                        fontSize: MediaQuery.of(context).size.width * 0.0365),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  TextField(
                    controller: nameController, // Add this
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: "Your Name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppTheme.colors.green,
                        )),
                  ),
                  SizedBox(height: 17),
                  TextField(
                    controller: emailController, // Add this
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Your Email",
                        prefixIcon: Icon(
                          Icons.mail,
                          color: AppTheme.colors.green,
                        )),
                  ),
                  SizedBox(height: 17),
                  TextField(
                    controller: passwordController, // Add this
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Your Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppTheme.colors.green,
                        )),
                  ),
                  SizedBox(height: 17),
                  TextField(
                    controller: verifyPasswordController, // Add this
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Verify your password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppTheme.colors.green,
                        )),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'By continuing, you agree to our Terms of Service and acknoledge that you have read our Privacy Policy & Coockie Policy to learn how we manage your data and maintain your privacy.',
                    style: TextStyle(
                      color: AppTheme.colors.grey,
                      fontSize: MediaQuery.of(context).size.width * 0.029,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  RawMaterialButton(
                    onPressed: () async {
                      try {
                        String name = nameController.text;
                        String email = emailController.text;
                        String password = passwordController.text;
                        String verifyPassword = verifyPasswordController.text;

                        bool flag = true;

                        // Check if the passwords match
                        if (password != verifyPassword && password.length < 6) {
                          print('Passwords do not match');
                          flag = false;
                        }

                        // Validate the email
                        // Note: This is a very simple validation and might not catch all invalid emails
                        bool emailValid = RegExp(
                                r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9.]{2,}$')
                            .hasMatch(email);
                        if (!emailValid) {
                          print('Email is not valid');
                          flag = false;
                        }

                        if (flag) {
                          try {
                            User? user = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (user != null) {
                              await currentUser.setUser(user);
                              print(user!.uid);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()),
                              );
                            } else {
                              print("The user is null");
                            }
                          } catch (e) {
                            if (e is FirebaseAuthException &&
                                e.code == 'email-already-in-use') {
                              print('This email is already in use');
                            } else {
                              print(
                                  'An unknown error occurred after register with email: $e');
                            }
                          }
                        }

                        // If everything is ok, print the data
                        print('Name: $name');
                        print('Email: $email');
                        print('Password: $password');
                      } catch (e) {
                        print("There was a mistake in the sign up method");
                        print(e);
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppTheme.colors.pink),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
