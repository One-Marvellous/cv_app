import 'package:cv/widgets/text.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final List<String> info;
  const Info(this.info, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      //margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormatText1(text: info[0]),
            const SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                Icons.calendar_month,
                size: 15,
                color: Colors.blueGrey,
              ),
              FormatText4(
                text: info[1],
              ),
              const Icon(
                Icons.location_on,
                size: 15,
                color: Colors.blueGrey,
              ),
              FormatText4(
                text: info[2],
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                Icons.mail,
                size: 15,
                color: Colors.blueGrey,
              ),
              FormatText4(
                text: info[3],
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.alternate_email,
                  size: 15,
                  color: Colors.blueGrey,
                ),
                FormatText4(
                  text: info[4],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
