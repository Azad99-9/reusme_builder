import 'package:flutter/material.dart';
import 'package:resume_builder/models/UserDetails.dart';
import 'package:resume_builder/pages/commonWidgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Preview extends StatelessWidget {
  Preview({super.key, required this.userDetails});

  UserDetails userDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
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
                    'Resume',
                    style: GoogleFonts.oswald(
                        fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Personal Details",
                    style: GoogleFonts.oswald(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                keyValue(
                    key: "Full Name",
                    value: userDetails.personalDetails["name"]),
                keyValue(
                    key: "Date Of Birth",
                    value: userDetails.personalDetails["dob"]),
                keyValue(
                    key: "Country",
                    value: userDetails.personalDetails["country"]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Contact Details",
                    style: GoogleFonts.oswald(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                keyValue(
                    key: "Mobile No",
                    value: userDetails.personalDetails["mobileNo"]),
                keyValue(
                    key: "Email", value: userDetails.personalDetails["email"]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Educational Details",
                    style: GoogleFonts.oswald(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                keyValue(
                    key: "Field-Of-Study",
                    value: userDetails.educationDetails!["fieldOfStudy"]),
                keyValue(
                    key: "Degree",
                    value: userDetails.educationDetails!["degreeName"]),
                // keyValue(key: "College", value: userDetails.educationDetails!["collegName"]),
                keyValue(
                    key: "Year-Of-Graduation",
                    value: userDetails.educationDetails!["graduationYear"]),
                listKeyValue(
                    key: "Courses",
                    values: (userDetails.educationDetails!["courses"]
                        as List<String>)),
                listKeyValue(
                    key: "Certificates",
                    values: (userDetails.educationDetails!["certificates"]
                        as List<String>)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Professional Details",
                    style: GoogleFonts.oswald(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                sectionHeading("Skills"),
                listKeyValue(key: "Technical Skills", values: (userDetails.professionalDetails!["technicalSkills"])),
                listKeyValue(key: "Soft Skills", values: (userDetails.professionalDetails!["softSkills"])),
                sectionHeading("Experience"),
                keyValue(key: "Past-Job-Title", value: userDetails.professionalDetails!["pastJobTitle"]),
                keyValue(key: "Past-Company-Name", value: userDetails.professionalDetails!["pastCompanyName"]),
                keyValue(key: "Duration", value: "${userDetails.professionalDetails!["duration"]} months"),
                listKeyValue(key: "Responsibilities", values: userDetails.professionalDetails!["pastResponsibilites"]),
                keyValue(key: "Past-Work-Experience", value: userDetails.professionalDetails!["pastWorkExperience"]),
                keyValue(key: "Internship Experience", value:  userDetails.professionalDetails!["internExperience"]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Projects & Achievements",
                    style: GoogleFonts.oswald(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                sectionHeading("Project Details"),
                keyValue(key: "Project-Name", value: userDetails.AchievementDetails!["projectName"]),
                keyValue(key: "Role-In-Project", value: userDetails.AchievementDetails!["roleName"]),
                listKeyValue(key: "Project-Outcomes", values: userDetails.AchievementDetails!["projectOutcomes"]),
                keyValue(key: "Description", value: userDetails.AchievementDetails!["projectDescription"]),
                listKeyValue(key: "Project-links", values: userDetails.AchievementDetails!["projectLinks"]),
                listKeyValue(key: "Achievement-links", values: userDetails.AchievementDetails!["achievementLinks"])

              ],
            )),
      ),
    );
  }

  Padding listKeyValue({required String key, required List<String> values}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Container(
            child: Text(
              "${key}:",
              style:
                  GoogleFonts.oswald(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: values.map((e) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 8, 8),
              child: Container(
                child: Text(
                  e,
                  style: GoogleFonts.oswald(),
                ),
              ),
            );
          }).toList(),
        )
      ]),
    );
  }

  Widget keyValue({required String key, required String value}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Container(
            child: Text(
              "${key}:",
              style:
                  GoogleFonts.oswald(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 8, 8),
          child: Container(
            child: Text(
              value,
              style: GoogleFonts.oswald(),
            ),
          ),
        )
      ]),
    );
  }
}
