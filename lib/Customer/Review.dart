import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/backend/business.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:my_app/theme/app_theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'package:my_app/Authentication/user.dart';

class CustomerReview extends StatefulWidget {
  final VoidCallback onTapOutside;
  final Widget childReview;
  const CustomerReview(
      {super.key, required this.onTapOutside, required this.childReview});

  @override
  State<CustomerReview> createState() => _CustomerReviewState();
}

class _CustomerReviewState extends State<CustomerReview>
    with WidgetsBindingObserver {
  double modalHeight = 0.6;
  bool isKeyboardOpen = false;
  TextEditingController reviewController = TextEditingController();
  double ratingLast = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    reviewController
        .dispose(); // Dispose the controller when the widget is removed
  }

  @override
  void didChangeMetrics() {
    final keyboardOpen = WidgetsBinding.instance.window.viewInsets.bottom > 0;
    if (!keyboardOpen && isKeyboardOpen) {
      setState(() {
        modalHeight = 0.6;
      });
    }
    isKeyboardOpen = keyboardOpen;
  }

  void _handleTextFieldTap() {
    setState(() {
      modalHeight = 0.8;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser>(context, listen: false);
    final currentBusiness =
        Provider.of<CurrentBusiness>(context, listen: false);
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: modalHeight,
              child: GestureDetector(
                onTap: widget.onTapOutside,
                child: Container(
                  padding: EdgeInsets.all(context.screenHeight * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Leave a review',
                            style: TextStyle(
                              fontSize: context.screenWidth * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          )
                        ],
                      ),
                      SizedBox(height: context.screenHeight * 0.02),
                      VxBox(
                              child: RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 6.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          // Handle the rating update here
                          setState(() {
                            ratingLast = rating;
                          });
                        },
                      ))
                          .size(context.screenWidth, context.screenWidth * 0.06)
                          .alignCenter
                          .makeCentered(),
                      (context.screenHeight * 0.04).heightBox,
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.28,
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          onTap: _handleTextFieldTap,
                          controller: reviewController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppTheme.colors.grey),
                            ), // Border when the input field is enabled
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppTheme.colors.green),
                            ), // Border when the input field is focused
                            hintText:
                                'Let as know what you think of the experience',
                            hintMaxLines: 5,
                          ),
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.02),
                      const Spacer(), // Pushes the button to the bottom
                      SizedBox(
                        height: context.screenWidth *
                            0.16, // 8% of the screen height
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.colors.green,
                          ),
                          onPressed: () async {
                            print(reviewController.text);
                            print(ratingLast);

                            // Fetch user name
                            String userName =
                                await currentUser.readData("name");

                            String businessName =
                                await currentBusiness.readData("name");

                            // Access the 'reviews' sub-collection in the business document
                            CollectionReference reviews = FirebaseFirestore
                                .instance
                                .collection('business')
                                .doc(currentBusiness.businessId)
                                .collection('reviews');

                            CollectionReference userReviews = FirebaseFirestore
                                .instance
                                .collection('users')
                                .doc(currentUser.user
                                    ?.uid) // I assume you want to add to the user's document and not the business's
                                .collection('reviews');

                            try {
                              // Add a new document to the collection
                              await reviews.add({
                                'user': userName,
                                'time': Timestamp.now(),
                                'message': reviewController.text,
                                'rating': ratingLast,
                              });
                              print('Review added');
                            } catch (e) {
                              print('Error adding business review: $e');
                            }
                            try {
                              // Add a new document to the collection
                              await userReviews.add({
                                'name': businessName,
                                'time': Timestamp.now(),
                                'message': reviewController.text,
                                'rating': ratingLast,
                              });
                              print('Review added');
                            } catch (e) {
                              print('Error adding users review: $e');
                            }

                            setState(() {
                              reviewController.text = '';
                            });

                            Navigator.pop(context);
                          },
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.screenWidth * 0.053,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.02),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: widget.childReview,
    );
  }
}
