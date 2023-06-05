import 'package:flutter/material.dart';
import 'package:my_app/Customer/listOfStores_customer.dart';

import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';

import 'package:my_app/Customer_Store_View/store_view_from_customer.dart';

import 'package:velocity_x/velocity_x.dart';

class StoreImage extends StatefulWidget {
  final String id;
  const StoreImage({super.key, required this.id});

  @override
  State<StoreImage> createState() => _StoreImageState();
}

class _StoreImageState extends State<StoreImage> {
  @override
  Widget build(BuildContext context) {
    final currentBusiness =
        Provider.of<CurrentBusiness>(context, listen: false);
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () async {
          await currentBusiness.setBusiness(widget.id);
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
            'https://toohotel.com/wp-content/uploads/2022/09/TOO_restaurant_Panoramique_vue_Paris_Seine_Tour_Eiffel_2.jpg',
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
