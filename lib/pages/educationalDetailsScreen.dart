import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/models/UserDetails.dart';
import 'package:resume_builder/pages/commonWidgets.dart';
import 'package:resume_builder/pages/professionalDetailsScreen.dart';

class EducationalDetails extends StatefulWidget {
  EducationalDetails({super.key, required this.userDetails});

  UserDetails userDetails;

  @override
  State<EducationalDetails> createState() => _EducationalDetailsState();
}

class _EducationalDetailsState extends State<EducationalDetails> {
  TextEditingController _fieldOfStudyController = TextEditingController();
  TextEditingController _degreeController = TextEditingController();
  TextEditingController _collegeController = TextEditingController();
  TextEditingController _graduationYearController = TextEditingController();
  TextEditingController _coursesController = TextEditingController();
  TextEditingController _certificatesController = TextEditingController();



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
                    'Educational Details',
                    style: GoogleFonts.oswald(
                        fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                sectionHeading("Highest Degree Attained (Primary)"),
                InputField(
                    hinttext: "Field of Study (eg: Science,Arts)",
                    inputController: _fieldOfStudyController),
                InputField(
                    hinttext: "Degree Name (eg: BTech)",
                    inputController: _degreeController),
                InputField(
                    hinttext: "College Name",
                    inputController: _collegeController),
                InputField(
                    hinttext: "Graduation Year",
                    inputController: _graduationYearController),
                sectionHeading("Additional Education (Secondary)"),
                InputField(
                    hinttext: "Courses (eg: full-stack,Designing comma seperated)",
                    inputController: _coursesController),
                InputField(
                    hinttext: "Certifications (Provide google drive link comma seperated)",
                    inputController: _certificatesController),
                goToNextPage(preScreenName: "Personal Details",nextScreenName:  "Professional Details", preAction:  () {
                    Navigator.pop(context, widget.userDetails);
                   }, nextAction: () async {
                    widget.userDetails.educationDetails = {
                      "fieldOfStudy": _fieldOfStudyController.text,
                      "degreeName": _degreeController.text,
                      "collegeName": _collegeController.text,
                      "graduationYear": _graduationYearController.text,
                      "courses": List<String>.from(_coursesController.text.split(",")),
                      "certificates": _certificatesController.text.split(","),
                    };
                    widget.userDetails = await Navigator.push(context, MaterialPageRoute(builder: ((context) => ProfessionalDetails(userDetails: widget.userDetails,))));

                    })
              ],
            )),
      ),
    );
  }
}
