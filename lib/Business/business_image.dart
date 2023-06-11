import 'package:flutter/material.dart';
import 'package:my_app/Business/business_add_table.dart';
import 'package:my_app/Business/business_menu.dart';

import 'package:velocity_x/velocity_x.dart';

class BusinessImage extends StatelessWidget {
  const BusinessImage({super.key});

  final String text = 'Store';

  final String url = 'https://picsum.photos/seed/314/600';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 396,
      height: 290,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 290,
                      child: Stack(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                            child: PageView(
                              controller: PageController(initialPage: 0),
                              scrollDirection: Axis.horizontal,
                              children: [
                                InkWell(
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          //elevation: 16,
                                          child: Container(
                                            color: Colors.white10,
                                            height: 70,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text('Are you sure you want to remove the photo?'),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {

                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        primary: Colors.cyanAccent, // Background color
                                                      ),
                                                      child: Text('Yes',
                                                      style: TextStyle(color: Colors.black,),),
                                                    ),
                                                    SizedBox(width: 10.0,),
                                                    TextButton(
                                                        onPressed: () => Navigator.pop(context),
                                                      style: ElevatedButton.styleFrom(
                                                        primary: Colors.cyanAccent, // Background color
                                                      ),
                                                      child: Text('No',
                                                        style: TextStyle(color: Colors.black,),),
                                                    ),
                                                  ],
                                                )

                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://picsum.photos/seed/202/600',
                                        width: 300,
                                        height: 0,
                                        fit: BoxFit.cover,
                                      ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          //elevation: 16,
                                          child: Container(
                                            color: Colors.white10,
                                            height: 70,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text('Are you sure you want to remove the photo?'),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {

                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        primary: Colors.cyanAccent, // Background color
                                                      ),
                                                      child: Text('Yes',
                                                        style: TextStyle(color: Colors.black,),),
                                                    ),
                                                    SizedBox(width: 10.0,),
                                                    TextButton(
                                                      onPressed: () => Navigator.pop(context),
                                                      style: ElevatedButton.styleFrom(
                                                        primary: Colors.cyanAccent, // Background color
                                                      ),
                                                      child: Text('No',
                                                        style: TextStyle(color: Colors.black,),),
                                                    ),
                                                  ],
                                                )

                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://picsum.photos/seed/202/600',
                                      width: 300,
                                      height: 0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          //elevation: 16,
                                          child: Container(
                                            color: Colors.white10,
                                            height: 70,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text('Are you sure you want to remove the photo?'),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {

                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        primary: Colors.cyanAccent, // Background color
                                                      ),
                                                      child: Text('Yes',
                                                        style: TextStyle(color: Colors.black,),),
                                                    ),
                                                    SizedBox(width: 10.0,),
                                                    TextButton(
                                                      onPressed: () => Navigator.pop(context),
                                                      style: ElevatedButton.styleFrom(
                                                        primary: Colors.cyanAccent, // Background color
                                                      ),
                                                      child: Text('No',
                                                        style: TextStyle(color: Colors.black,),),
                                                    ),
                                                  ],
                                                )

                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://picsum.photos/seed/202/600',
                                      width: 300,
                                      height: 0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
