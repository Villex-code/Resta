import 'package:flutter/material.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:provider/provider.dart';

import 'package:velocity_x/velocity_x.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> aboutData = [
      {
        'heading': 'Our Company',
        'description': 'Vale ti kanei to app mas',
      },
      {
        'heading': 'How It Works',
        'description': '1. Vale step 1.\n\n'
            '2. Vale step 2.\n\n'
            '3. Vale step 3.\n\n'
            '4. Vale step 4.\n\n'
            'Enjoy a hassle-free dining experience with our app!',
      },
      {
        'heading': 'Features',
        'description': '- Quick and easy ordering process\n'
            'Vale feature 1\n'
            'feature 2\n'
            'h kai osas alla einai\n',
      },
      {
        'heading': 'Benefits',
        'description': '- Save time and skip the queue\n'
            '- Benefit 1\n'
            '- Benefit 2\n'
            '- Benefit 3 ....\n',
      },
      {
        'heading': 'Customer Reviews',
        'description': 'Here are some reviews from our satisfied customers:\n\n'
            '"This app is a game-changer! I love how easy it is to order and pay right from my phone." - John D.\n\n'
            '"The convenience and speed of this app are unparalleled. Highly recommended!" - Sarah T.\n\n'
            '"Using this app has made dining out a breeze. No more waiting for the waiter!" - Alex M.',
      },
      {
        'heading': 'Contact Us',
        'description':
            'If you have any questions or need assistance, please reach out to our support team:\n\n'
                '- Email: support@company.com\n'
                '- Phone: +1-123-456-7890\n'
                '- Visit our website: www.company.com',
      },
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
                      child: "About my_app"
                          .text
                          .bold
                          .size(context.screenWidth * 0.048)
                          .make(),
                    ),
                  ],
                ),
              ),
              (context.screenHeight * 0.03).heightBox,
              Column(
                children: aboutData.map((data) {
                  return buildAboutSection(
                      data['heading']!, data['description']!, context);
                }).toList(),
              ),
              Reviews(),
              VxBox().size(10, 30).make()
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildAboutSection(
    String heading, String description, BuildContext context) {
  return VxBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading.text.size(context.screenWidth * 0.055).bold.make(),
        (context.screenHeight * 0.013).heightBox,
        description.text.size(context.screenWidth * 0.04).make(),
      ],
    ),
  )
      .margin(
        EdgeInsets.only(
            left: context.screenWidth * 0.04,
            right: context.screenWidth * 0.04,
            bottom: context.screenHeight * 0.04),
      )
      .width(context.screenWidth)
      .make();
}

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> reviewData = [
      {
        'title':
            '"This app is a game-changer! I love how easy it is to order and pay right from my phone." - John D.\n\n'
      },
      {
        'title':
            '"The convenience and speed of this app are unparalleled. Highly recommended!" - Sarah T.\n\n'
      },
      {
        'title':
            '"Using this app has made dining out a breeze. No more waiting for the waiter!" - Alex M.',
      },
      {
        'title':
            '"I cant imagine dining without this app now. Its made everything so much more efficient." - Emma S.\n\n'
      }
    ];
    return VxSwiper.builder(
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 5),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      itemCount: reviewData.length,
      height: context.screenHeight * 0.25,
      itemBuilder: (context, index) {
        final itemData = reviewData[index % reviewData.length];
        return ResponsiveBackgroundWidget(
          title: itemData['title'] as String,
        );
      },
    );
  }
}

class ResponsiveBackgroundWidget extends StatelessWidget {
  final String title;

  ResponsiveBackgroundWidget({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        return VxBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VxBox(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                  ),
                ).text.center.make(),
              )
                  .margin(EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.04))
                  .make(),
              SizedBox(height: screenHeight * 0.02),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ],
              )
            ],
          ),
        )
            .margin(EdgeInsets.fromLTRB(
                context.screenWidth * 0.03, 0, context.screenWidth * 0.03, 0))
            .rounded
            .color(Colors.black12)
            .make();
      },
    );
  }
}
