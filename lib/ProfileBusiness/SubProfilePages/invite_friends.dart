import 'package:flutter/material.dart';
import 'package:my_app/backend/business.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Authentication/user.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_app/theme/app_theme.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class InviteFriends extends StatelessWidget {
  InviteFriends({super.key});

  String message =
      'Use this amazing app to order and pay for your order in seconds';

  shareText() {
    Share.share(message);
  }

  void openWhatsApp(String message) async {
    String url = "whatsapp://send?text=${Uri.parse(message)}";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
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
                      child: "Invite Friends"
                          .text
                          .bold
                          .size(context.screenWidth * 0.048)
                          .make(),
                    ),
                  ],
                ),
              ),
              VxBox(
                      child: Image.asset(
                'assets/qrcode_logo_small.png',
              ))
                  .size(context.screenWidth * 0.44, context.screenWidth * 0.44)
                  .border()
                  .rounded
                  .make(),
              (context.screenHeight * 0.04).heightBox,
              VxBox(
                      child:
                          "Scan the qr code above to share our amazing app with a friend"
                              .text
                              .center
                              .color(AppTheme.colors.pink)
                              .semiBold
                              .size(context.screenWidth * 0.044)
                              .make())
                  .margin(EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.035))
                  .make(),
              (context.screenHeight * 0.04).heightBox,
              VxBox(
                      child:
                          "Give it a try and let us know what you think! by leaving a review here You can download it from [App Store/Play Store link] or visit our website at my_app-app.com. Happy exploring!"
                              .text
                              .size(context.screenWidth * 0.04)
                              .center
                              .make())
                  .margin(EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.1))
                  .make(),
              (context.screenHeight * 0.04).heightBox,
              InkWell(
                onTap: () {
                  openWhatsApp('https://my_app-app.com');
                },
                child: VxBox(
                        child: Row(
                  children: [
                    VxBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          VxBox(
                                  child: Image.asset(
                            'assets/whatsapp_icon.webp',
                            fit: BoxFit.contain,
                          ))
                              .size(context.screenWidth * 0.12,
                                  context.screenWidth * 0.12)
                              .make(),
                          (context.screenHeight * 0.02).heightBox,
                          "WhatsApp"
                              .text
                              .size(context.screenWidth * 0.044)
                              .make()
                        ],
                      ),
                    )
                        .size(context.screenWidth * 0.33,
                            context.screenHeight * 0.44)
                        .make(),
                    VxBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          VxBox(
                                  child: Image.asset(
                            'assets/viber_logo_image.png',
                            fit: BoxFit.contain,
                          ))
                              .size(context.screenWidth * 0.12,
                                  context.screenWidth * 0.12)
                              .make(),
                          (context.screenHeight * 0.02).heightBox,
                          "Viber".text.size(context.screenWidth * 0.044).make()
                        ],
                      ),
                    )
                        .size(context.screenWidth * 0.34,
                            context.screenWidth * 0.44)
                        .withDecoration(BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color:
                                  AppTheme.colors.grey, // Color of the border
                              style: BorderStyle.solid, // Style of the border
                              width: 1, // width of the border
                            ),
                            left: BorderSide(
                              color:
                                  AppTheme.colors.grey, // Color of the border
                              style: BorderStyle.solid, // Style of the border
                              width: 1, // width of the border
                            ),
                          ),
                        ))
                        .make(),
                    InkWell(
                      onTap: () {
                        shareText();
                      },
                      child: VxBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            VxBox(child: Icon(Icons.more_horiz))
                                .size(context.screenWidth * 0.14,
                                    context.screenWidth * 0.14)
                                .border()
                                .rounded
                                .make(),
                            (context.screenHeight * 0.02).heightBox,
                            "More".text.size(context.screenHeight * 0.02).make()
                          ],
                        ),
                      )
                          .size(context.screenWidth * 0.33,
                              context.screenWidth * 0.44)
                          .make(),
                    ),
                  ],
                ))
                    .size(context.screenWidth, context.screenWidth * 0.4)
                    .withDecoration(BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppTheme.colors.grey, // Color of the border
                          style: BorderStyle.solid, // Style of the border
                          width: 1, // width of the border
                        ),
                        bottom: BorderSide(
                          color: AppTheme.colors.grey, // Color of the border
                          style: BorderStyle.solid, // Style of the border
                          width: 1, // width of the border
                        ),
                      ),
                    ))
                    .make(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
