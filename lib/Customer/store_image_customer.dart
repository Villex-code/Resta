import 'package:flutter/material.dart';
import 'package:my_app/Customer/listOfStores_customer.dart';
import 'package:my_app/Customer/store_view_from_customer.dart';
import 'package:velocity_x/velocity_x.dart';

class StoreImage extends StatefulWidget {
  const StoreImage({super.key});

  @override
  State<StoreImage> createState() => _StoreImageState();
}

class _StoreImageState extends State<StoreImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SeeStoreViewfromCustomer(
                    name: 'dimos11',
                    address: 'Ipokratous 20',
                    ratings: '4.6',
                    reviews: '1800',
                    description: 'here is the description')),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://picsum.photos/seed/16/600',
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
