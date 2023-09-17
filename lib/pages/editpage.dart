import 'package:flutter/material.dart';

import '../Utilities/data_model.dart';

class EditPage extends StatefulWidget {
  final Function updateCvViewPage;
  const EditPage({super.key, required this.updateCvViewPage});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  List<Experience> experienceData = [];
  List<Education> educationData = [];
  bool missingFields = false;
  bool experienceMissingFields = false;
  bool educationMissingFields = false;

  // Every controller needed for the various text form fields
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController slackController = TextEditingController();
  TextEditingController gitHubController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  TextEditingController eduDetailsController = TextEditingController();
  TextEditingController eduStartDateController = TextEditingController();
  TextEditingController eduEndDateController = TextEditingController();

  TextEditingController workRoleController = TextEditingController();
  TextEditingController workDescriptionController = TextEditingController();
  TextEditingController workStartDateController = TextEditingController();
  TextEditingController workEndDateController = TextEditingController();

  List<List<String>> experienceToData(List<Experience> experiences) {
    return experiences
        .map((experience) => [
              experience.role,
              experience.description,
              experience.startDate,
              experience.endDate,
            ])
        .toList();
  }

  List<List<String>> educationToData(List<Education> educations) {
    return educations
        .map((education) => [
              education.details,
              education.startDate,
              education.endDate,
            ])
        .toList();
  }

  void addExperience() {
    final role = workRoleController.text;
    final description = workDescriptionController.text;
    final startDate = workStartDateController.text;
    final endDate = workEndDateController.text;

    if (role.isNotEmpty &&
        description.isNotEmpty &&
        startDate.isNotEmpty &&
        endDate.isNotEmpty) {
      setState(() {
        final newExperience = Experience(
          role: role,
          description: description,
          startDate: startDate,
          endDate: endDate,
        );
        experienceData.add(newExperience);

        // Clear text controllers
        workRoleController.clear();
        workDescriptionController.clear();
        workStartDateController.clear();
        workEndDateController.clear();
      });
    } else {
      setState(() {
        experienceMissingFields = true;
      });
    }
  }

  void deleteExperience(int index) {
    setState(() {
      experienceData.removeAt(index);
    });
  }

  void addEducation() {
    final details = eduDetailsController.text;
    final startDate = eduStartDateController.text;
    final endDate = eduEndDateController.text;

    if (details.isNotEmpty && startDate.isNotEmpty && endDate.isNotEmpty) {
      setState(() {
        final newEducation = Education(
          details: details,
          startDate: startDate,
          endDate: endDate,
        );
        educationData.add(newEducation);

        // Clear text controllers
        eduDetailsController.clear();
        eduStartDateController.clear();
        eduEndDateController.clear();
      });
    } else {
      setState(() {
        educationMissingFields = true;
      });
    }
  }

  void deleteEducation(int index) {
    setState(() {
      educationData.removeAt(index);
    });
  }

