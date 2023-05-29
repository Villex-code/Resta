import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:intl/intl.dart';

class Review {
  final String id;
  final String name;
  final String address;
  final String imageUrl;
  final String orderTotal;
  final String paymentMethod;
  final String message;
  final String order;

  final String rating;
  final Timestamp time;

  Review({
    required this.id,
    required this.name,
    required this.address,
    required this.orderTotal,
    required this.order,
    required this.imageUrl,
    required this.paymentMethod,
    required this.message,
    required this.rating,
    required this.time,
  });
}

class ReviewItemPage extends StatefulWidget {
  const ReviewItemPage({Key? key, required this.review}) : super(key: key);

  final Review review;

  @override
  State<ReviewItemPage> createState() => _ReviewItemPageState();
}

class _ReviewItemPageState extends State<ReviewItemPage> {
  @override
  Widget build(BuildContext context) {
    Timestamp? time_here = widget.review.time;
    String id_here = widget.review.id;

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
                      child: "Review"
                          .text
                          .bold
                          .size(context.screenWidth * 0.046)
                          .make(),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(context.screenWidth * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Your Review"
                          .text
                          .size(context.screenWidth * 0.073)
                          .bold
                          .make(),
                      (context.screenHeight * 0.01).heightBox,
                      Row(
                        children: [
                          SizedBox(
                            width: context.screenWidth * 0.02,
                          ),
                          Text(
                            DateFormat('yyyy-MM-dd – kk:mm')
                                .format(widget.review.time.toDate()),
                          ),
                          SizedBox(
                            width: context.screenWidth * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black),
                            width: 5,
                            height: 5,
                          ),
                          SizedBox(
                            width: context.screenWidth * 0.02,
                          ),
                          "ID : $id_here".text.make(),
                        ],
                      ),
                      (context.screenHeight * 0.01).heightBox,
                      ProfileRow(
                        image: widget.review.imageUrl,
                        title: "Name",
                        subtitle: widget.review.name,
                      ),
                      (context.screenHeight * 0.02).heightBox,
                      ProfileRow(
                        image: 'assets/profile_image.webp',
                        title: 'Adress',
                        subtitle: widget.review.address,
                      ),
                      (context.screenHeight * 0.02).heightBox,
                      ProfileRow(
                        image: 'assets/profile_image.webp',
                        title: 'Order Total',
                        subtitle: widget.review.orderTotal,
                      ),
                      (context.screenHeight * 0.02).heightBox,
                      ProfileRow(
                        image: 'assets/profile_image.webp',
                        title: 'Payment Method',
                        subtitle: widget.review.paymentMethod,
                      ),
                      (context.screenHeight * 0.02).heightBox,
                      "Cart"
                          .text
                          .size(context.screenWidth * 0.063)
                          .semiBold
                          .make(),
                      (context.screenHeight * 0.01).heightBox,
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                context.screenWidth * 0.044),
                            child: Image.asset(
                              "assets/menu_image.jpeg",
                              width: context.screenWidth * 0.22,
                              height: context.screenWidth * 0.22,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Full Order",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                widget.review.order,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ).box.width(context.screenWidth * 0.48).make(),
                            ],
                          ),
                          (context.screenWidth * 0.06).widthBox,
                          widget.review.orderTotal.text
                              .size(context.screenWidth * 0.05)
                              .make(),
                        ],
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.all(context.screenHeight * 0.02),
                color: Colors.grey[200],
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust this to control the roundness of corners
                  ),
                  padding: EdgeInsets.all(context.screenHeight * 0.02),
                  child: Column(
                    children: [
                      Container(
                        child: "Your Feedback"
                            .text
                            .semiBold
                            .white
                            .size(context.screenWidth * 0.06)
                            .make()
                            .box
                            .makeCentered(),
                      ),
                      SizedBox(
                          height:
                              context.screenHeight * 0.01), // Add some space
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Rating"
                              .text
                              .semiBold
                              .white
                              .size(context.screenWidth * 0.042)
                              .make(),
                          widget.review.rating.text.semiBold.white
                              .size(context.screenWidth * 0.042)
                              .make(),
                        ],
                      ),
                      SizedBox(
                          height:
                              context.screenHeight * 0.01), // Add some space
                      "Message"
                          .text
                          .semiBold
                          .white
                          .size(context.screenWidth * 0.042)
                          .make(),
                      SizedBox(
                          height:
                              context.screenHeight * 0.01), // Add some space

                      widget.review.message.text.white.center
                          .size(context.screenWidth * 0.042)
                          .make(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const ProfileRow({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          child: Image.network(
            image,
            width:
                MediaQuery.of(context).size.width * 0.23, // 10% of screen width
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/burger_square.jpeg',
                width: MediaQuery.of(context).size.width *
                    0.23, // same width for error image
              );
            },
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
