import 'package:my_app/Authentication/user.dart';
import 'package:my_app/MainPages/Homepage.dart';

import 'package:my_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_app/Authentication/auth.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class PhoneNumberVerification extends StatefulWidget {
  final AuthService auth;
  String submittedPhone;
  PhoneNumberVerification(
      {super.key, required this.submittedPhone, required this.auth});

  @override
  State<PhoneNumberVerification> createState() =>
      _PhoneNumberVerificationState();
}

// final TextEditingController verificationsCodeController =
//     TextEditingController();

class _PhoneNumberVerificationState extends State<PhoneNumberVerification> {
  String verificationCode = '';

  FocusNode? focusNode1,
      focusNode2,
      focusNode3,
      focusNode4,
      focusNode5,
      focusNode6;

  TextEditingController? controller1,
      controller2,
      controller3,
      controller4,
      controller5,
      controller6;

  void updateVerificationCode() {
    verificationCode = controller1!.text +
        controller2!.text +
        controller3!.text +
        controller4!.text +
        controller5!.text +
        controller6!.text;
  }

  @override
  void initState() {
    super.initState();

    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    focusNode4 = FocusNode();
    focusNode5 = FocusNode();
    focusNode6 = FocusNode();

    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    controller5 = TextEditingController();
    controller6 = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    focusNode1?.dispose();
    focusNode2?.dispose();
    focusNode3?.dispose();
    focusNode4?.dispose();
    focusNode5?.dispose();
    focusNode6?.dispose();

    controller1?.dispose();
    controller2?.dispose();
    controller3?.dispose();
    controller4?.dispose();
    controller5?.dispose();
    controller6?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context, listen: false);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [BackButton()],
              ),
              Image.asset(
                'assets/pobox.png',
                width: context.screenWidth * 0.55,
              ),
              (35).heightBox,
              "Verification Code"
                  .text
                  .bold
                  .color(AppTheme.colors.green)
                  .size(context.screenWidth * 0.075)
                  .make(),
              (30).heightBox,
              "Please enter the code you received"
                  .text
                  .color(Colors.grey)
                  .size(context.screenWidth * 0.04)
                  .make(),
              (25).heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTextField(focusNode1, null, focusNode2, controller1),
                  _buildTextField(
                      focusNode2, focusNode1, focusNode3, controller2),
                  _buildTextField(
                      focusNode3, focusNode2, focusNode4, controller3),
                  _buildTextField(
                      focusNode4, focusNode3, focusNode5, controller4),
                  _buildTextField(
                      focusNode5, focusNode4, focusNode6, controller5),
                  _buildTextField(focusNode6, focusNode5, null, controller6),
                ],
              ),
              80.heightBox,
              InkWell(
                  onTap: () async {
                    try {
                      print(verificationCode);
                      User? user = await widget.auth
                          .signInWithPhoneNumber(verificationCode);
                      // TODO: Handle the authenticated user, if not null
                      if (user != null) {
                        currentUser.setUser(user);
                        currentUser.setData({
                          'phone': widget.submittedPhone,
                        });
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                        );
                      } else {
                        print("The user is null");
                      }
                    } catch (e) {
                      print("Couldn't sign in with phone : $e");
                    }
                  },
                  child: VxBox(
                          child: "Verify"
                              .text
                              .size(context.screenWidth * 0.06)
                              .white
                              .makeCentered())
                      .color(AppTheme.colors.green)
                      .width(context.screenWidth * 0.6)
                      .roundedSM
                      .height(50)
                      .make()),
            ]),
          ),
        )),
      ),
    );
  }

//     final currentUser = Provider.of<CurrentUser>(context, listen: false);
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           TextField(
// //                     controller: verificationsCodeController,
// //                     obscureText: true,
// //                     decoration: InputDecoration(
// //                         hintText: "Verification Code",
// //                         prefixIcon: Icon(
// //                           Icons.lock,
// //                           color: AppTheme.colors.green,
// //                         )),
// //                   )
// //             //RawMaterialButton(
  // onPressed: () async {
  //   try {
  //     String verificationCode =
  //         verificationsCodeController.text;
  //     User? user =
  //         await _auth.signInWithPhoneNumber(verificationCode);
  //     // TODO: Handle the authenticated user, if not null
  //     if (user != null) {
  //       currentUser.setUser(user);
  //       currentUser.setData({
  //         'phone': submittedPhone,
  //       });
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => QrScannerPage()),
  //       );
  //     } else {
  //       print("The user is null");
  //     }
  //   } catch (e) {
  //     print("Couldn't sign in with phone : $e");
  //   }
// //                     child: Container(
// //                       width: MediaQuery.of(context).size.width * 0.35,
// //                       height: MediaQuery.of(context).size.height * 0.05,
// //                       decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(8),
// //                           color: AppTheme.colors.pink),
// //                       child: Center(
// //                         child: Text(
// //                           'Continue',
// //                           style: TextStyle(
// //                             color: Colors.white,
// //                             fontSize:
// //                                 MediaQuery.of(context).size.height * 0.021,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //         ],
// //       ),
// //     );
// //   }
// //
//   }
// }
  Widget _buildTextField(FocusNode? currentFocusNode, FocusNode? prevFocusNode,
      FocusNode? nextFocusNode, TextEditingController? controller) {
    return SizedBox(
      width: 40, // you can adjust the width as you need
      child: TextField(
        controller: controller,
        focusNode: currentFocusNode,
        keyboardType: TextInputType.number, // allow only number input
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // allow only digit input
          LengthLimitingTextInputFormatter(1), // limit length
        ],
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22),
        onChanged: (String value) {
          if (value.isEmpty) {
            currentFocusNode?.unfocus();
            FocusScope.of(context)
                .requestFocus(prevFocusNode); // move focus to prev
          } else if (value.length >= 1) {
            currentFocusNode?.unfocus();
            FocusScope.of(context)
                .requestFocus(nextFocusNode); // move focus to next
          }
          updateVerificationCode();
        },
      ),
    );
  }

  // Function to get the six-digit number
  String getSixDigitNumber() {
    return controller1!.text +
        controller2!.text +
        controller3!.text +
        controller4!.text +
        controller5!.text +
        controller6!.text;
  }
}
