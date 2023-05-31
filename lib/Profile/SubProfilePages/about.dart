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
        'description':
            'If you are a business owner, through our app you can have your own business profile where you can receive requests for table reservation and accept/decline them.\nIf you are a customer, you can choose a business through the app and then see the table plan in order to book a specific table for your needs.',
      },
      {
        'heading': 'How It Works',
        'description': 'For Businesses \n1. Create your account, filling all the fields needed.\n\n'
            '2. Build your profile adding info, such as profile pic etc.\n\n'
            '3. In the "Notifications" field, you will receive requests for booking.\n\n'
            '4. If you have a request, select "Accept" or "Decline".\n\n'
            '5. If you press Accept, the booking is made.\n\n'
            'For Customers \n1. Create your account, filling all the fields needed.\n\n'
            '2. Select a business from the lists or the map plan.\n\n'
            '3. After checking the table plan, choose a specific table to book.\n\n'
            '4. Select "Book" an fill the fields asked.\n\n'
            '5. Select "Confirm" and your request is made.\n\n'
            '6. In your "Notifications", you can see if it is accepted.\n\n'
            'Enjoy a hassle-free experience with our app!',
      },
      {
        'heading': 'Features',
        'description': '\n- Quick and easy booking process\n'
            '- Availability to accept or decline a request.\n'
            '- List of past bookings.\n'
            '- Customized Profile.\n'
            '- Map view of businesses.\n'
            '- List of past bookings.\n',
      },
      {
        'heading': 'Benefits',
        'description': '- Save time and skip the queue\n'
            '- Check the position of your table.\n'
            '- Avoidance of queue management.\n'
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
