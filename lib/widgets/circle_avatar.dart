import 'package:flutter/material.dart';

class CustomCircularAvatar extends StatelessWidget {
  final Color backgroundColor;
  final Widget icon;

  const CustomCircularAvatar({
    super.key,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
        ),
        icon,
      ],
    );
  }
}
