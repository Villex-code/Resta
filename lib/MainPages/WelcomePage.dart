
import 'package:flutter/material.dart';

import '../PagesAuth/Login/login_method.dart';
import '../PagesAuthBusiness/Login/login_method.dart';



class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 242, 245, 245),
              Color.fromARGB(255, 200, 215, 215),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 411,
                  height: 296,
                  decoration: BoxDecoration(
                    //color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/profile/RestaLogo.png', // Replace with the path to your image file
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                  child: Text(
                                    'Welcome!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                                  child: Text(
                                    'Thanks for joining! Access or create your account below, and get started on your journey!',
                                    textAlign: TextAlign.center,
                                    style:TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 435,
                  height: 400,
                  decoration: BoxDecoration(
                    //color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'JOIN AS',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 23,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        80, 12, 80, 0),
                                    child: TextButton(

                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) {
                                            return const BusinessLoginMethod();
                                          },
                                        ));
                                      },
                                      child: Container(
                                        width: 170,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF4F9B98),
                                              Color.fromARGB(255, 200, 215, 215),
                                              Color(0xFF4F9B98), // Start color
                                            ],
                                            begin: Alignment.topCenter, // Gradient start position
                                            end: Alignment.bottomCenter, // Gradient end position
                                          ),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        alignment: Alignment.center, // Aligns the text to the center
                                        padding: EdgeInsets.all(10.0), // Adjust padding as needed
                                        child: Text(
                                          'Business',
                                          style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        80, 12, 80, 0),
                                    child: TextButton(

                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) {
                                            return const LoginMethod();
                                          },
                                        ));
                                      },
                                      child: Container(
                                        width: 170,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF4F9B98),
                                              Color.fromARGB(255, 200, 215, 215),
                                              Color(0xFF4F9B98), // Start color
                                            ],
                                            begin: Alignment.topCenter, // Gradient start position
                                            end: Alignment.bottomCenter, // Gradient end position
                                          ),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        alignment: Alignment.center, // Aligns the text to the center
                                        padding: EdgeInsets.all(10.0), // Adjust padding as needed
                                        child: Text(
                                          'Customer',
                                          style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),

                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   crossAxisAlignment: CrossAxisAlignment.end,
                          //   children: [
                          //     Text(
                          //       'RESTA App',
                          //       //style: FlutterFlowTheme.of(context).bodyMedium,
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}