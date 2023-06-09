import 'package:flutter/material.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:provider/provider.dart';

import 'package:velocity_x/velocity_x.dart';

import 'package:url_launcher/url_launcher.dart';

class OnSpotBusiness extends StatelessWidget {
  const OnSpotBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final solutions = [
      {
        'imagePath': 'assets/profile/business/live2.jpeg',
        'title': 'Live Management',
        'text': 'Real-Time Table Management',
        //'routelink': 'https://www.onspot-app.com/solutions/livemanagement',
        'imageWidth': context.screenWidth * 0.7,
        'imageHeight': context.screenHeight * 0.3,
      },
      {
        'imagePath': 'assets/profile/business/int1.jpeg',
        'title': 'Digital Menu',
        'text': 'Upload your digital Menu',
        //'routelink': 'https://www.onspot-app.com/solutions/integratedmenu',
        'imageWidth': context.screenWidth * 0.7,
        'imageHeight': context.screenHeight * 0.3,
      },
      {
        'imagePath': 'assets/profile/business/pay1.jpeg',
        'title': 'Payments',
        'text': 'Safe & Reliable Payments',
        //'routelink': 'https://www.onspot-app.com/solutions/payments',
        'imageWidth': context.screenWidth * 0.7,
        'imageHeight': context.screenHeight * 0.3,
      },
      {
        'imagePath': 'assets/profile/business/analytics3.jpeg',
        'title': 'Reviews',
        'text': 'Gathered Customer Reviews',
        //'routelink': 'https://www.onspot-app.com/solutions/analytics',
        'imageWidth': context.screenWidth * 0.7,
        'imageHeight': context.screenHeight * 0.3,
      },
      // Add more mock data entries as needed
    ];
    // final useCases = [
    //   {
    //     'imagePath': 'assets/profile/business/rest1.jpeg',
    //     'title': 'Restaurants',
    //     'text': 'Convenient Mobile Ordering',
    //     //'routelink': 'https://www.onspot-app.com/usecases/restaurant',
    //     'imageWidth': context.screenWidth * 0.7,
    //     'imageHeight': context.screenHeight * 0.3,
    //   },
    //   {
    //     'imagePath': 'https://res.cloudinary.com/sagacity/image/upload/c_crop,h_932,w_1400,x_0,y_0/c_limit,dpr_2.625,f_auto,fl_lossy,q_80,w_412/DSC07718_hera1n.jpg',
    //     'title': 'Bars',
    //     'text': 'Revolunionize Your Bar Services',
    //     //'routelink': 'https://www.onspot-app.com/usecases/beachbar',
    //     'imageWidth': context.screenWidth * 0.7,
    //     'imageHeight': context.screenHeight * 0.3,
    //   },
    //   {
    //     'imagePath': 'assets/profile/business/hotel3.jpeg',
    //     'title': 'Brunch',
    //     'text': 'Seamless Room Service Solution',
    //     //'routelink': 'https://www.onspot-app.com/usecases/hotel',
    //     'imageWidth': context.screenWidth * 0.7,
    //     'imageHeight': context.screenHeight * 0.3,
    //   },
    //   {
    //     'imagePath': 'assets/profile/business/coffee1.jpeg',
    //     'title': 'Coffee Shops',
    //     'text': 'Fast-Pace % Stress-Free',
    //     //'routelink': 'https://www.onspot-app.com/usecases/coffeeshop',
    //     'imageWidth': context.screenWidth * 0.7,
    //     'imageHeight': context.screenHeight * 0.3,
    //   },
      // Add more mock data entries as needed
    // ];
    final currentUser = Provider.of<CurrentUser>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.03, // Left padding
                  0, // Top padding
                  MediaQuery.of(context).size.width * 0.03, // Right padding
                  20, // Bottom padding
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
                      child: "Resta for Business"
                          .text
                          .bold
                          .size(context.screenWidth * 0.044)
                          .make(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(context.screenHeight * 0.03),
                child: Column(children: [
                  "Are you a Business Owner ?"
                      .text
                      .size(context.screenWidth * 0.044)
                      .semiBold
                      .make(),
                  (context.screenHeight * 0.02).heightBox,
                  "These are the services we offer with Resta App to increase sales and customer satisfaction while reducing labor costs."
                      .text
                      .center
                      .makeCentered(),
                ]),
              ),
              Column(
                children: [
                  "Services"
                      .text
                      .semiBold
                      .size(context.screenWidth * 0.044)
                      .make(),
                  (context.screenHeight * 0.02).heightBox,
                  VxSwiper.builder(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 700),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    itemCount: solutions.length,
                    height: context.screenWidth * 0.45,
                    itemBuilder: (context, index) {
                      final itemData = solutions[index % solutions.length];
                      return ResponsiveBackgroundWidget(
                        imagePath: itemData['imagePath'] as String,
                        title: itemData['title'] as String,
                        text: itemData['text'] as String,
                        //routelink: itemData['routelink'] as String,
                        imageWidth: itemData['imageWidth'] as double,
                        imageHeight: itemData['imageHeight'] as double,
                      );
                    },
                  ),
                  // (context.screenHeight * 0.02).heightBox,
                  // "Use Cases"
                  //     .text
                  //     .semiBold
                  //     .size(context.screenWidth * 0.044)
                  //     .make(),
                  // (context.screenHeight * 0.02).heightBox,
                  // VxSwiper.builder(
                  //   autoPlay: true,
                  //   autoPlayInterval: Duration(seconds: 3),
                  //   autoPlayAnimationDuration: Duration(milliseconds: 700),
                  //   autoPlayCurve: Curves.fastOutSlowIn,
                  //   enlargeCenterPage: true,
                  //   itemCount: useCases.length,
                  //   height: context.screenWidth * 0.45,
                  //   itemBuilder: (context, index) {
                  //     final itemData = useCases[index % useCases.length];
                  //     return ResponsiveBackgroundWidget(
                  //       imagePath: itemData['imagePath'] as String,
                  //       title: itemData['title'] as String,
                  //       text: itemData['text'] as String,
                  //       //routelink: itemData['routelink'] as String,
                  //       imageWidth: itemData['imageWidth'] as double,
                  //       imageHeight: itemData['imageHeight'] as double,
                  //     );
                  //   },
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Image.asset(
                  //       "assets/profile/business/appstore.png",
                  //       width: context.screenWidth * 0.37,
                  //       height: context.screenWidth * 0.37,
                  //     ),
                  //     Image.asset(
                  //       "assets/profile/business/androidstore.png",
                  //       width: context.screenWidth * 0.3,
                  //       height: context.screenWidth * 0.3,
                  //     ),
                  //   ],
                  // ),
                  // "Learn More".text.xl.make(),
                  // (context.screenHeight * 0.02).heightBox,
                  // InkWell(
                  //   // onTap: () =>
                  //   //     launchUrl(Uri.parse("https://www.onspot-app.com")),
                  //   child: VxCapsule(
                  //     width: context.screenWidth * 0.7,
                  //     height: context.screenHeight * 0.08,
                  //     backgroundColor: Colors.green,
                  //     child: Text(
                  //       'Check out our Website',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: context.screenWidth *
                  //             0.05, // set the size to fit your needs
                  //         fontWeight: FontWeight.bold, // make the text bold
                  //       ),
                  //       textAlign: TextAlign.center, // center the text
                  //     ).box.alignCenter.make(),
                  //   ),
                  // ),
                  // VxBox().size(10, 30).make()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveBackgroundWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String text;
  final double imageWidth;
  final double imageHeight;

  ResponsiveBackgroundWidget({
    required this.imagePath,
    required this.title,
    required this.text,
    this.imageWidth = double.infinity,
    this.imageHeight = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        return InkWell(

          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(10.0), // Set the border radius here
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              width: imageWidth,
              height: imageHeight,
            ),
          ),
        );
      },
    );
  }
}
