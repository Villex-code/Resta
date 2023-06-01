import 'package:flutter/material.dart';
import 'business_home_page.dart';
import 'business_reservations.dart';

//import 'package:test_app/home_page.dart';

class Business_MenuView extends StatelessWidget {
  const Business_MenuView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menuback.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BusinessView()),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Row(children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/company.png'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text('Company name'),
          ]),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/menuback.jpg'), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 100,
                child: Center(
                    child: Text("Menu",
                        style: TextStyle(
                            fontFamily: 'OoohBaby',
                            fontSize: 50,
                            color: Colors.white))),
              ),
              SizedBox(
                height: 30.0,
              ),
              Image.asset(
                'assets/menu.jpg',
                fit: BoxFit.fill,
              ),
            ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Business_Reservations()),
                );
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
          Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Business_Reservations()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey, // Background color
              ),
              icon: Icon(
                Icons.remove_circle,
                size: 24.0,
              ),
              label: Text('Remove Menu'),
            ),
          ),
        ]),
      ),
    );
  }
}
