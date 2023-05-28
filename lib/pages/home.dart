import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/pages/Preview.dart';
import 'package:resume_builder/pages/ProjectDetailScreen.dart';
import 'package:resume_builder/pages/personalDetailsScreen.dart';
import 'package:resume_builder/pages/educationalDetailsScreen.dart';
import 'package:resume_builder/pages/professionalDetailsScreen.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: PersonalDetails(),
      );
  }
}
