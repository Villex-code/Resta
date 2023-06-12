import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Business/Business_Reservations/business_reservations.dart';
import 'package:my_app/Business/business_home_page.dart';
import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Business_MenuView extends StatefulWidget {
  const Business_MenuView({Key? key});

  @override
  State<Business_MenuView> createState() => _Business_MenuViewState();
}

class _Business_MenuViewState extends State<Business_MenuView> {
  @override
  Widget build(BuildContext context) {
    final currentBusiness = Provider.of<CurrentBusiness>(context, listen: true);

    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BusinessView()),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/company.png'),
              ),
              SizedBox(width: 20.0),
              Text('Company name'),
            ],
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  child: Center(
                    child: Text(
                      "Menu",
                      style: TextStyle(
                        fontFamily: 'OoohBaby',
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('business')
                      .doc(currentBusiness.businessId)
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (!snapshot.hasData) {
                      return Image.asset(
                        'assets/menu.jpg',
                        fit: BoxFit.fill,
                      );
                    }

                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;

                    String menuImageUrl = data['menu'] ?? 'assets/menu.jpg';

                    return Image.network(
                      menuImageUrl,
                      width: context.screenWidth * 0.9,
                      height: context.screenHeight * 0.5,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          'assets/menu.jpg',
                          fit: BoxFit.cover,
                          width: context.screenWidth * 0.9,
                          height: context.screenHeight * 0.5,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton.icon(
                onPressed: () async {
                  // User uploads a menu here
                  await currentBusiness.uploadMenu(context);
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey, // Background color
                ),
                icon: Icon(
                  Icons.upload,
                  size: 24.0,
                ),
                label: Text('Upload Menu'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