  @override
  void dispose() {
    // Dispose all controllers used
    fullNameController.dispose();
    dobController.dispose();
    locationController.dispose();
    slackController.dispose();
    gitHubController.dispose();
    bioController.dispose();

    eduDetailsController.dispose();
    eduStartDateController.dispose();
    eduEndDateController.dispose();

    workRoleController.dispose();
    workDescriptionController.dispose();
    workStartDateController.dispose();
    workEndDateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit CV')),
      floatingActionButton:
          FloatingActionButton(onPressed: onPressed, child: const Text('Save')),
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              smallCustomContainer(
                  hintText: 'John Doe',
                  context: context,
                  title: "Full Name",
                  controller: fullNameController),
              smallCustomContainer(
                  hintText: '31/12/1900',
                  context: context,
                  title: "Date of Birth",
                  controller: dobController),
              smallCustomContainer(
                  hintText: 'Kent, Washington',
                  context: context,
                  title: "Location",
                  controller: locationController),
              smallCustomContainer(
                  hintText: '@Slack',
                  context: context,
                  title: "Slack Username",
                  controller: slackController),
              smallCustomContainer(
                  hintText: 'https://github.com/Username',
                  context: context,
                  title: "Git Hub Handle",
                  controller: gitHubController),
              largeCustomContainer(
                  context: context,
                  title: "Personal Bio",
                  controller: bioController,
                  hintText: 'Brief Personal Bio'),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: <Widget>[
                    const Center(
                      child: Text(
                        'Work Experience field',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                    largeCustomContainer(
                        context: context,
                        title: 'Role',
                        controller: workRoleController,
                        hintText: 'Mobile Developer'),
                    largeCustomContainer(
                        context: context,
                        title: 'Role Description',
                        controller: workDescriptionController,
                        hintText: 'Develop an App'),
                    smallCustomContainer(
                        context: context,
                        title: 'Start Date',
                        controller: workStartDateController,
                        hintText: '01/2000'),
                    smallCustomContainer(
                        context: context,
                        title: 'End Date',
                        controller: workEndDateController,
                        hintText: '12/2000'),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: addExperience,
                      child: const Text('Add Work Experience'),
                    ),
                    const SizedBox(height: 8.0),
                    experienceMissingFields
                        ? const Text(
                            "Please fill in all work experience details",
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              const Divider(),
              Column(
                children: experienceData.asMap().entries.map((entry) {
                  final index = entry.key;
                  final experience = entry.value;
                  return ListTile(
                    title: Text(
                      experience.role,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(experience.description,
                            style: const TextStyle(color: Colors.white)),
                        Text(
                          'Start Date: ${experience.startDate} - End Date: ${experience.endDate}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: () => deleteExperience(index),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: <Widget>[
                    const Center(
                      child: Text(
                        'Education field',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                    largeCustomContainer(
                        context: context,
                        title: 'Educational Details',
                        controller: eduDetailsController,
                        hintText: 'BSC. Computer Science'),
                    smallCustomContainer(
                        context: context,
                        title: 'Start Year',
                        controller: eduStartDateController,
                        hintText: '2000'),
                    smallCustomContainer(
                        context: context,
                        title: 'End Year',
                        controller: eduEndDateController,
                        hintText: '2010'),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: addEducation,
                      child: const Text('Add Education'),
                    ),
                    const SizedBox(height: 8.0),
                    educationMissingFields
                        ? const Text(
                            "Please fill in all Educational Fields",
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              const Divider(),
              Column(
                children: educationData.asMap().entries.map((entry) {
                  final index = entry.key;
                  final education = entry.value;
                  return ListTile(
                    title: Text(
                      education.details,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Year: ${education.startDate} - End Year: ${education.endDate}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: () => deleteEducation(index),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 60,
              ),
              missingFields
                  ? const Text(
                      "Please fill in all the details",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

// Widgets

  Widget smallCustomContainer(
      {required BuildContext context,
      required String title,
      required TextEditingController controller,
      required String hintText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),

          // holds the title of each detail
          Text(
            title,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
          ),

          const SizedBox(
            height: 10,
          ),

          Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                keyboardType: TextInputType.text,
                controller: controller,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: hintText,
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget largeCustomContainer(
      {required BuildContext context,
      required String title,
      required TextEditingController controller,
      required String hintText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),

          // holds the title of each detail
          Text(
            title,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
          ),

          const SizedBox(
            height: 10,
          ),

          Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              keyboardType: TextInputType.multiline,
              textAlignVertical: TextAlignVertical.top,
              maxLines: null,
              expands: true,
              minLines: null,
              controller: controller,
              decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.grey)),
            ),
          )
        ],
      ),
    );
  }

  void onPressed() {
    // checks to make sure that every field was entered/ filled
    if (fullNameController.text.isNotEmpty &&
        dobController.text.isNotEmpty &&
        locationController.text.isNotEmpty &&
        slackController.text.isNotEmpty &&
        gitHubController.text.isNotEmpty &&
        bioController.text.isNotEmpty &&
        experienceData.isNotEmpty &&
        educationData.isNotEmpty) {
      setState(() {
        final name = fullNameController.text.trim();
        final dob = dobController.text.trim();
        final location = locationController.text.trim();
        final gitHub = gitHubController.text.trim();
        final slack = slackController.text.trim();
        final experienceDataList = experienceToData(experienceData);
        final educationDataList = educationToData(educationData);

        final newInfoData = [
          name,
          dob,
          location,
          gitHub,
          slack,
        ];

        // Called the update home screen and the data are passed into it for the update in the previous screen
        widget.updateCvViewPage(
          experienceData: experienceDataList,
          eduData: educationDataList,
          myInfoList: newInfoData,
          bio: bioController.text.trim(),
        );

        Navigator.pop(context);
      });
    }

    // If there is any missing field, the missingField variable is set to true
    // This releases a prompt close to the button to notify you that at least one of the input was not filled
    else {
      setState(() {
        missingFields = true;
      });
    }
  }
}
