import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomInfoWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          // Replace this with your image widget
          Image.asset(
            'assets/images/my_image.png',
            width: 120.0,
            height: 80.0,
          ),
          SizedBox(height: 8.0),
          Text(
            'Custom Info Window',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            'This is a custom info window.',
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}