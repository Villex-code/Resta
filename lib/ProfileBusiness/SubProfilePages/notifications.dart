import 'package:flutter/material.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:my_app/backend/business.dart';

import 'package:provider/provider.dart';

import 'package:velocity_x/velocity_x.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _enableNotifications = true;
  bool _enableEmails = true;

  Future<void> _fetchNotificationData() async {
    final currentUser = Provider.of<CurrentUser>(context, listen: false);
    final notificationsData = await currentUser.readData("notifications");
    final emailsData = await currentUser.readData("emails");

    setState(() {
      _enableNotifications = notificationsData ?? true;
      _enableEmails = emailsData ?? true;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchNotificationData();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentBusiness>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.03, // Left padding
                  0, // Top padding
                  MediaQuery.of(context).size.width * 0.03, // Right padding
                  0, // Bottom padding
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: BackButton(),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: "Notifications"
                          .text
                          .bold
                          .size(context.screenWidth * 0.048)
                          .make(),
                    ),
                  ],
                ),
              ),
              (context.screenHeight * 0.02).heightBox,
              SwitchListTile(
                title: "Enable Notifications"
                    .text
                    .size(context.screenWidth * 0.045)
                    .semiBold
                    .make(),
                value: _enableNotifications,
                onChanged: (value) async {
                  setState(() {
                    _enableNotifications = value;
                  });
                  await currentUser
                      .setData({"notifications": _enableNotifications});
                },
              ),
              SwitchListTile(
                title: "Receive Emails"
                    .text
                    .size(context.screenWidth * 0.045)
                    .semiBold
                    .make(),
                value: _enableEmails,
                onChanged: (value) async {
                  setState(() {
                    _enableEmails = value;
                  });
                  await currentUser.setData({"emails": _enableEmails});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
