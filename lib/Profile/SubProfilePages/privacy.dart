import 'package:flutter/material.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_app/theme/app_theme.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.03, // Left padding
                  0, // Top padding
                  MediaQuery.of(context).size.width * 0.03, // Right padding
                  0, // Bottom padding
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: BackButton(),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: "Privacy"
                          .text
                          .bold
                          .size(context.screenWidth * 0.048)
                          .make(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(context.screenWidth * 0.044),
                child: Column(children: [
                  SizedBox(height: 30),
                  PolicyDetail(
                    title: 'Privacy Policy',
                    description:
                        'We respect your privacy and are committed to protecting your personal data. We may collect your personal information such as name, email address, and payment details for the purpose of providing services. We use this data to process your orders, personalize your experience, and for marketing communications if you have opted in. We may share this information with trusted third parties that assist us in operating our app and conducting our business, as long as these parties agree to keep this information confidential. We also implement a variety of security measures to maintain the safety of your personal information.',
                  ),
                  SizedBox(height: 30),
                  PolicyDetail(
                    title: 'Terms of Service',
                    description:
                        'By using our app, you agree to these terms of service. You are responsible for keeping your account secure and you agree to notify us immediately of any unauthorized use of your account. You agree not to violate any laws in your use of our app. We own the intellectual property rights to the content and design of the app. We reserve the right to suspend or terminate your account if you violate these terms.',
                  ),
                  SizedBox(height: 30),
                  PolicyDetail(
                    title: 'Refund Policy',
                    description:
                        'We stand behind the services we provide. If you are not satisfied with a service you ordered, please contact our customer support within 24 hours of the order. After reviewing your request, we may issue a refund at our discretion. However, please note that some services may be non-refundable and non-exchangeable.',
                  ),
                  (context.screenHeight * 0.03).heightBox,
                  InkWell(
                      child: "Open Browser"
                          .text
                          .color(AppTheme.colors.blue)
                          .size(15)
                          .make(),
                      onTap: () => launchUrl(Uri.parse(
                          'https://www.my_app-app.com/termsandprivacy'))),
                ]),
              ),

              // THIS IS THE BOTTOM
              // YOU DONT HAVE TO CHANGE IT FOR NOW

              (context.screenHeight * 0.02).heightBox,
              "v1.0".text.make(),
            ],
          ),
        ),
      ),
    );
  }
}

class PolicyDetail extends StatelessWidget {
  final String title;
  final String description;

  PolicyDetail({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 15),
        Text(description,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
      ],
    );
  }
}
