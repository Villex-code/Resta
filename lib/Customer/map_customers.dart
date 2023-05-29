import 'package:flutter/material.dart';
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
      child: Container(
        width: 377,
        height: 164,
        decoration: BoxDecoration(
            //color: Color.fromARGB(59, 188, 182, 182),
            ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://picsum.photos/seed/33/600',
              width: 250,
              height: 159,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
