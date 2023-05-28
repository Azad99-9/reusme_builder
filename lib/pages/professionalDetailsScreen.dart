import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/models/UserDetails.dart';
import 'package:resume_builder/pages/ProjectDetailScreen.dart';
import 'package:resume_builder/pages/commonWidgets.dart';

class ProfessionalDetails extends StatefulWidget {
  ProfessionalDetails({super.key, required this.userDetails});


  UserDetails userDetails;
  @override
  State<ProfessionalDetails> createState() => _ProfessionalDetailsState();
}

class _ProfessionalDetailsState extends State<ProfessionalDetails> {
  List<String> technicalSkills = [];
  List<String> softSkills = [];

  TextEditingController _techSkillController = TextEditingController();
  TextEditingController _softSkillController = TextEditingController();
  TextEditingController _jobTitleController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _durationController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _responsibilityController = TextEditingController();
  TextEditingController _pastInternController = TextEditingController();


  ScrollController technicalSkillsScroller = ScrollController();
  ScrollController softSkillsScroller = ScrollController();

  // @override
  // void initState() {
  //   final ProfessionalDetails = widget.userDetails.professionalDetails;
  //   if (ProfessionalDetails != null) {

  //     technicalSkills = ProfessionalDetails["technicalSkills"];
  //     softSkills = ProfessionalDetails["softSkills"];
  //     _jobTitleController.text = ProfessionalDetails["pastJobTitle"];
  //     _companyNameController.text = ProfessionalDetails["pastCompanyName"];
  //     _durationController.text = ProfessionalDetails["duration"];
  //     _responsibilityController = ProfessionalDetails["pastResponsibilites"];
  //     _descriptionController = ProfessionalDetails["pastWorkExperience"];
  //     _pastInternController = ProfessionalDetails["internExperience"];
  //   }
  //   super.initState();
  // }

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
                    'Professional Details',
                    style: GoogleFonts.oswald(
                        fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Skills',
                    style: GoogleFonts.oswald(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                sectionHeading("Technical Skills"),
                InputField(
                    hinttext: "Enter Skill (eg: Flutter,Firebase)",
                    inputController: _techSkillController),
                _addSkillButton(
                  () {
                    setState(() {
                      final currentSkill = _techSkillController.text;
                      _techSkillController.text = "";
                      if (currentSkill != "" &&
                          !technicalSkills.contains(currentSkill))
                        technicalSkills.add(currentSkill);
                      technicalSkillsScroller.animateTo(
                        technicalSkillsScroller.position.maxScrollExtent,
                        duration: Duration(
                            milliseconds: 100), // Set the desired duration
                        curve:
                            Curves.easeInOut, // Set the desired animation curve
                      );
                    });
                  },
                ),
                _skillDisplaySection(context, technicalSkills,
                    technicalSkillsScroller, Icons.handyman),
                sectionHeading("Soft Skills"),
                InputField(
                    hinttext: "Enter Skill (eg: communication,decision-making)",
                    inputController: _softSkillController),
                _addSkillButton(
                  () {
                    setState(() {
                      final currentSkill = _softSkillController.text;
                      _softSkillController.text = "";
                      if (currentSkill != "" &&
                          !softSkills.contains(currentSkill))
                        softSkills.add(currentSkill);
                      softSkillsScroller.animateTo(
                        softSkillsScroller.position.maxScrollExtent,
                        duration: Duration(
                            milliseconds: 100), // Set the desired duration
                        curve:
                            Curves.easeInOut, // Set the desired animation curve
                      );
                    });
                  },
                ),
                _skillDisplaySection(context, softSkills, softSkillsScroller,
                    Icons.local_hospital_outlined),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Experience',
                    style: GoogleFonts.oswald(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                sectionHeading("Past Positions"),
                InputField(
                    hinttext: "Job Title (eg: front-end-developer)",
                    inputController: _jobTitleController),
                InputField(
                    hinttext: "Company (eg: Coding Junior)",
                    inputController: _companyNameController),
                InputField(
                    hinttext: "Duration (In months)",
                    inputController: _durationController),
                
                fourLineInput(hinttext: "responsibilities (comma seperated)", inputController: _responsibilityController),
                fourLineInput(hinttext: "description", inputController: _descriptionController,),
                sectionHeading("Past Internships/Volunteer Experience"),
                fourLineInput(hinttext: "Past Intern Experience", inputController: _pastInternController),
                goToNextPage(
                    preScreenName: "Educational Details",
                    nextScreenName: "Project Details",
                    preAction: () {
                      Navigator.pop(context, widget.userDetails);
                    },
                    nextAction: () async {
                      widget.userDetails.professionalDetails = {
                        "technicalSkills": technicalSkills,
                        "softSkills": softSkills,
                        "pastJobTitle": _jobTitleController.text,
                        "pastCompanyName": _companyNameController.text,
                        "duration": _durationController.text,
                        "pastResponsibilites": _responsibilityController.text.split(","),
                        "pastWorkExperience": _descriptionController.text,
                        "internExperience": _pastInternController.text,
                      };
                      widget.userDetails = await Navigator.push(context, MaterialPageRoute(builder: ((context) => ProjectDetails(userDetails: widget.userDetails))));
                    })
              ],
            )),
      ),
    );
  }

  Padding _skillDisplaySection(BuildContext context, List<String> skills,
      ScrollController scrollController, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.1),
            border: Border.all(width: 0.5)),
        padding: EdgeInsets.all(14),
        child: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: skills.map((e) => Skill(e, skills, icon)).toList(),
          ),
        ),
      ),
    );
  }

  Padding _addSkillButton(Function()? onClick) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) return Colors.white;
              return Colors.blue;
            }),
            foregroundColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) return Colors.blue;
              return Colors.white;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: onClick,
          child: Text("Add Skill")),
    );
  }

  Padding Skill(String skill, List<String> skills, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // controls the position of the shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5),
        ),
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22),
            SizedBox(width: 10),
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                skill,
                style: GoogleFonts.oswald(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.close, size: 22),
              onPressed: () {
                setState(() {
                  skills.remove(skill);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
