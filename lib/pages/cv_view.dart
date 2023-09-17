import 'package:cv/pages/editpage.dart';
import 'package:cv/widgets/content.dart';
import 'package:cv/widgets/education.dart';
import 'package:cv/widgets/experience.dart';
import 'package:cv/widgets/info.dart';
import 'package:cv/widgets/profile.dart';
import 'package:flutter/material.dart';

import '../Utilities/data.dart';

class CvViewPage extends StatefulWidget {
  const CvViewPage({super.key});

  @override
  State<CvViewPage> createState() => _CvViewPageState();
}

class _CvViewPageState extends State<CvViewPage> {
  Data cvData = Data();

  // The method that is called from the next page that updates and replaces the initialization data
  void refreshCvViewPage({
    String? bio,
    List<String>? myInfoList,
    List<List<String>>? experienceData,
    List<List<String>>? eduData,
  }) {
    setState(() {
      cvData.profileDescription = bio!;

      cvData.eduData.clear();
      cvData.eduData.addAll(eduData!);

      cvData.myInfoList.clear();
      cvData.myInfoList.addAll(myInfoList!);

      cvData.experienceData.clear();
      cvData.experienceData.addAll(experienceData!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  EditPage(updateCvViewPage: refreshCvViewPage),
            ),
          );
        },
        child: const Text('Edit CV'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Info(cvData.myInfoList),
            const SizedBox(
              height: 30,
            ),
            const Content(
                icon: Icon(
                  Icons.account_circle,
                  size: 15,
                  color: Colors.white,
                ),
                text: 'Profile'),
            Profile(description: cvData.profileDescription),
            const Content(
                icon: Icon(
                  Icons.work_history,
                  size: 15,
                  color: Colors.white,
                ),
                text: 'Work experience'),
            ...cvData.experienceData
                .map((data) => Experience(data: data))
                .toList(),
            const Content(
                icon: Icon(
                  Icons.school,
                  size: 15,
                  color: Colors.white,
                ),
                text: 'Education'),
            ...cvData.eduData.map((data) => Education(data: data)).toList()
          ],
        ),
      ),
    );
  }
}
