import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/data/countries.dart';
import 'package:resume_builder/models/UserDetails.dart';
import 'package:resume_builder/pages/educationalDetailsScreen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:resume_builder/pages/commonWidgets.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  late UserDetails userDetails;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  

  // bool _isDropDownOpen = false;
  var _selectedCountry = countries.first["name"];
  // var _selectedCountryCode =
  // (countries.first["callingCodes"] as List<String>).first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                      'Personal Details',
                      style: GoogleFonts.oswald(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ),
                  InputField(
                      hinttext: "Full Name*",
                      inputController:_nameController),
                  // InputField(
                  //     hinttext: "DOB*", inputController: TextEditingController()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.5)),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: IconButton(
                          icon: Icon(Icons.calendar_month),
                          onPressed: () {
                            setState(() async {
                              _dobController.text = (await showPlatformDialog(
                                          context: context,
                                          builder: (context) => Calendar())
                                      as String)
                                  .split(" ")[0];
                            });
                          },
                        ),
                        title: TextField(
                            controller: _dobController,
                            decoration: InputDecoration(
                                hintStyle: GoogleFonts.oswald(
                                    color: Colors.grey.withOpacity(0.5)),
                                hintText: "yyyy-mm-dd (DOB)*",
                                border: InputBorder.none)),
                      ),
                    ),
                  ),
                  sectionHeading("Contact Details"),
                  InputField(
                      hinttext: "Mobile No*",
                      inputController: _mobileNumberController),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         border: Border.all(width: 0.5),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     child: Padding(
                  //       padding: const EdgeInsets.fromLTRB(14.0, 5, 14, 5),
                  //       child: Row(children: [
                  //         DropdownButton(
                  //             onTap: () {
                  //               setState(() {
                  //                 _isDropDownOpen = true;
                  //               });
                  //             },
                  //             underline: Container(),
                  //             value: _selectedCountryCode,
                  //             items: countries.map((country) {
                  //               String callingcode =
                  //                   List<String>.from(country["callingCodes"])
                  //                       .first;
                  //               return DropdownMenuItem(
                  //                   value: callingcode,
                  //                   child: Container(
                  //                     width: 250,
                  //                     child: Text(
                  //                         "+${callingcode} ${_selectedCountryCode == callingcode ? "" : country["name"]}"),
                  //                   ));
                  //             }).toList(),
                  //             onChanged: (e) {
                  //               setState(() {
                  //                 _selectedCountryCode = e as String;
                  //               });
                  //             }),
                  //             // TextField(
                  //             //   decoration: InputDecoration(hintText: "hi"),
                  //             // ),
                  //       ]),

                  //     ),
                  //   ),
                  // ),
                  InputField(
                      hinttext: "Email",
                      inputController: _emailController),
                  sectionHeading("country"),
                  _countrySelection(context),
                  goToNextPage(
                      preScreenName: "Home",
                      nextScreenName: "Education Details",
                      preAction: () {
                        Navigator.pop(context);
                      },
                      nextAction: () async {
                        userDetails = UserDetails(personalDetails: {
                          "name": _nameController.text,
                          "dob": _dobController.text,
                          "mobileNo": _mobileNumberController.text,
                          "email": _emailController.text,
                          "country": _selectedCountry,
                        });
                        userDetails = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EducationalDetails(
                                    userDetails: userDetails)));
                      })
                ],
              )),
        ));
  }

  Padding _countrySelection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 5, 14, 5),
          child: DropdownButton(
              icon: Icon(Icons.arrow_drop_down_circle_outlined),
              underline: Container(),
              value: _selectedCountry,
              items: countries.map((country) {
                return DropdownMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      country["name"],
                      style: GoogleFonts.oswald(),
                    ),
                  ),
                  value: country["name"],
                );
              }).toList(),
              onChanged: (e) {
                setState(() {
                  _selectedCountry = e;
                });
              }),
        ),
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  Calendar({super.key});

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: AlertDialog(
          content: TableCalendar(
            focusedDay: widget._focusedDay,
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(3000, 12, 31),
            calendarFormat: widget._calendarFormat,
            selectedDayPredicate: (day) => isSameDay(widget._selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                widget._focusedDay = focusedDay;
                widget._selectedDay = selectedDay;
                Navigator.pop(context, widget._selectedDay.toString());
              });
            },
          ),
        ),
      ),
    );
  }
}
