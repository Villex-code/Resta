import 'package:flutter/material.dart';
import 'package:my_app/Customer/Review.dart';
import 'package:my_app/Customer/customer_homepage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:lottie/lottie.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class ThankYou extends StatefulWidget {
  const ThankYou({Key? key}) : super(key: key);

  @override
  State<ThankYou> createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> {
  Future<LottieComposition> _loadLottie() async {
    String url = 'https://assets9.lottiefiles.com/packages/lf20_jtl6gife.json';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var byteData = ByteData.view(response.bodyBytes.buffer);
      return await LottieComposition.fromByteData(byteData);
    } else {
      throw Exception('Failed to load Lottie file');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    double modalHeight = 0.6;

    void _handleScreenTap() {
      FocusScope.of(context).unfocus(); // Dismiss the keyboard
      setState(() {
        modalHeight = 0.6;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: _loadLottie(),
                builder: (BuildContext context,
                    AsyncSnapshot<LottieComposition> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return VxBox()
                        .height(
                          context.screenWidth * 0.5,
                        )
                        .make(); // Show loader while loading
                  } else {
                    if (snapshot.error != null) {
                      return Center(
                          child: Text(
                              'Error: ${snapshot.error}')); // Show error message in case of any issues
                    } else {
                      return Lottie(
                        composition: snapshot.data,
                        width: MediaQuery.of(context).size.width * 0.5,
                      ); // Display the Lottie animation
                    }
                  }
                },
              ),
              Text(
                'Thank You!',
                style: TextStyle(
                  fontSize: 0.06 * screenWidth, // 6% of screen width
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 0.02 * screenWidth), // 2% of screen width
              Text(
                'Enjoy your reservation !',
                style: TextStyle(
                  fontSize: 0.04 * screenWidth, // 4% of screen width
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 0.05 * screenWidth), // 5% of screen width
              CustomerReview(
                  onTapOutside: _handleScreenTap,
                  childReview: VxBox(
                    child: Center(
                      child: Text(
                        'Leave a review',
                        style: TextStyle(
                          fontSize: 0.045 * screenWidth, // 4.5% of screen width
                          color: Colors.green,
                        ),
                      ),
                    ),
                  )
                      .border(color: Colors.green, width: 2.3)
                      .roundedSM
                      .size(screenWidth * 0.55, screenWidth * 0.12)
                      .make()),
              SizedBox(height: 15), // 2% of screen width
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SeeCustomer_View()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: 0.04 * screenWidth, // 2% of screen width
                    horizontal: 0.06 * screenWidth, // 3% of screen width
                  ),
                ),
                child: Text(
                  'Return to Home Screen',
                  style: TextStyle(
                    fontSize: 0.045 * screenWidth, // 4.5% of screen width
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

class CheckmarkScreen extends StatefulWidget {
  @override
  _CheckmarkScreenState createState() => _CheckmarkScreenState();
}

class _CheckmarkScreenState extends State<CheckmarkScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Define the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    // Define the animation sequence
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return CustomPaint(
            painter: CheckmarkPainter(_animation.value),
          );
        },
      ),
    );
  }
}

class CheckmarkPainter extends CustomPainter {
  final double animationValue;

  CheckmarkPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    final path = Path();
    final double checkmarkSize = size.width * 0.8;
    final double checkmarkOffset = size.width * 0.1;
    final double lineLength = checkmarkSize * 0.4;

    path.moveTo(checkmarkOffset, size.height / 2);
    path.lineTo(checkmarkOffset + lineLength * animationValue,
        size.height / 2 + lineLength * animationValue);
    path.lineTo(checkmarkOffset + checkmarkSize, size.height / 2 - lineLength);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CheckmarkPainter oldDelegate) {
    return animationValue != oldDelegate.animationValue;
  }
}
