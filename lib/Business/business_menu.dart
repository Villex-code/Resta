import 'package:flutter/material.dart';
import 'package:my_app/Business/Business_Reservations/business_reservations.dart';
import 'package:my_app/Business/business_home_page.dart';

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
                MaterialPageRoute(builder: (context) => BusinessView()),
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
        body:Column(
            children: [
        Expanded(
        child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 2, 8, 3),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
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
            );
          },
        ),
      ),
    ),
    ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              onPressed: () {
               /* Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Business_Reservations(
                            text: "https://www.onspot-app.com",
                            url: "hello",
                            table: [],
                            seats: [],
                            categories: [],
                          )),
                );*/
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
               /* Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Business_Reservations(
                            text: "https://www.onspot-app.com",
                            url: "hello",
                            table: [],
                            seats: [],
                            categories: [],
                          )),
                );*/
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
