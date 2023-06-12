import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchBarCustomer extends StatefulWidget {
  const SearchBarCustomer({super.key});

  @override
  State<SearchBarCustomer> createState() => _SearchBarCustomerState();
}

class _SearchBarCustomerState extends State<SearchBarCustomer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 18, 20, 8),
    child: GestureDetector(
    onTap: () {
    // Handle onTap event here
    print('Container tapped!');
    },
      child: Container(
        //width: double.infinity,
        width: context.screenWidth,
        height: 46,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 184, 209, 232),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                child: Icon(
                  Icons.search_rounded,
                  color: Color.fromARGB(226, 246, 248, 249),
                  size: 24,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  child: TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: 'Clash Display',
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
