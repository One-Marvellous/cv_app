import 'package:cv/widgets/text.dart';
import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  final List<String> data;
  const Education({super.key, required this.data});

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
                child: FormatText5(text: '${data[1]}' '-' '${data[2]}'),
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
