import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_faq/flutter_faq.dart';
import 'package:my_app/theme/app_theme.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> mockFAQs = [
      {
        'question': 'How do businesses receive requests for bookings?',
        'answer':
            'Businesses will receive requests directly in their integrated systems.',
      },
      {
        'question': 'Can I cancel my booking?',
        'answer':
            'Yes, you can cancel your booking by contacting our support team.',
      },
      {
        'question': 'What payment methods are accepted?',
        'answer':
            'We accept various payment methods, including credit cards and digital wallets.',
      },
      // Add more mock FAQs as needed
    ];
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
                      child: "Support"
                          .text
                          .bold
                          .size(context.screenWidth * 0.048)
                          .make(),
                    ),
                  ],
                ),
              ),
              (context.screenHeight * 0.02).heightBox,
              "Frequently Asked Questions"
                  .text
                  .size(context.screenWidth * 0.05)
                  .semiBold
                  .make(),
              (context.screenHeight * 0.02).heightBox,
              Column(
                children: mockFAQs.map((faq) {
                  return FAQ(
                    question: faq['question'] as String,
                    answer: faq['answer'] as String,
                    ansPadding: const EdgeInsets.all(20),
                    queDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    ansDecoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    ansStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    queStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  );
                }).toList(),
              ),
              (context.screenHeight * 0.03).heightBox,
              TroubleshootingGuideWidget(
                title: 'Troubleshooting Guide',
                steps: [
                  'Step 1: Restart the app',
                  'Step 2: Clear app cache',
                  'Step 3: Check internet connection',
                  // Add more troubleshooting steps as needed
                ],
              ),
              (context.screenHeight * 0.03).heightBox,
              InkWell(
                onTap: () => showTicketModal(context),
                child: Container(
                  padding: EdgeInsets.all(context.screenWidth * 0.02),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 28, 31, 29),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Text(
                      'Send a message',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                ),
              ),
              (context.screenHeight * 0.03).heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 10),
                      Text("v.a.corptn@gmail.com"),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 10),
                      Text("6987543041 - 6997120288"),
                    ],
                  ),
                ],
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

void showTicketModal(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.01),
                    child: Text(
                      'Create a message',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  )
                ],
              ),
              (context.screenHeight * 0.04).heightBox,
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.colors.grey),
                    ), // Border when the input field is enabled
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.colors.green),
                    ), // Border when the input field is focused
                    hintText: 'Send a message to our support team',
                    hintMaxLines: 5,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.03),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class TroubleshootingGuideWidget extends StatelessWidget {
  final String title;
  final List<String> steps;

  const TroubleshootingGuideWidget({
    required this.title,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: steps
              .map(
                (step) => Row(
                  children: [
                    SizedBox(
                      width: context.screenWidth * 0.25,
                    ),
                    Icon(Icons.check_circle),
                    SizedBox(width: 10),
                    Text(step),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
