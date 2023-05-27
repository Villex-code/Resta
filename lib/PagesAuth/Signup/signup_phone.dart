import 'package:flutter/material.dart';

import 'package:my_app/PagesAuth/SignUp/phoneNumber_verification.dart';
import 'package:my_app/theme/app_theme.dart';
import 'package:my_app/Authentication/auth.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupPhonePage extends StatefulWidget {
  const SignupPhonePage({super.key});

  @override
  State<SignupPhonePage> createState() => _SignupPhonePageState();
}

class _SignupPhonePageState extends State<SignupPhonePage> {
  final AuthService _auth = AuthService();

  final TextEditingController phoneController = TextEditingController();
  String submittedPhone = '';

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context, listen: false);
    final FocusNode _focusNode = FocusNode();

    return GestureDetector(
      onTap: () {
        if (_focusNode.hasFocus) {
          _focusNode.unfocus();
        }
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
                'assets/phone_verification.png',
                width: context.screenWidth * 0.55,
              ),
              (35).heightBox,
              "Verify you number"
                  .text
                  .bold
                  .color(AppTheme.colors.green)
                  .size(context.screenWidth * 0.075)
                  .make(),
              (30).heightBox,
              "Please enter your phone number"
                  .text
                  .color(Colors.grey)
                  .size(context.screenWidth * 0.04)
                  .make(),
              (25).heightBox,
              VxBox(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _focusNode.requestFocus();
                      },
                      child: InternationalPhoneNumberInput(
                        focusNode: _focusNode,
                        initialValue:
                            PhoneNumber(dialCode: '30', isoCode: 'GR'),
                        onInputChanged: (value) {
                          submittedPhone = value.phoneNumber ?? "";
                        },
                        cursorColor: Colors.black,
                        selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            leadingPadding: 10),
                        inputDecoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 15, left: 0),
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16),
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 12,
                      ),
                    ),
                    Positioned(
                      left: 100,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 1.5,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
              )
                  .roundedSM
                  .margin(EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.02))
                  .shadowSm
                  .height(60)
                  .white
                  .make(),
              80.heightBox,
              InkWell(
                onTap: () async {
                  try {
                    print(submittedPhone);
                    await _auth.verifyPhoneNumber(submittedPhone);
                  } catch (e) {
                    print("Couldn't verify with phone : $e");
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhoneNumberVerification(
                                submittedPhone: submittedPhone,
                                auth: _auth,
                              )));
                },
                child: VxBox(
                        child: "Get Code"
                            .text
                            .size(context.screenWidth * 0.06)
                            .white
                            .makeCentered())
                    .color(AppTheme.colors.green)
                    .width(context.screenWidth * 0.6)
                    .roundedSM
                    .height(50)
                    .make(),
              )
            ]),
          ),
        )),
      ),
    );
  }
}
