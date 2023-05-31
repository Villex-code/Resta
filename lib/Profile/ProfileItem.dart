import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileItem extends StatefulWidget {
  final IconData icon;
  final String name;
  final Widget destination;

  const ProfileItem(
      {Key? key,
      required this.icon,
      required this.name,
      required this.destination})
      : super(key: key);

  @override
  State<ProfileItem> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.destination),
        );
        if (widget.name == 'Account') {
          setState(() {});
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 20),
        child: Row(
          children: [
            Icon(widget.icon),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            Text(widget.name)
                .text
                .semiBold
                .size(context.screenWidth * 0.044)
                .make(),
          ],
        ),
      ),
    );
  }
}
