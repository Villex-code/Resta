import 'package:flutter/material.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileEditField extends StatefulWidget {
  final String title;
  final String placeholder;
  final bool verified;
  final VoidCallback onTapOutside;
  final String fieldKey;

  const ProfileEditField({
    Key? key,
    required this.title,
    required this.fieldKey,
    required this.placeholder,
    required this.verified,
    required this.onTapOutside,
  }) : super(key: key);

  @override
  _ProfileEditFieldState createState() => _ProfileEditFieldState();
}

class _ProfileEditFieldState extends State<ProfileEditField>
    with WidgetsBindingObserver {
  double modalHeight = 0.5;
  bool isKeyboardOpen = false;
  String inputValue = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final keyboardOpen = WidgetsBinding.instance.window.viewInsets.bottom > 0;
    if (!keyboardOpen && isKeyboardOpen) {
      setState(() {
        modalHeight = 0.5;
      });
    }
    isKeyboardOpen = keyboardOpen;
  }

  void _handleTextFieldTap() {
    setState(() {
      modalHeight = 0.75;
    });
  }

  void _handleScreenTap() {
    FocusScope.of(context).unfocus(); // Dismiss the keyboard
    setState(() {
      modalHeight = 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      subtitle: Text(widget.placeholder),
      trailing: widget.verified
          ? const Icon(Icons.check_circle, color: Colors.green)
          : null,
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: modalHeight,
              child: GestureDetector(
                onTap: widget.onTapOutside,
                child: Container(
                  padding: EdgeInsets.all(context.screenHeight * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Edit ${widget.title}',
                        style: TextStyle(
                          fontSize: context.screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: context.screenHeight * 0.02),
                      Text(
                        'Current ${widget.title}: ${widget.placeholder}', // Display current value
                        style: TextStyle(
                          fontSize: context.screenWidth * 0.042,
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.04),
                      Text(
                        'New ${widget.title}', // Prompt for new value
                        style: TextStyle(
                          fontSize: context.screenWidth * 0.042,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.02),
                      TextField(
                        onTap: _handleTextFieldTap,
                        onChanged: (value) {
                          inputValue = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter new ${widget.title} here',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.02),
                      const Spacer(), // Pushes the button to the bottom
                      SizedBox(
                        height: context.screenWidth *
                            0.16, // 8% of the screen height
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            // Save changes here
                            Provider.of<CurrentUser>(context, listen: false)
                                .setData({widget.fieldKey: inputValue});
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Update',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.screenWidth * 0.053,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.02),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
