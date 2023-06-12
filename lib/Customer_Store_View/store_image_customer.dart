import 'package:flutter/material.dart';
import 'package:my_app/Customer/listOfStores_customer.dart';

import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';

import 'package:my_app/Customer_Store_View/store_view_from_customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('business')
          .doc(widget.id)
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return Text("Error loading data");
        }
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;

        String? name = data.containsKey('name') ? data['name'] : 'Unknown';
        String? picture =
            data.containsKey('picture_main') ? data['picture_main'] : 'Unknown';
        String? address =
            data.containsKey('address') ? data['address'] : 'Unknown';
        String? ratings =
            data.containsKey('rating') ? data['rating'].toString() : 'Unknown';
        String? reviews = data.containsKey('number_of_reviews')
            ? data['number_of_reviews'].toString()
            : 'Unknown';
        String? description = data.containsKey('description')
            ? data['description']
            : 'Store Description';

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
                      id: widget.id,
                      name: name ?? 'No name found',
                      address: address ?? 'No address found',
                      ratings: ratings ?? '-',
                      reviews: reviews ?? '-',
                      description: description ??
                          "This store hasn't included a description"),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage.assetNetwork(
                placeholder:
                    'assets/placeholder.png', // local placeholder image
                image: picture ?? '', // main image
                fit: BoxFit.cover,
                width: 300,
                height: 200,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://toohotel.com/wp-content/uploads/2022/09/TOO_restaurant_Panoramique_vue_Paris_Seine_Tour_Eiffel_2.jpg',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
