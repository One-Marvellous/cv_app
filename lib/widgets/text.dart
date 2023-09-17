import 'package:flutter/material.dart';

// Define your custom TextStyles
class FormatText1 extends StatelessWidget {
  final String text;
  const FormatText1({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 20, fontFamily: 'Josefin Sans',
          color: Colors.white, // Change this to your desired color
          fontWeight: FontWeight.bold,
        ));
  }
}

class FormatText2 extends StatelessWidget {
  final String text;
  const FormatText2({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'Josefin Sans',
          color: Colors.blueGrey, // Change this to your desired color
          fontWeight: FontWeight.bold,
        ));
  }
}

class FormatText3 extends StatelessWidget {
  final String text;
  const FormatText3({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black, // Change this to your desired color
          fontWeight: FontWeight.bold,
        ));
  }
}

class FormatText4 extends StatelessWidget {
  final String text;
  const FormatText4({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.grey,
        ));
  }
}

class FormatText5 extends StatelessWidget {
  final String text;
  const FormatText5({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey, // Change this to your desired color
          fontStyle: FontStyle.italic,
        ));
  }
}

class FormatText6 extends StatelessWidget {
  final String text;
  const FormatText6({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 12.0,
          color: Colors.black, // Change this to your desired color
          fontWeight: FontWeight.bold,
        ));
  }
}

class BulletText extends StatelessWidget {
  final String text;
  const BulletText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    List<String> lines = text.split('\n');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...lines.map((line) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.circle,
                size: 8,
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width) - 110,
                child: FormatText4(text: line),
              )
            ],
          );
        })
      ],
    );
  }
}
