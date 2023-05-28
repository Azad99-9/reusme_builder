import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/pages/Preview.dart';
import 'package:resume_builder/pages/commonWidgets.dart';
import 'package:resume_builder/models/UserDetails.dart';

class ProjectDetails extends StatefulWidget {
  ProjectDetails({super.key, required this.userDetails});

  UserDetails userDetails;
  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  TextEditingController _projectNameController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _outcomesController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _projectLinksController = TextEditingController();
  TextEditingController _achievementLinkController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Projects and Achievements',
                    style: GoogleFonts.oswald(
                        fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                sectionHeading("Projects"),
                InputField(hinttext: "Project name", inputController: _projectNameController),
                InputField(hinttext: "Role (eg: backend developer)", inputController: _roleController),
                fourLineInput(hinttext: "Outcomes (comma seperated)", inputController: _outcomesController,),
                fourLineInput(hinttext: "project description", inputController: _descriptionController,),
                fourLineInput(hinttext: "Provide project links (comma seperated)", inputController: _projectLinksController,),
                sectionHeading("Achievements"),
                fourLineInput(hinttext: "Provide achievement links (comma seperated)", inputController: _achievementLinkController,),
                goToNextPage(preScreenName: "Profesional Details", nextScreenName: "preview", nextAction: () {
                  widget.userDetails.AchievementDetails = {
                    "projectName": _projectNameController.text,
                    "roleName": _roleController.text,
                    "projectOutcomes": _outcomesController.text.split(","),
                    "projectDescription": _descriptionController.text ,
                    "projectLinks": _projectLinksController.text.split(","),
                    "achievementLinks": _achievementLinkController.text.split(","),
                  };
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => Preview(userDetails: widget.userDetails))));
                }, preAction: () async {
                  Navigator.pop(context, widget.userDetails);
                })
                

              ],
            )),
      ),
    );
  }
}

