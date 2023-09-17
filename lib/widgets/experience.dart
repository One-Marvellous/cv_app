import 'package:cv/widgets/text.dart';
import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  final List<String> data;
  const Experience({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 48,
                child: FormatText5(text: '${data[2]}' ' - ' '${data[3]}'),
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
                        ),
                      ),
                      const SizedBox(width: 6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: (MediaQuery.of(context).size.width) - 90,
                              child: FormatText3(text: data[0])),
                          const SizedBox(
                            height: 5,
                          ),
                          BulletText(text: data[1]),
                        ],
                      ),
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
