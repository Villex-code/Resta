import 'package:flutter/material.dart';
import 'package:my_app/theme/app_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupMethodBlock extends StatelessWidget {
  final String image;
  final String text;

  const SignupMethodBlock({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.9,
      height: context.screenWidth * 0.18,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              image,
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  color: AppTheme.colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
