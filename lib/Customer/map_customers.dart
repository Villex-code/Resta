import 'package:flutter/material.dart';
import 'package:my_app/Customer/CurrentLocation.dart';
import 'package:velocity_x/velocity_x.dart';

class MapCustomer extends StatefulWidget {
  const MapCustomer({super.key});

  @override
  State<MapCustomer> createState() => _MapCustomerState();
}

class _MapCustomerState extends State<MapCustomer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Navigate to another page when the image is clicked
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewCurrentLocationScreen(),
            ),
          );
        },
        child: Container(
          height: 175,
          decoration: BoxDecoration(
            //color: Color.fromARGB(59, 188, 182, 182),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 14, 20, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://jobstoreblog.s3-accelerate.amazonaws.com/magazine/wp-content/uploads/2020/02/google-map-features-.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
