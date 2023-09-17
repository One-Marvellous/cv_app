import 'package:cv/widgets/text.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String description;
  const Profile({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        height: 30,
                        child: VerticalDivider(
                          color: Colors.black,
                          thickness: 1.0,
                          // indent: 20,
                          // endIndent: 20,
                        ),
                      ),
                      const SizedBox(width: 6),
                      SizedBox(
                          width: (MediaQuery.of(context).size.width) - 90,
                          child: FormatText4(text: description)),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
