import 'package:cv/widgets/circle_avatar.dart';
import 'package:cv/widgets/text.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final Widget icon;
  final String text;

  const Content({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 54,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomCircularAvatar(
                        backgroundColor: Colors.black, icon: icon),
                    const SizedBox(width: 10),
                    FormatText2(text: text),
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
